import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/bottom_sheet_text.dart';
import 'package:prayer_app_getx/components/box_decoration_cstm.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class PrayerAppMenus extends StatelessWidget {
  final bool hasBackButton;
  final String title;
  final prayerController = AgpeyaPrayerController.find;

  PrayerAppMenus({Key key, this.title, this.hasBackButton: true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _topMenu(context),
        _bottomMenu(context),
      ],
    );
  }

  Widget _topMenu(BuildContext context) {
    return Container(
      decoration: BoxDecorationCustom.getCustomBoxDecoration(),
      padding: EdgeInsets.only(top: 0.0, left: Styles.ScreenLeftPadding),
      height: 50,
      child: Padding(
        padding: EdgeInsets.only(right: Styles.ScreenRightPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasBackButton
                ? GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: () => Get.back(),
                  )
                : SizedBox(),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(title, style: context.textTheme.headline5),
            ),
            GestureDetector(
                child: Icon(Icons.menu),
                onTap: () => Scaffold.of(context).openEndDrawer()),
          ],
        ),
      ),
    );
  }

  Widget _bottomMenu(BuildContext context) {
    return Container(
      decoration: BoxDecorationCustom.getCustomBoxDecoration(),
      padding: EdgeInsets.only(top: 10),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              child: Icon(Icons.text_format),
              onTap: () => _showTextFormatBottomSheet()),
        ],
      ),
    );
  }

  void _showTextFormatBottomSheet() {
    var context = Get.context;
    Get.bottomSheet(
      GetBuilder<AgpeyaPrayerController>(
        builder: (_) {
          return Padding(
            padding: EdgeInsets.all(Styles.GeneralPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _changeFontSizeControls(context),
                _changeTextAlignmentControls(context),
                _changeLineSpacingControls(context),
                _changeFontFamilyControls(context),
                _changeThemeModeControls(context)
              ],
            ),
          );
        },
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
    );
  }

  Row _changeFontSizeControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: prayerController.fontSizeText < Styles.FontSizeTextMin
                    ? context.theme.shadowColor
                    : context.theme.primaryColorDark),
            onPressed: () =>
                prayerController.fontSizeText < Styles.FontSizeTextMin
                    ? {}
                    : prayerController.changeFontSize(FontSize.smaller),
            child: Text(
              'settings.decrease_font'.tr,
              textScaleFactor: 0.8,
            )),
        SizedBox(
          width: Styles.ButtonSpacing,
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: prayerController.fontSizeText > Styles.FontSizeTextMax
                    ? context.theme.shadowColor
                    : context.theme.primaryColorDark),
            onPressed: () =>
                prayerController.fontSizeText > Styles.FontSizeTextMax
                    ? {}
                    : prayerController.changeFontSize(FontSize.larger),
            child: Text(
              'settings.increase_font'.tr,
              textScaleFactor: 1.2,
            ))
      ],
    );
  }

  Row _changeTextAlignmentControls(BuildContext context) {
    // TODO: adjust frame color of outline button --> look into colorscheme
    // official documentation of outlinedbutton
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
                color: prayerController.textAlignment ==
                        TextService().stringToTextAlign(textAlignment)
                    ? context.theme.accentColor
                    : context.theme.primaryColorLight)),
        onPressed: () => prayerController.changeTextAlignment(textAlignment),
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
            prayerController.setLineSpacing(value);
          },
          value: prayerController.lineSpacing,
        ),
      ],
    );
  }

  Row _changeFontFamilyControls(BuildContext context) {
    // If Arabic or Korean are ever added please add more fonts and make menu
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
                color: prayerController.fontFamily == fontFamily
                    ? context.theme.accentColor
                    : context.theme.primaryColorLight)),
        onPressed: () => prayerController.changeFontFamily(fontFamily),
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
            value: prayerController.isDarkMode,
            onChanged: (value) => prayerController.changeThemeMode(value)),
      ],
    );
  }
}
