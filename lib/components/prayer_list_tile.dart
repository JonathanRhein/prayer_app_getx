import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/headline2_text.dart';
import 'package:prayer_app_getx/components/subtitle_text.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class PrayerListTile extends StatelessWidget {
  final int index;
  final AgpeyaPrayerController controller;
  final textService = TextService();
  final translationService = TranslationService();

  PrayerListTile(this.index, this.controller);

  @override
  Widget build(context) {
    dynamic listItem = controller.prayerList[index];
    return InkWell(
      onTap: () => Get.toNamed('/agpeya_text', arguments: index),
      child: Padding(
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
