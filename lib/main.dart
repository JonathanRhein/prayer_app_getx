import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/styles/light_theme.dart';
import 'package:prayer_app_getx/utils/i18n/translations.dart';
import 'package:prayer_app_getx/views/agpeya_hours_view.dart';
import 'package:prayer_app_getx/views/home_view.dart';

void main() => runApp(PrayerApp());

class PrayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: PATranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      getPages: [
        GetPage(name: "/", page: () => HomeView()),
        GetPage(name: "/agpeya_hours", page: () => AgpeyaHoursView()),
      ],
      initialRoute: "/",
    );
  }
}