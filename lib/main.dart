import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/controller/language_ctl.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/utils/styles/themes.dart';
import 'package:prayer_app_getx/views/agpeya_hours_vw.dart';
import 'package:prayer_app_getx/views/home_vw.dart';
import 'package:prayer_app_getx/views/settings_vw.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<LanguageController>(LanguageController());
  runApp(PrayerApp());
}

class PrayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (languageController) => GetMaterialApp(
        locale: languageController.getLocale,
        localizationsDelegates: [
          const AppLocalizationsDelegate(), 
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.languages.keys.toList(),
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => HomeView()),
          GetPage(name: '/agpeya_hours', page: () => AgpeyaHoursView()),
          GetPage(name: '/settings', page: () => SettingsView()),
        ],
        initialRoute: '/',
      )
    );
  }
}
