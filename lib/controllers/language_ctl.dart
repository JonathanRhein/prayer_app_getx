import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui' as ui;

import 'package:prayer_app_getx/utils/constants/languages.dart';

class LanguageController extends GetxController {
  static LanguageController get find => Get.find();
  final language = "".obs;
  final _storedPreferences = GetStorage();
  final _key = 'language';
  List<String> _languageList = [];
  int currentLanguageIndex;
  String selectedLanguage = "";

  String get currentLanguage => language.value;

  @override
  void onReady() async {
    _setInitialLocalLanguage();
    _getLanguageIndex();
    super.onInit();
  }

  // Retrieves and Sets language based on device settings
  _setInitialLocalLanguage() {
    if ((currentLanguageStore.value == '') ||
        (currentLanguageStore.value == null)) {
      String _deviceLanguage = ui.window.locale.toString();
      _deviceLanguage =
          _deviceLanguage.substring(0, 2); //only get 1st 2 characters
      print(ui.window.locale.toString());
      updateLanguage(_deviceLanguage);
    }
  }

// Gets current language stored
  RxString get currentLanguageStore {
    language.value = _storedPreferences.read(_key) ?? '';
    return language;
  }

// gets the language locale app is set to
  Locale get getLocale {
    if (currentLanguageStore.value == '') {
      language.value = Languages.defaultLanguage;
      updateLanguage(Languages.defaultLanguage);
    } else if (currentLanguageStore.value != '') {
      //set the stored string country code to the locale
      return Locale(currentLanguageStore.value);
    }
    // gets the default language key for the system.
    return Get.deviceLocale;
  }

// updates the language stored
  Future<void> updateLanguage(String value) async {
    language.value = value;
    await _storedPreferences.write(_key, value);
    Get.updateLocale(getLocale);
    update();
  }

  /* Below code is for handling the language switcher dialog in settings */

  // retrieves the index of current language within list of languages in Globals
  _getLanguageIndex() {
    Languages.languageOptions
        .asMap()
        .entries
        .forEach((element) => _languageList.add(element.value.token));
    currentLanguageIndex =
        _languageList.indexWhere((element) => currentLanguage == element);
  }

  // updates the language choose dialog when clicking
  selectLanguage(value) {
    selectedLanguage = _languageList[value];
    currentLanguageIndex = value;
    update();
  }

  String getLanguageForToken(token) {
    return Languages.languageOptions.firstWhere((language) => language.token == token).language;
  }
}
