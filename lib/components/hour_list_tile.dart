import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/headline2_text.dart';
import 'package:prayer_app_getx/controllers/agpeya_list_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class HourListTile extends StatelessWidget {
  final index;
  final listController = AgpeyaListController.find;
  final translationService = TranslationService();

  HourListTile(this.index);

  @override
  Widget build(context) {
    String hour = listController.databaseList[index].name;
    return InkWell(
      onTap: () =>
          // second item of the argument list indicates whether there should be
          // a edit button or not
          Get.toNamed(Strings.AgpeyaHourRoute, arguments: hour),
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
                    translationService.getTranslation(hour, 'icon'),
                    fit: BoxFit.fitHeight,
                  ),
                )),
                SizedBox(width: 15),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Headline2Text(
                          translationService.getTranslation(hour, 'title')),
                      BodyText(
                          translationService.getTranslation(hour, 'subtitle'))
                    ])),
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
