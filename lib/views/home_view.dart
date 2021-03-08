import 'package:flutter/material.dart';
import 'package:prayer_app_getx/utils/styles/dark_theme.dart';
import 'package:prayer_app_getx/utils/styles/light_theme.dart';
import 'package:prayer_app_getx/widgets/app_bar_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarView(title: 'title'.tr, hasBackButton: false),
            TextButton(onPressed: () => {Get.changeTheme(Get.isDarkMode? lightTheme(): darkTheme())
}, child: Text('Change'))
          ],
        ));
  }
}
