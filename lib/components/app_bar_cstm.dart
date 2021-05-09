import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/app_bar_background.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class AppBarCustom extends StatelessWidget {
  final bool hasBackButton;
  final String title;

  AppBarCustom({this.title, this.hasBackButton: true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.theme.primaryColor,
        shape: AppBarBackground(),
        shadows: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 70.0, left: Styles.screenLeftPadding),
      height: 370,
      child: Padding(
        padding: EdgeInsets.only(right: Styles.screenRightPadding),
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
                    : Container(),
                GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () => Scaffold.of(context).openEndDrawer()),
              ],
            ),
            SizedBox(
              height: 70,
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
