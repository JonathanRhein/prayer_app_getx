import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/link_text.dart';
import 'package:prayer_app_getx/components/list_section_heading.dart';
import 'package:prayer_app_getx/components/subtitle_text.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/models/presentation/agpeya_prayer.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class ShortPrayerListTile extends StatelessWidget {
  final int index;
  final AgpeyaHourController hourController;
  final textService = TextService();
  final translationService = TranslationService();

  ShortPrayerListTile(this.index, this.hourController);

  @override
  Widget build(context) {
    dynamic listItem = hourController.prayerList[index];

    return Padding(
        /* add some padding at the bottom of the list */
        padding: hourController.prayerList.length - 1 == index
            ? EdgeInsets.only(bottom: Styles.GeneralPadding)
            : EdgeInsets.only(),
        child: listItem is String
            ? _getSectionHeadingTile(listItem)
            : _getPrayerTile(listItem));
  }

  Widget _getSectionHeadingTile(String heading) {
    return Padding(
      padding: EdgeInsets.only(
          left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          ListSectionHeading(('agpeya.' + heading).tr)
        ],
      ),
    );
  }

  Widget _getPrayerTile(AgpeyaPrayer prayer) {
    BuildContext context = Get.context;
    bool isPrayerEnabled = hourController.isPrayerEnabled(index);
    return InkWell(
      onLongPress: () => _togglePrayerEnabledDialog(prayer),
      onTap: () => isPrayerEnabled
          ? Get.toNamed(Strings.AgpeyaPrayerRoute, arguments: index)
          : _enablePrayerSnackbar(),
      child: Padding(
        padding: EdgeInsets.only(
            left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      BodyText(
                          translationService.getTranslation(
                              prayer.name, 'title'),
                          enabled: isPrayerEnabled, isMarian: prayer.isMarian == 1,),
                      SubtitleText(
                          textService.getTextPreview(translationService
                              .getTranslation(prayer.name, 'text')),
                          enabled: isPrayerEnabled, isMarian: prayer.isMarian == 1,)
                    ])),
                Icon(
                  Icons.navigate_next,
                  color: isPrayerEnabled
                      ? context.theme.accentColor
                      : context.theme.scaffoldBackgroundColor,
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _togglePrayerEnabledDialog(AgpeyaPrayer prayer) {
    BuildContext context = Get.context;
    Get.dialog(AlertDialog(
      content: RichText(
        text: TextSpan(
          style: context.textTheme.bodyText1,
          text: hourController.isPrayerEnabled(index)
              ? 'general.disable'.tr
              : 'general.enable'.tr,
          children: <TextSpan>[
            TextSpan(
              text: " ",
            ),
            TextSpan(
                text: translationService.getTranslation(prayer.name, 'title'),
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                )),
            TextSpan(
              text: "?",
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: LinkText('general.yes'.tr),
          onPressed: () async {
            hourController.togglePrayerEnabled(index);
            Get.back();
          },
        ),
        TextButton(
          child: LinkText('general.no'.tr),
          onPressed: () => Get.back(),
        ),
      ],
    ));
  }

  _enablePrayerSnackbar() {
    Get.snackbar(
      '',
      '',
      onTap: (_) => hourController.togglePrayerEnabled(index),
      titleText: BodyText('agpeya.activate_this_prayer_again'.tr),
      mainButton: TextButton(
          onPressed: () => hourController.togglePrayerEnabled(index),
          child: LinkText('general.activate'.tr)),
    );
  }
}
