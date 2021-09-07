import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/services/scroll_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AgpeyaPrayerController extends GetxController {
  static AgpeyaPrayerController get find => Get.find();
  final initialIndex = Get.arguments[1];
  int currentIndex;

  final showMenus = false.obs;
  final scrollController = ItemScrollController();
  final itemPositionListener = ItemPositionsListener.create();
  ScrollDirection scrollDirection = ScrollDirection.forward;
  final _scrollService = ScrollService();
  bool reachedTop;

  bool showTableOfContents = false;

  @override
  void onInit() async {
    super.onInit();
    setupScrolling();
  }

  void toggleMenus() => showMenus.value = !showMenus.value;

  void dismissMenu() {
    showMenus.value = false;
    showTableOfContents = true;
  }

  void enableMenu() => showTableOfContents = false;

  void setupScrolling() {
    // perform automatic scroll-action after UI is fully built to index of
    // respective is chosen in agpeya_hour_vw.dart
    Future.delayed(
        Duration.zero,
        () => scrollController.scrollTo(
            index: initialIndex,
            duration: Styles.ScrollDurationLong,
            curve: Curves.easeInOutCubic));

    // toggle Menus on scroll action performed by the user. Menu disappears on
    // scroll down action
    itemPositionListener.itemPositions.addListener(() {
      ItemPosition item = itemPositionListener.itemPositions.value.first;
      currentIndex = item.index;
      ScrollDirection newScrollDirection =
          _scrollService.determineScrollDirection(item);

      if (!showTableOfContents) {
        if (scrollDirection != newScrollDirection) {
          showMenus.value =
              newScrollDirection == ScrollDirection.forward ? false : true;
          scrollDirection = newScrollDirection;
        }
        showMenus.value =
            _scrollService.reachedTop(item) ? false : showMenus.value;
      }
    });
  }

  void scrollToPrayer(index) => scrollController.scrollTo(
      index: index, duration: Styles.ScrollDurationShort);
}
