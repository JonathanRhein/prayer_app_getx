import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class PrayerAppBar extends StatelessWidget {
  final bool hasBackButton;
  final String title;
  final prayerController = AgpeyaPrayerController.find;

  PrayerAppBar({Key key, this.title, this.hasBackButton: true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.primaryColor.withOpacity(0.7),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor.withOpacity(0.7),
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 0.0, left: Styles.screenLeftPadding),
      height: 50,
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
                    : SizedBox(),
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
