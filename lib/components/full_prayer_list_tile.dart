import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/prayer_heading.dart';
import 'package:prayer_app_getx/components/prayer_section_heading.dart';
import 'package:prayer_app_getx/components/prayer_text.dart';
import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controller/text_settings_ctl.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class FullTextListTile extends StatelessWidget {
  final int index;
  final hourController = AgpeyaHourController.find;
  final textService = TextService();
  final translationService = TranslationService();

  FullTextListTile(this.index);

  @override
  Widget build(context) {
    dynamic listItem = hourController.prayerList[index];
    // TODO: adjust spacings according to text size
    return GetBuilder<TextSettingsController>(
        builder: (_) => Padding(
            padding: EdgeInsets.only(
                bottom: hourController.prayerList.length - 1 == index
                    ? Styles.GeneralPadding
                    : 0,
                left: Styles.ScreenLeftPadding,
                right: Styles.ScreenRightPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (listItem is String) ...[
                  SizedBox(
                    height: 30,
                  ),
                  PrayerSectionHeading(('agpeya.' + listItem).tr)
                ] else ...[
                  SizedBox(height: 20),
                  PrayerHeading(translationService.getTranslation(
                      listItem.name, 'title')),
                  SizedBox(height: 5),
                  PrayerText(
                      translationService.getTranslation(listItem.name, 'text')),
                  SizedBox(height: 10)
                ]
              ],
            )));
  }
}
