import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/controller/language_ctl.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/utils/constants/app_routes.dart';
import 'package:prayer_app_getx/utils/localization.g.dart';
import 'package:prayer_app_getx/utils/themes.dart';

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
              translations: Localization(),
              theme: Themes.light,
              darkTheme: Themes.dark,
              themeMode: ThemeService().theme,
              debugShowCheckedModeBanner: false,
              getPages: AppRoutes.routes,
              initialRoute: '/agpeya_list',
              // builder inserts the AnnotatedRegion above all subsequent routes (i.e. widgets)
              // and handles the switch of font color of the status bar (time, signal, battery etc.)
              // when switching modes
              builder: (context, child) => AnnotatedRegion(
                child: child,
                value: ThemeService().isLightMode
                    ? SystemUiOverlayStyle.light
                    : SystemUiOverlayStyle.dark,
              ),
            ));
  }
}
