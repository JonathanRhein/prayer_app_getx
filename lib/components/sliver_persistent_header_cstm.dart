import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/navigational_icon.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controllers/sliver_header_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

// TODO: check why screenLeftPaddingIncrease is not stored when updating theme
// but reset to zero. Tried to solve by adding it to the controller but no luck 
// so far. titleReachedTop preserves state through this method

// The SliverPersistentHeader is constantly supplied with the most current
// scroll offset (shrinkOffset) from the user with regard to the SliverList.
// Thereby it is possible to gradually adjust position, size and coloring of
// the various elements of the header (i.e. title, navigation icons, background
// image opacity)

class SliverPersistentHeaderCustom extends SliverPersistentHeaderDelegate {
  // Controller is introduced to preserve the state of some of the variables
  // necessary to build this header (e.g. titleReachedTop) as these variables
  // are otherwise reset on an GetX update
  final controller = Get.put(SliverHeaderController());
  final String title;
  final String icon;
  final bool hasBackButton;
  final hourController = AgpeyaHourController.find;

  final double headerMaximumHeight = 400.0;
  final double headerMinimumHeight = 50.0;

  final imageOpacity = .45;

  final translationService = TranslationService();

  double scrollRatio = 0;
  double screenLeftPaddingIncrease = 0;
  double appBarHeightDelta = 0;
  GlobalKey _titleKey = GlobalKey();
  double distanceLeftPaddingToTitle = 0;
  double safeAreaHeight;

  SliverPersistentHeaderCustom(
    this.title, {
    this.icon: "",
    this.hasBackButton: true,
  });

  calculateMeasures(_) {
    // In order for the header to work as "pinnable", the main challenge was to
    // change the alignment of the title gradually from left to the center upon
    // scrolling. This is achieved by calculating the distance from the left most
    // "corner" of the left aligned title to the left most "corner" of the
    // centered title. Upon scrolling this distance is proportionally added as
    // left padding to the title resulting in rightwards movement of the title
    // until it is perfectly centered. Once this centered position is reached, the
    // allignment property of the title changes (through setting titleReachedTop
    //  = true) and the title is decreased in size through the effect of FittedBox

    RenderBox renderTitle = _titleKey.currentContext.findRenderObject();
    double titleWidth = renderTitle.size.width;
    double screenCenter = Get.width / 2;
    double xPositionTitle = screenCenter - titleWidth / 2;
    distanceLeftPaddingToTitle = xPositionTitle - Styles.ScreenLeftPadding;

    // If the title is very long the distanceLeftPddingToTitle will be negative.
    // In these cases the title should be centered from the very start
    if (distanceLeftPaddingToTitle < 0) {
      controller.titleReachedTop = true;
    } else {
      Offset titlePosition = renderTitle.localToGlobal(Offset.zero);
      // This check prevents jitter of the FittedBox containing the title text.
      // titleReachedTop is set to true once. Once it is true, it will never be
      // evaluated unless the scroll direction changes.
      if (!controller.titleReachedTop &&
          hourController.scrollDirection == ScrollDirection.reverse) {
        controller.titleReachedTop =
            titlePosition.dy <= (safeAreaHeight + Styles.GeneralPadding);
      } else if (controller.titleReachedTop &&
          hourController.scrollDirection == ScrollDirection.forward) {
        controller.titleReachedTop =
            titlePosition.dy <= (safeAreaHeight + Styles.GeneralPadding);
      }
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Is called to calculate various measures for the transformation of
    // postion properties while scrolling.

    safeAreaHeight = Get.mediaQuery.padding.top;
    WidgetsBinding.instance.addPostFrameCallback(calculateMeasures);
    appBarHeightDelta = maxExtent - minExtent;

    scrollRatio = shrinkOffset / (appBarHeightDelta - safeAreaHeight);

    double newImageOpacity = imageOpacity * max((1 - scrollRatio), 0);

    int newBackgroundRGBValue = min(245, (245 * scrollRatio).round());

    int newElementsRGBValue = max(31, (250 * (1 - scrollRatio)).round());

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          OverflowBox(
            maxHeight: constraints.biggest.height + headerMinimumHeight,
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize(
              size: constraints.biggest +
                  Offset(0, max(0, headerMinimumHeight - shrinkOffset)),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(shadows: [
                  BoxShadow(
                    color: context.theme.shadowColor,
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ),
                ], shape: SliverPersistenHeaderCustomShape(shrinkOffset)),
                child: Container(
                    color: Get.isDarkMode
                        ? Color.fromRGBO(6, 6, 6, 1)
                        : Color.fromRGBO(newBackgroundRGBValue,
                            newBackgroundRGBValue, newBackgroundRGBValue, 1),
                    child: Opacity(
                        opacity: newImageOpacity,
                        child: Image.asset(icon, fit: BoxFit.cover))),
              ),
            ),
          ),
          Align(
              alignment: controller.titleReachedTop
                  ? Alignment.bottomCenter
                  : Alignment.bottomLeft,
              child: getTitle(shrinkOffset)),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    left: Styles.ScreenLeftPadding,
                    right: Styles.ScreenRightPadding,
                    top: Styles.ButtonSpacing),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        this.hasBackButton
                            ? NavigationalIcon(Icons.arrow_back,
                                () => Get.back(), newElementsRGBValue)
                            : SizedBox(),
                        NavigationalIcon(
                            Icons.menu,
                            () => Scaffold.of(context).openEndDrawer(),
                            newElementsRGBValue),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      );
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => headerMaximumHeight;

  @override
  double get minExtent => headerMinimumHeight;

  Widget getTitle(shrinkOffset) {
    double scrollRatio = shrinkOffset / (appBarHeightDelta - safeAreaHeight);

    if (shrinkOffset <= appBarHeightDelta) {
      screenLeftPaddingIncrease = distanceLeftPaddingToTitle * scrollRatio;
    }

    int newElementsRGBValue = max(31, (250 * (1 - scrollRatio)).round());

    return Padding(
      padding: EdgeInsets.only(
          top: Styles.GeneralPadding / 2,
          bottom: Styles.GeneralPadding / 2,
          right: Styles.ScreenRightPadding,
          left: Styles.ScreenLeftPadding +
              (controller.titleReachedTop ? 0 : screenLeftPaddingIncrease)),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          title,
          key: _titleKey,
          style: Get.context.textTheme.headline1.copyWith(
            color: Get.isDarkMode
                ? Get.context.theme.primaryColorDark
                : Color.fromRGBO(newElementsRGBValue, newElementsRGBValue,
                    newElementsRGBValue, 1),
          ),
        ),
      ),
    );
  }
}

class SliverPersistenHeaderCustomShape extends ShapeBorder {
  final double shrinkOffset;

  SliverPersistenHeaderCustomShape(this.shrinkOffset);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    double radius = max(0, 50 - shrinkOffset);

    final leftRect = Rect.fromCircle(
        center: rect.bottomLeft + Offset(radius, 0), radius: radius);
    final rightRect = Rect.fromCircle(
        center: rect.bottomRight + Offset(-radius, -2 * radius),
        radius: radius);
    return Path()
      ..lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
      ..arcTo(leftRect, pi, pi * 0.5, false)
      ..arcTo(rightRect, pi * 0.5, pi * -0.5, false)
      ..lineTo(rect.topRight.dx, rect.topRight.dy);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
