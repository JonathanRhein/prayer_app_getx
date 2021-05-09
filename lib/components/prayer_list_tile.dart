import 'package:flutter/material.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/subtitle_text.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class PrayerListTile extends StatelessWidget {
  final String title;
  final String text;
  final String hour;
  final textService = TextService();

  PrayerListTile(this.title, this.text, this.hour);

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: EdgeInsets.only(
            left: Styles.screenLeftPadding, right: Styles.screenRightPadding),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      BodyText(title),
                      SubtitleText(textService.getTextPreview(text))
                    ])),
                Icon(Icons.navigate_next),
              ],
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
