import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controllers/language_ctl.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/components/general_app_bar.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/link_text.dart';
import 'package:prayer_app_getx/components/switch_list_tile_cstm.dart';
import 'package:prayer_app_getx/utils/constants/languages.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class SettingsView extends StatelessWidget {
  final languageController = LanguageController.find;

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            ListView(
              itemExtent: 60,
              padding:
                  EdgeInsets.only(top: Styles.PaddingUnderneathGeneralAppBar),
              children: <Widget>[
                _switchThemeListTile(context),
                _switchLanguageListTile(context)
              ],
            ),
            GeneralAppBar(title: 'settings.title'.tr, hasBackButton: true),
          ],
        ));
  }

  _switchThemeListTile(BuildContext context) {
    return SwitchListTileCustom(
        value: ThemeService().isLightMode,
        onChanged: (_) => ThemeService().switchTheme(),
        title: BodyText('settings.dark_mode'.tr));
  }

  _switchLanguageListTile(BuildContext context) {
    return GetBuilder<LanguageController>(
        builder: (controller) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Padding(
              padding: EdgeInsets.only(left: Styles.ScreenLeftPadding),
              child: BodyText('settings.language'.tr),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(right: Styles.ScreenRightPadding),
              child: BodyText(
                controller.getLanguageForToken(controller.currentLanguage),
              ),
            ),
            onTap: () => switchLanguageDialog(context)));
  }

  switchLanguageDialog(BuildContext context) {
    Get.dialog(GetBuilder<LanguageController>(
        builder: (_) => AlertDialog(
              title: BodyText('settings.choose_language'.tr),
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
                            groupValue: languageController.currentLanguageIndex,
                            value: item.key,
                            onChanged: (value) {
                              languageController.selectLanguage(value);
                            },
                          ))
                      .toList(),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: LinkText('general.save'.tr),
                  onPressed: () async {
                    await languageController
                        .updateLanguage(languageController.selectedLanguage);
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
}
