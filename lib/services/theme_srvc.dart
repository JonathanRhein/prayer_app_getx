import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';

class ThemeService {
  final storage = GetStorage();
  final _key = Strings.IsDarkMode;

  // Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  // Get info about light or dark mode in boolean representation
  bool get isLightMode => _loadTheme();

  // Load isDarkMode from local storage and if it's empty, returns false 
  //  (that means default theme is light)
  bool _loadTheme() =>
      storage.read(_key) ?? ThemeMode.system != ThemeMode.light;

  /// Save isDarkMode to local storage
  saveTheme(bool isDarkMode) => storage.write(_key, isDarkMode);

  // Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!_loadTheme());
  }
}
