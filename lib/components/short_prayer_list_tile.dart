import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/prayer_list_section_heading.dart';
import 'package:prayer_app_getx/components/prayer_section_heading.dart';
import 'package:prayer_app_getx/components/subtitle_text.dart';
import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class ShortPrayerListTile extends StatelessWidget {
  final int index;
  final AgpeyaHourController controller;
  final textService = TextService();
  final translationService = TranslationService();

  ShortPrayerListTile(this.index, this.controller);

  @override
  Widget build(context) {
    dynamic listItem = controller.prayerList[index];

    // TODO: Remove inkwell from headings in prayer view

    // TODO: Increase font of headings in hour list view golden text

    return InkWell(
      onTap: () => Get.toNamed(Strings.AgpeyaPrayerRoute, arguments: index),
      child: Padding(
        padding: EdgeInsets.only(
            left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
        child: listItem is String
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  PrayerListSectionHeading(('agpeya.' + listItem).tr)
                ],
              )
            : Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            BodyText(translationService.getTranslation(
                                listItem.name, 'title')),
                            SubtitleText(textService.getTextPreview(
                                translationService.getTranslation(
                                    listItem.name, 'text')))
                          ])),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  SizedBox(height: 10)
                ],
              ),
      ),
    );
  }
}
