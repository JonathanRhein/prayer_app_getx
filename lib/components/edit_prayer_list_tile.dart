import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/prayer_list_section_heading.dart';
import 'package:prayer_app_getx/components/subtitle_text.dart';
import 'package:prayer_app_getx/components/switch_list_tile_cstm.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class EditPrayerListTile extends StatelessWidget {
  final int index;
  final hourController = AgpeyaHourController.find;
  final textService = TextService();
  final translationService = TranslationService();

  EditPrayerListTile(this.index);

  @override
  Widget build(context) {
    dynamic listItem = hourController.prayerList[index];

    return Padding(
      /* add some padding at the bottom of the list */
      padding: hourController.prayerList.length - 1 == index
          ? EdgeInsets.only(bottom: Styles.GeneralPadding)
          : EdgeInsets.only(),
      child: listItem is String
          ? Padding(
              padding: EdgeInsets.only(
                  left: Styles.GeneralPadding,
                  right: Styles.GeneralPadding,
                  top: Styles.GeneralPadding,
                  bottom: Styles.ButtonSpacing),
              child: PrayerListSectionHeading(('agpeya.' + listItem).tr),
            )
          : GetBuilder<AgpeyaHourController>(
              builder: (_) {
                bool isPrayerEnabled = hourController.isPrayerEnabled(index);
                return SwitchListTileCustom(
                  value: isPrayerEnabled,
                  onChanged: (_) => hourController.togglePrayerEnabled(index),
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyText(
                            translationService.getTranslation(
                                listItem.name, 'title'),
                            enabled: isPrayerEnabled),
                        SubtitleText(
                            textService.getTextPreview(translationService
                                .getTranslation(listItem.name, 'text')),
                            enabled: isPrayerEnabled)
                      ]),
                );
              },
            ),
    );
  }
}
