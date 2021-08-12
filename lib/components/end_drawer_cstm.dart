import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/link_text.dart';
import 'package:prayer_app_getx/components/list_section_heading.dart';
import 'package:prayer_app_getx/controllers/agpeya_list_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class EndDrawerCustom extends StatelessWidget {
  final agpeyaListController = AgpeyaListController.find;
  final translationService = TranslationService();

  // TODO: on back after click on agpeya hour make drawer pop!

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              color: context.theme.accentColor,
            ),
            child: SizedBox()),
        _getHeadingTile(
          'settings.general'.tr,
        ),
        _getLinkTile('settings.title'.tr, Icons.settings_outlined,
            Strings.SettingsRoute),
        _getHeadingTile('agpeya.title'.tr),
        _getLinkTile('agpeya.information'.tr, null, Strings.AgpeyaInformation),
        ...List.generate(agpeyaListController.databaseList.length,
            (index) => _getAgpeyaHours(index)),
        SizedBox(
          height: Styles.ButtonSpacing,
        )
      ],
    ));
  }

  Widget _getHeadingTile(title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 40),
      child: ListSectionHeading(
        title,
        padding: true,
        scaleFactor: 1.5,
      ),
    );
  }

  Widget _getAgpeyaHours(index) {
    String hour = agpeyaListController.databaseList[index].name;
    return ListTile(
      contentPadding: EdgeInsets.only(
          left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
      onTap: () => Get.toNamed(Strings.AgpeyaHourRoute, arguments: hour),
      leading: translationService.getTranslation(hour, 'latinNumber') == ""
          ? SizedBox()
          : LinkText(
              translationService.getTranslation(hour, 'latinNumber'),
              fontFamily: Strings.Vidaloka,
            ),
      title: BodyText(translationService.getTranslation(hour, 'title')),
      trailing: Icon(Icons.navigate_next),
    );
  }

  Widget _getLinkTile(title, icon, route) {
    return ListTile(
        contentPadding: EdgeInsets.only(
            left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
        title: Row(
          children: [
            if (icon == null)
              ...[]
            else ...[
              Icon(icon),
              SizedBox(
                width: Styles.ButtonSpacing,
              ),
            ],
            Text(
              title,
              textAlign: TextAlign.end,
            ),
          ],
        ),
        trailing: Icon(Icons.navigate_next),
        onTap: () => {Get.back(), Get.toNamed(route)});
  }
}
