import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/views/agpeya_information.dart';
import 'package:prayer_app_getx/views/agpeya_list_vw.dart';
import 'package:prayer_app_getx/views/agpeya_hour_vw.dart';
import 'package:prayer_app_getx/views/agpeya_prayer_vw.dart';
import 'package:prayer_app_getx/views/edit_prayer_vw.dart';
import 'package:prayer_app_getx/views/home_vw.dart';
import 'package:prayer_app_getx/views/settings_vw.dart';

class AppRoutes {
  AppRoutes._(); // this is to prevent anyone from instantiating this class
  static final routes = [
    GetPage(name: Strings.HomeRoute, page: () => HomeView()),
    GetPage(name: Strings.AgpeyaListRoute, page: () => AgpeyaListView()),
    GetPage(name: Strings.AgpeyaHourRoute, page: () => AgpeyaHourView()),
    GetPage(name: Strings.AgpeyaPrayerRoute, page: () => AgpeyaPrayerView()),
    GetPage(name: Strings.SettingsRoute, page: () => SettingsView()),
    GetPage(name: Strings.EditPrayerRoute, page: () => EditPrayerView()),
    GetPage(name: Strings.AgpeyaInformation, page: () => AgpeyaInformation()),
  ];
}
