import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/general_app_bar_background.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class GeneralAppBar extends StatelessWidget {
  final bool hasBackButton;
  final String title;
  final bool hasEditButton;

  GeneralAppBar(
      {this.title, this.hasBackButton: true, this.hasEditButton: false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.theme.primaryColor,
        shape: GeneralAppBarBackground(),
        shadows: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 70.0, left: Styles.ScreenLeftPadding),
      height: 370,
      child: Padding(
        padding: EdgeInsets.only(right: Styles.ScreenRightPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                this.hasBackButton
                    ? GestureDetector(
                        child: Icon(Icons.arrow_back),
                        onTap: () => Get.back(),
                      )
                    : SizedBox(),
                GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () => Scaffold.of(context).openEndDrawer()),
              ],
            ),
            SizedBox(
              height: Styles.ButtonSpacing,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                hasEditButton
                    ? GestureDetector(
                        child: Icon(Icons.edit_outlined),
                        onTap: () => Get.toNamed(Strings.EditPrayerRoute))
                    : SizedBox()
              ],
            ),
            SizedBox(
              height: hasEditButton ? 70 - Styles.ButtonSpacing : 70,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                style: context.textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
