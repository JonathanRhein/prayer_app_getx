import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controller/language_ctl.dart';
import 'package:prayer_app_getx/controller/settings_ctl.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/shared_widgets/dropdown_picker.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_vw.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_vw.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/globals.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
        endDrawer: EndDrawerView(),
        body: Stack(
          children: [
            ListView(
              itemExtent: 60,
              padding: EdgeInsets.only(top: 320, left: 30, right: 10),
              children: <Widget>[
                SwitchListTile(
                    value: ThemeService().isLightMode,
                    onChanged: (_) => ThemeService().switchTheme(),
                    title: Text(
                      labels.settings.darkMode,
                      style: context.textTheme.bodyText1,
                    )),
                // languageListTile(context),
                myLanguageListTile(context),
              ],
            ),
            AppBarView(title: labels.settings.title, hasBackButton: true),
          ],
        ));
  }
}

/* languageListTile(BuildContext context) {
  final labels = AppLocalizations.of(context);
  return GetBuilder<LanguageController>(
    builder: (controller) => ListTile(
      title: Text(labels.settings.language),
      trailing: DropdownPicker(
        menuOptions: Globals.languageOptions,
        selectedOption: controller.currentLanguage,
        onChanged: (value) async {
          await controller.updateLanguage(value);
          Get.forceAppUpdate();
        },
      ),
    ),
  );
} */

myLanguageListTile(BuildContext context) {
  final labels = AppLocalizations.of(context);
  return ListTile(
      leading: Text(
        labels.settings.language,
        style: context.textTheme.bodyText1,
      ),
      onTap: () {
        Get.dialog(GetBuilder<LanguageController>(
            builder: (controller) => AlertDialog(
                  title: Text(
                    labels.settings.chooseLanguage,
                    style: context.textTheme.bodyText1,
                  ),
                  content: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: Globals.languageOptions
                          .asMap()
                          .entries
                          .map((item) => RadioListTile(
                                activeColor: context.theme.accentColor,
                                title: Text(item.value.language,
                                    style: context.textTheme.bodyText1),
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
                      child: Text(
                        labels.general.save,
                        style: context.textTheme.bodyText2,
                      ),
                      onPressed: () async {
                        await controller
                            .updateLanguage(controller.selectedLanguage);
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: Text(
                        labels.general.close,
                        style: context.textTheme.bodyText2,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                )));
      });
}
