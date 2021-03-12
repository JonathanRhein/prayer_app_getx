import 'package:flutter/material.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_vw.dart';
import 'package:prayer_app_getx/utils/styles/dark_theme.dart';
import 'package:prayer_app_getx/utils/styles/light_theme.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_vw.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerView(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarView(title: 'title'.tr, hasBackButton: false),
            TextButton(onPressed: () => {Get.changeTheme(Get.isDarkMode? lightTheme(): darkTheme())}, child: Text('Change'))
          ],
        ));
  }
}
