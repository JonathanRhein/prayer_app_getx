import 'package:flutter/material.dart';
import 'package:prayer_app_getx/components/list_section_heading.dart';
import 'package:prayer_app_getx/components/paragraph_text.dart';
import 'package:prayer_app_getx/controllers/language_ctl.dart';
import 'package:prayer_app_getx/controllers/agpeya_settings_ctl.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/components/general_app_bar.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/link_text.dart';
import 'package:prayer_app_getx/components/switch_list_tile_cstm.dart';
import 'package:prayer_app_getx/utils/constants/languages.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class SettingsView extends StatelessWidget {
  final languageController = LanguageController.find;
  final agpeyaSettingsController = Get.put(AgpeyaSettingsController());

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            GetBuilder<AgpeyaSettingsController>(
              builder: (_) {
                return ListView(
                  padding: EdgeInsets.only(
                    top: Styles.PaddingUnderneathGeneralAppBar,
                  ),
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    ListSectionHeading('settings.general'.tr, padding: true),
                    _switchThemeListTile(),
                    _switchLanguageListTile(),
                    SizedBox(
                      height: 40,
                    ),
                    ListSectionHeading('agpeya.title'.tr, padding: true),
                    _switchShowOnlyBiblicalTexts(),
                    _switchShowMarianTexts(),
                    _resetTextsToDefaultButton(),
                    SizedBox(
                      height: 40,
                    ),
                    /* TODO: ListSectionHeading(
                      'settings.text'.tr,
                      padding: true,
                    ),
                    TextSettings(alignment: Strings.Left),
                    SizedBox(
                      height: 40,
                    ), */
                    ListSectionHeading('settings.contact'.tr, padding: true),
                    SizedBox(
                      height: 5,
                    ),
                    ParagraphText(
                      'settings.contact_text'.tr,
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                );
              },
            ),
            GeneralAppBar(title: 'settings.title'.tr, hasBackButton: true),
          ],
        ));
  }

  Widget _switchThemeListTile() {
    return SwitchListTileCustom(
        value: ThemeService().isLightMode,
        onChanged: (_) => ThemeService().switchTheme(),
        title: BodyText('settings.dark_mode'.tr));
  }

  Widget _switchLanguageListTile() {
    BuildContext context = Get.context;
    return GetBuilder<LanguageController>(
        builder: (controller) => ListTile(
            contentPadding: EdgeInsets.only(
                left: Styles.ScreenLeftPadding,
                right: Styles.ScreenRightPadding),
            leading: BodyText('settings.language'.tr),
            trailing: BodyText(
              controller.getLanguageForToken(controller.currentLanguage),
            ),
            onTap: () => Get.dialog(GetBuilder<LanguageController>(
                builder: (_) => AlertDialog(
                      title: BodyText('settings.choose_language'.tr),
                      content: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: Languages.languages
                              .map((item) => RadioListTile(
                                    activeColor: context.theme.accentColor,
                                    title: BodyText(item.value.language),
                                    groupValue:
                                        languageController.currentLanguageIndex,
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
                            await languageController.updateLanguage(
                                languageController.selectedLanguage);
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
                    )))));
  }

  Widget _switchShowOnlyBiblicalTexts() {
    return SwitchListTileCustom(
        value: agpeyaSettingsController.showOnlyBiblicalTexts,
        onChanged: (_) => agpeyaSettingsController
            .togglePrayerEnabledSettings(Strings.ShowOnlyBiblicalTexts),
        title: BodyText('agpeya.only_biblical_texts'.tr));
  }

  Widget _switchShowMarianTexts() {
    return SwitchListTileCustom(
        value: agpeyaSettingsController.showMarianTexts,
        onChanged: (_) => agpeyaSettingsController
            .togglePrayerEnabledSettings(Strings.ShowMarianTexts),
        title: BodyText('agpeya.show_marian_texts'.tr));
  }

  Widget _resetTextsToDefaultButton() {
    return InkWell(
      onTap: () => agpeyaSettingsController.resetTextsToDefault(),
      child: ListTile(
          contentPadding: EdgeInsets.only(
              left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
          title: Row(
            children: [
              BodyText('agpeya.reset_text_settings'.tr),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward)
            ],
          )),
    );
  }
}
