import 'package:get/get.dart';
import 'package:prayer_app_getx/views/agpeya_vw.dart';
import 'package:prayer_app_getx/views/home_vw.dart';
import 'package:prayer_app_getx/views/settings_vw.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this class
  static final routes = [
    GetPage(name: '/', page: () => HomeView()),
    GetPage(name: '/agpeya', page: () => AgpeyaView()),
    GetPage(name: '/settings', page: () => SettingsView()),
  ];
}
