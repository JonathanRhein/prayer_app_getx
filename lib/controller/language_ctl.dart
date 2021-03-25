import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'dart:ui' as ui;

import 'package:prayer_app_getx/utils/constants/globals.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final language = "".obs;
  final _box = GetStorage();
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
    language.value = _box.read(_key);
    return language;
  }

  // gets the language locale app is set to
  Locale get getLocale {
    if ((currentLanguageStore.value == '') ||
        (currentLanguageStore.value == null)) {
      language.value = Globals.defaultLanguage;
      updateLanguage(Globals.defaultLanguage);
    }
    // gets the default language key (from the translation language system)
    Locale _updatedLocal = AppLocalizations.languages.keys.first;
    // looks for matching language key stored and sets to it
    AppLocalizations.languages.keys.forEach((locale) {
      if (locale.languageCode == currentLanguage) {
        _updatedLocal = locale;
      }
    });
    //print('getLocale: ' + _updatedLocal.toString());
    return _updatedLocal;
  }

// updates the language stored
  Future<void> updateLanguage(String value) async {
    language.value = value;
    await _box.write(_key, value);
    Get.updateLocale(getLocale);
    update();
  }

  /* Below code is for handling the language switcher dialog in settings */

  // retrieves the index of current language within list of languages in Globals
  _getLanguageIndex() {
    Globals.languageOptions
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
    return Globals.languageOptions.firstWhere((language) => language.token == token).language;
  }
}
