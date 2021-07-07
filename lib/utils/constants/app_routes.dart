import 'package:get/get.dart';
import 'package:prayer_app_getx/views/agpeya_list_vw.dart';
import 'package:prayer_app_getx/views/agpeya_hour_vw.dart';
import 'package:prayer_app_getx/views/agpeya_prayer_vw.dart';
import 'package:prayer_app_getx/views/home_vw.dart';
import 'package:prayer_app_getx/views/settings_vw.dart';

class AppRoutes {
  AppRoutes._(); // this is to prevent anyone from instantiating this class
  static final routes = [
    GetPage(name: '/', page: () => HomeView()),
    GetPage(name: '/agpeya_list', page: () => AgpeyaListView()),
    GetPage(name: '/agpeya_prayer', page: () => AgpeyaHourView()),
    GetPage(name: '/agpeya_text', page: () => AgpeyaPrayerView()),
    GetPage(name: '/settings', page: () => SettingsView()),
  ];
}
