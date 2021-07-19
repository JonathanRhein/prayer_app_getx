import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/services/scroll_srvc.dart';
import 'package:prayer_app_getx/services/text_srvc.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AgpeyaPrayerController extends GetxController {
  static AgpeyaPrayerController get find => Get.find();
  final index;

  AgpeyaPrayerController(this.index);

  final textService = TextService();
  final themeService = ThemeService();

  final showMenus = false.obs;
  final _sharedPreferences = GetStorage();
  final autoScrollController = ItemScrollController();
  final itemPositionListener = ItemPositionsListener.create();
  var scrollDirection = ScrollDirection.forward;
  final _scrollService = ScrollService();
  final triggerTextRebuild = false.obs;

  double fontSizeSectionHeading;
  double fontSizePrayerHeading;
  double fontSizeText;
  bool fontSizeMaxReached;
  bool fontSizeMinReached;

  TextAlign textAlignment;

  double lineSpacing;

  String fontFamily;

  bool isDarkMode;

  @override
  void onInit() async {
    super.onInit();

    setupScrolling();
    initializeSettings();
  }

  void toggleMenus() => showMenus.value = !showMenus.value;

  void setupScrolling() {
    // perform automatic scroll-action after UI is fully built to index of
    // respective list chosen in agpeya_hour_vw.dart
    Future.delayed(
        Duration.zero,
        () => autoScrollController.scrollTo(
            index: index,
            duration: Duration(milliseconds: 1500),
            curve: Curves.easeInOutCubic));

    // toggle Menus on scroll action performed by the user. Menu disappears on
    // scroll down action
    itemPositionListener.itemPositions.addListener(() {
      var newScrollDirection = _scrollService.determineScrollDirection(
          itemPositionListener.itemPositions.value.first);

      if (scrollDirection != newScrollDirection) {
        showMenus.value =
            newScrollDirection == ScrollDirection.forward ? false : true;
        scrollDirection = newScrollDirection;
      }
    });
  }

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
