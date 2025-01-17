import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/bottom_sheet_text.dart';
import 'package:prayer_app_getx/controllers/text_settings_ctl.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class TextSettings extends StatelessWidget {
  final settingsController = Get.put(TextSettingsController());

  TextSettings();

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(Styles.GeneralPadding),
      child: GetBuilder<TextSettingsController>(
        builder: (_) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _changeFontSizeControls(context),
                _changeTextAlignmentControls(context),
                _changeLineSpacingControls(context),
                _changeFontFamilyControls(context),
                _changeThemeModeControls(context),
                SizedBox(
                  height: Styles.ButtonSpacing,
                ),
                _changeSettingsControls(context),
                SizedBox(
                  height: Styles.ButtonSpacing,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Row _changeFontSizeControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary:
                    settingsController.fontSizeText < Styles.FontSizeTextMin
                        ? context.theme.shadowColor
                        : context.theme.primaryColorDark),
            onPressed: () =>
                settingsController.fontSizeText < Styles.FontSizeTextMin
                    ? {}
                    : settingsController.changeFontSize(FontSize.smaller),
            child: Text(
              'settings.decrease_font'.tr,
              textScaleFactor: 0.8,
            )),
        SizedBox(
          width: Styles.ButtonSpacing,
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary:
                    settingsController.fontSizeText > Styles.FontSizeTextMax
                        ? context.theme.shadowColor
                        : context.theme.primaryColorDark),
            onPressed: () =>
                settingsController.fontSizeText > Styles.FontSizeTextMax
                    ? {}
                    : settingsController.changeFontSize(FontSize.larger),
            child: Text(
              'settings.increase_font'.tr,
              textScaleFactor: 1.2,
            ))
      ],
    );
  }

  Row _changeTextAlignmentControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _changeTextAlignmentButton(
            context, Strings.Left, Icons.format_align_left),
        SizedBox(
          width: Styles.ButtonSpacing,
        ),
        _changeTextAlignmentButton(
            context, Strings.Center, Icons.format_align_center),
        SizedBox(
          width: Styles.ButtonSpacing,
        ),
        _changeTextAlignmentButton(
            context, Strings.Justify, Icons.format_align_justify),
      ],
    );
  }

  OutlinedButton _changeTextAlignmentButton(
      BuildContext context, textAlignment, icon) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: settingsController.textAlignment ==
                        TextService().stringToTextAlign(textAlignment)
                    ? context.theme.accentColor
                    : context.theme.primaryColorLight)),
        onPressed: () => settingsController.changeTextAlignment(textAlignment),
        child: Icon(icon));
  }

  Row _changeLineSpacingControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.format_line_spacing, color: context.theme.primaryColorDark),
        SizedBox(
          width: Styles.ButtonSpacing,
        ),
        Slider(
          min: Styles.LineSpacingMin,
          max: Styles.LineSpacingMax,
          onChanged: (value) {
            settingsController.setLineSpacing(value);
          },
          value: settingsController.lineSpacing,
        ),
      ],
    );
  }

  Row _changeFontFamilyControls(BuildContext context) {
    // TODO: If Arabic or Korean are ever added please add more fonts and make menu
    // dependent on locale
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _changeFontFamilyButton(context, Strings.OpenSans),
        SizedBox(
          width: Styles.ButtonSpacing,
        ),
        _changeFontFamilyButton(context, Strings.Crimson),
        SizedBox(
          width: Styles.ButtonSpacing,
        ),
        _changeFontFamilyButton(context, Strings.Montserrat)
      ],
    );
  }

  OutlinedButton _changeFontFamilyButton(BuildContext context, fontFamily) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: settingsController.fontFamily == fontFamily
                    ? context.theme.accentColor
                    : context.theme.primaryColorLight)),
        onPressed: () => settingsController.changeFontFamily(fontFamily),
        child: Text(
          fontFamily,
          style: TextStyle(fontFamily: fontFamily),
        ));
  }

  Row _changeThemeModeControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BottomSheetText('settings.dark_mode'.tr),
        Switch(
            inactiveThumbColor: Get.context.theme.primaryColorLight,
            value: settingsController.isDarkMode,
            onChanged: (value) => settingsController.changeThemeMode(value)),
      ],
    );
  }

  Row _changeSettingsControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () => settingsController.resetSettings(),
            child: Text('general.reset'.tr.toUpperCase())),
        ElevatedButton(
            onPressed: () {
              navigator.pop();
              Get.toNamed(Strings.SettingsRoute);
            },
            child: Text('settings.title'.tr.toUpperCase()))
      ],
    );
  }
}
