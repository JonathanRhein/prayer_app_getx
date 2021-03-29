import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controller/language_ctl.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_cstm.dart';
import 'package:prayer_app_getx/shared_widgets/body_text.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_cstm.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/shared_widgets/link_text.dart';
import 'package:prayer_app_getx/shared_widgets/switch_list_tile_cstm.dart';
import 'package:prayer_app_getx/utils/constants/languages.dart';


class SettingsView extends StatelessWidget {
  @override
  Widget build(context) {
    final labels = AppLocalizations.of(context);
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
            AppBarCustom(title: labels.settings.title, hasBackButton: true),
          ],
        ));
  }
}

switchThemeListTile(BuildContext context) {
  final labels = AppLocalizations.of(context);
  return SwitchListTileCustom(
      value: ThemeService().isLightMode,
      onChanged: (_) => ThemeService().switchTheme(),
      title: labels.settings.darkMode);
}

switchLanguageListTile(BuildContext context) {
  final labels = AppLocalizations.of(context);
  return GetBuilder<LanguageController>(
      builder: (controller) => ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: BodyText(labels.settings.language),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: BodyText(
              controller.getLanguageForToken(controller.currentLanguage),
            ),
          ),
          onTap: () {
            Get.dialog(GetBuilder<LanguageController>(
                builder: (controller) => AlertDialog(
                      title: BodyText(labels.settings.chooseLanguage),
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
                          child: LinkText(labels.general.save),
                          onPressed: () async {
                            await controller
                                .updateLanguage(controller.selectedLanguage);
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: LinkText(labels.general.close),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    )));
          }));
}
