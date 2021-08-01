import 'package:flutter/rendering.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class TextSettingsController extends GetxController {
  static TextSettingsController get find => Get.find();

  @override
  void onInit() async {
    initializeSettings();
    super.onInit();
  }

  final textService = TextService();
  final themeService = ThemeService();
  final _sharedPreferences = GetStorage();

  double fontSizeSectionHeading;
  double fontSizePrayerHeading;
  double fontSizeText;
  bool fontSizeMaxReached;
  bool fontSizeMinReached;

  TextAlign textAlignment;

  double lineSpacing;

  String fontFamily;

  bool isDarkMode;

  void initializeSettings() {
    // If settings are not in storage set the value to default values
    fontSizeSectionHeading =
        _sharedPreferences.read(Strings.FontSizeSectionHeading) ??
            Styles.FontSizeHeadline4;
    fontSizePrayerHeading =
        _sharedPreferences.read(Strings.FontSizePrayerHeading) ??
            Styles.FontSizeHeadline3;
    fontSizeText = _sharedPreferences.read(Strings.FontSizeText) ??
        Styles.FontSizeBodyText1;

    textAlignment = textService.stringToTextAlign(
        _sharedPreferences.read(Strings.TextAlignment) ?? Styles.TextAlignmnet);

    lineSpacing =
        _sharedPreferences.read(Strings.LineSpacing) ?? Styles.LineSpacing;

    fontFamily = _sharedPreferences.read(Strings.FontFamily) ??
        Styles.FontFamilyBodyText1;

    isDarkMode = themeService.isLightMode;
  }

  void changeFontSize(change) {
    if (change == FontSize.larger) {
      fontSizeSectionHeading++;
      fontSizePrayerHeading++;
      fontSizeText++;
    } else {
      fontSizeSectionHeading--;
      fontSizePrayerHeading--;
      fontSizeText--;
    }

    _sharedPreferences
      ..write(Strings.FontSizeSectionHeading, fontSizeSectionHeading)
      ..write(Strings.FontSizePrayerHeading, fontSizePrayerHeading)
      ..write(Strings.FontSizeText, fontSizeText);

    update();
  }

  void changeTextAlignment(alignment) {
    textAlignment = textService.stringToTextAlign(alignment);
    _sharedPreferences.write(Strings.TextAlignment, alignment);
    update();
  }

  void setLineSpacing(value) {
    lineSpacing = value;
    _sharedPreferences.write(Strings.LineSpacing, value);
    update();
  }

  void changeFontFamily(family) {
    fontFamily = family;
    _sharedPreferences.write(Strings.FontFamily, family);
    update();
  }

  void changeThemeMode(value) {
    isDarkMode = value;
    themeService.switchTheme();
    update();
  }

  void resetSettings() {
    fontSizeSectionHeading = Styles.FontSizeHeadline4;
    fontSizePrayerHeading = Styles.FontSizeHeadline3;
    fontSizeText = Styles.FontSizeBodyText1;
    textAlignment = textService.stringToTextAlign(Styles.TextAlignmnet);
    lineSpacing = Styles.LineSpacing;
    fontFamily = Styles.FontFamilyBodyText1;

    _sharedPreferences
      ..write(Strings.FontSizeSectionHeading, fontSizeSectionHeading)
      ..write(Strings.FontSizePrayerHeading, fontSizePrayerHeading)
      ..write(Strings.FontSizeText, fontSizeText)
      ..write(Strings.TextAlignment, Styles.TextAlignmnet)
      ..write(Strings.LineSpacing, lineSpacing)
      ..write(Strings.FontFamily, fontFamily);

    update();
  }
}
