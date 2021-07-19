import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/headline2_text.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class HourListTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String text;
  final String hour;

  HourListTile(this.imagePath, this.title, this.text, this.hour);

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => Get.toNamed('/agpeya_prayer', arguments: hour),
      child: Padding(
        padding: EdgeInsets.only(
            left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ClipOval(
                    child: SizedBox(
                  height: 80,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                )),
                SizedBox(width: 15),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Headline2Text(title), BodyText(text)])),
                Icon(Icons.navigate_next),
              ],
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
