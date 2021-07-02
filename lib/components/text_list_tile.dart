import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/headline2_text.dart';
import 'package:prayer_app_getx/components/prayer_heading.dart';
import 'package:prayer_app_getx/components/prayer_text.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class TextListTile extends StatelessWidget {
  final int index;
  final AgpeyaPrayerController controller;
  final textService = TextService();
  final translationService = TranslationService();

  TextListTile(this.index, this.controller);

  @override
  Widget build(context) {
    dynamic listItem = controller.prayerList[index];
    return Padding(
      padding: EdgeInsets.only(
          left: Styles.screenLeftPadding, right: Styles.screenRightPadding),
      child: listItem is String
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Headline2Text(('agpeya.' + listItem).tr)
              ],
            )
          : Column(
              children: [
                SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  PrayerHeading(translationService.getTranslation(
                      listItem.name, 'title')),
                  PrayerText(translationService.getTranslation(listItem.name, 'text'))
                ]),
                SizedBox(height: 10)
              ],
            ),
    );
  }
}
