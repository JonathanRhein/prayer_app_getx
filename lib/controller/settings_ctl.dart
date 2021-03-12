import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/styles/dark_theme.dart';
import 'package:prayer_app_getx/utils/styles/light_theme.dart';

class SettingsController extends GetxController {
  String currentTheme = Get.isDarkMode ? 'light' : 'dark';

  changeTheme() {
    if (Get.isDarkMode) {
      currentTheme = 'dark';
      Get.changeTheme(lightTheme());
    } else {
      currentTheme = 'light';
      Get.changeTheme(darkTheme());
    }
  }
}
