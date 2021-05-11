import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controller/language_ctl.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/components/app_bar_cstm.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/link_text.dart';
import 'package:prayer_app_getx/components/switch_list_tile_cstm.dart';
import 'package:prayer_app_getx/utils/constants/languages.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            ListView(
              itemExtent: 60,
              padding: EdgeInsets.only(top: 320),
              children: <Widget>[
                switchThemeListTile(context),
                switchLanguageListTile(context)
              ],
            ),
            AppBarCustom(title: 'settings.title'.tr, hasBackButton: true),
          ],
        ));
  }
}

switchThemeListTile(BuildContext context) {
  return SwitchListTileCustom(
      value: ThemeService().isLightMode,
      onChanged: (_) => ThemeService().switchTheme(),
      title: 'settings.dark_mode'.tr);
}

switchLanguageListTile(BuildContext context) {
  return GetBuilder<LanguageController>(
      builder: (controller) => ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Padding(
            padding: EdgeInsets.only(left: Styles.screenLeftPadding),
            child: BodyText('settings.language'.tr),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right: Styles.screenRightPadding),
            child: BodyText(
              controller.getLanguageForToken(controller.currentLanguage),
            ),
          ),
          onTap: () {
            switchLanguageDialog(context);
          }));
}

switchLanguageDialog(BuildContext context) {
  Get.dialog(GetBuilder<LanguageController>(
      builder: (controller) => AlertDialog(
            title: BodyText('settings.chooseLanguage'.tr),
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: Languages.languageOptions
                    .asMap()
                    .entries
                    .map((item) => RadioListTile(
                          activeColor: context.theme.accentColor,
                          title: BodyText(item.value.language),
                          groupValue: controller.currentLanguageIndex,
                          value: item.key,
                          onChanged: (value) {
                            controller.selectLanguage(value);
                          },
                        ))
                    .toList(),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: LinkText('general.save'.tr),
                onPressed: () async {
                  await controller.updateLanguage(controller.selectedLanguage);
                  Get.back();
                },
              ),
              TextButton(
                child: LinkText('general.close'.tr),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          )));
}
