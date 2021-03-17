import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/utils/i18n/translations.dart';
import 'package:prayer_app_getx/utils/styles/themes.dart';
import 'package:prayer_app_getx/views/agpeya_hours_vw.dart';
import 'package:prayer_app_getx/views/home_vw.dart';
import 'package:prayer_app_getx/views/settings_vw.dart';

void main() async {
  await GetStorage.init();
  runApp(PrayerApp());
}

class PrayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: PATranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/agpeya_hours', page: () => AgpeyaHoursView()),
        GetPage(name: '/settings', page: () => SettingsView()),
      ],
      initialRoute: '/settings',
    );
  }
}
