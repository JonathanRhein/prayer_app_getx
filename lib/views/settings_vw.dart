import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controller/settings_ctl.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_vw.dart';
import 'package:prayer_app_getx/utils/styles/dark_theme.dart';
import 'package:prayer_app_getx/utils/styles/light_theme.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_vw.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  final SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerView(),
        body: Stack(
          children: [
            ListView(
                itemExtent: 50,
                padding: EdgeInsets.only(top: 320),
                children: <Widget>[
                  Center(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 50, right: 30),
                      onTap: () => _settingsController.changeTheme(),
                      leading: Text('color_scheme'.tr),  
                      trailing: Text(_settingsController.currentTheme.tr)
                    ),
                  ),
                ],
              ),
            AppBarView(title: 'settings'.tr, hasBackButton: true),
          ],
          
        ));
  }
}

