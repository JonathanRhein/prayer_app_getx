import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/prayer_list_section_heading.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controllers/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/controllers/text_settings_ctl.dart';
import 'package:prayer_app_getx/models/databse/agpeya_prayer.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

import 'body_text.dart';

class TableOfContentsBottomSheet extends StatelessWidget {
  final settingsController = Get.put(TextSettingsController());
  final prayerController = AgpeyaPrayerController.find;
  final hourController = AgpeyaHourController.find;

  TableOfContentsBottomSheet();

  // TODO: Overflow Render for Trishagioon und Glaubensbekenntnis

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Styles.GeneralPadding, bottom: Styles.GeneralPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Styles.GeneralPadding, bottom: Styles.GeneralPadding),
            child: Text(
              'settings.toc'.tr,
              textScaleFactor: 1.6,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: hourController.prayerList.length,
                itemBuilder: (context, index) => _getTOCItem(index)),
          ),
        ],
      ),
    );
  }

  Widget _getTOCItem(index) {
    var listItem = hourController.prayerList[index];
    // check whether it is a section heading (String) or AgpeyaPrayer. Also 
    // check if there any enabled prayers for the section at all or in case of 
    // AgpeyaPrayer if the respective hour is enabled
    if (listItem is String &&
        hourController.sectionContainsAnyEnabledPrayers(index)) {
      return _getInkWellTOCItem(index);
    }
    if (listItem is AgpeyaPrayer && hourController.isPrayerEnabled(index)) {
      return _getInkWellTOCItem(index);
    }
    return SizedBox();
  }

  Widget _getInkWellTOCItem(index) {
    var listItem = hourController.prayerList[index];
    return InkWell(
      onTap: () => prayerController.scrollToPrayer(index),
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: Styles.GeneralPadding,
            right: Styles.GeneralPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            listItem is String
                ? PrayerListSectionHeading(('agpeya.' + listItem).tr)
                : BodyText(TranslationService()
                    .getTranslation(listItem.name, 'title')),
            Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }
}
