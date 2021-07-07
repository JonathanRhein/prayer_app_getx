import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/prayer_app_bar_background.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class PrayerAppBar extends StatelessWidget {
  final bool hasBackButton;
  final String title;

  PrayerAppBar({this.title, this.hasBackButton: true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.theme.primaryColor.withOpacity(0.6),
        shape: PrayerAppBarBackground(),
        shadows: [
          BoxShadow(
            color: context.theme.shadowColor.withOpacity(0.6),
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 70.0, left: Styles.screenLeftPadding),
      height: 150,
      child: Padding(
        padding: EdgeInsets.only(right: Styles.screenRightPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hasBackButton
                    ? GestureDetector(
                        child: Icon(Icons.arrow_back),
                        onTap: () => Get.back(),
                      )
                    : null,
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(title, style: context.textTheme.headline5),
                ),
                GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () => Scaffold.of(context).openEndDrawer()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
