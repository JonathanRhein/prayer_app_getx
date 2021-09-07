import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/list_section_heading.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controllers/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/controllers/text_settings_ctl.dart';
import 'package:prayer_app_getx/models/presentation/agpeya_prayer.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

import 'body_text.dart';

class TableOfContents extends StatelessWidget {
  final settingsController = Get.put(TextSettingsController());
  final prayerController = AgpeyaPrayerController.find;
  final hourController = Get.find<AgpeyaHourController>(tag: Get.arguments[0].hour);

  TableOfContents();

  // TODO: Overflow Render for Trishagioon und Glaubensbekenntnis

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Styles.GeneralPadding, bottom: Styles.GeneralPadding),
      child: ListView.builder(
          itemCount: hourController.prayerList.length,
          itemBuilder: (context, index) => _getTOCItem(index)),
    );
  }

  Widget _getTOCItem(index) {
    var listItem = hourController.prayerList[index];
    // check whether it is a section heading (String) or AgpeyaPrayer. Also
    // check if there any enabled prayers for the section at all or in case of
    // AgpeyaPrayer if the respective hour is enabled
    return (listItem is String &&
                hourController.sectionContainsAnyEnabledPrayers(
                    prayerListIndex: index)) ||
            (listItem is AgpeyaPrayer && hourController.isPrayerEnabled(index))
        ? InkWell(
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
                  if (listItem is String) ...[
                    ListSectionHeading(('agpeya.' + listItem).tr)
                  ] else ...[
                    BodyText(
                        TranslationService()
                            .getTranslation(listItem.name, 'title'),
                        isMarian: listItem.isMarian == 1),
                    Icon(Icons.navigate_next)
                  ],
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
