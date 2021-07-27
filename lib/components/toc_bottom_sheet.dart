import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/prayer_list_section_heading.dart';
import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/controller/text_settings_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

import 'body_text.dart';

class TableOfContentsBottomSheet extends StatelessWidget {
  final settingsController = Get.put(TextSettingsController());
  final prayerController = AgpeyaPrayerController.find;
  final hourController = AgpeyaHourController.find;

  TableOfContentsBottomSheet();

  @override
  Widget build(context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Styles.GeneralPadding,
          ),
          Expanded(
            child: CupertinoPicker(
              magnification: 1,
              scrollController: FixedExtentScrollController(
                  initialItem: prayerController.currentIndex),
              diameterRatio: 1000,
              backgroundColor: context.theme.scaffoldBackgroundColor,
              onSelectedItemChanged: (index) {
                prayerController.scrollToPrayer(index);
              },
              itemExtent: 50.0,
              children: _getCupertinoItems(),
            ),
          ),
          SizedBox(
            height: Styles.GeneralPadding + 20.0,
          ),
        ],
      ),
    );
  }

  List<Widget> _getCupertinoItems() {
    List<Widget> pickerList = [];
    for (var i = 0; i < hourController.prayerList.length; i++) {
      var listItem = hourController.prayerList[i];
      pickerList.add(Center(
          child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: listItem is String
              ? PrayerListSectionHeading(('agpeya.' + listItem).tr)
              : BodyText(
                  TranslationService().getTranslation(listItem.name, 'title')),
        ),
      )));
    }
    return pickerList;
  }
}
