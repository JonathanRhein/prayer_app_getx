import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controller/settings_ctl.dart';
import 'package:prayer_app_getx/services/theme_srvc.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_vw.dart';
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
              itemExtent: 60,
              padding: EdgeInsets.only(top: 320, left: 30, right: 10),
              children: <Widget>[
                SwitchListTile(
                    value: ThemeService().isLightMode,
                    onChanged: (_) => ThemeService().switchTheme(),
                    title: Text(
                      'dark_mode'.tr,
                      style: context.textTheme.bodyText1,
                    )),
                ListTile(
                  onTap: () =>
                      Get.updateLocale(Locale('de', 'DE')),
                  leading:
                      Text('language'.tr, style: context.textTheme.bodyText1),
                ),
              ],
            ),
            AppBarView(title: 'settings'.tr, hasBackButton: true),
          ],
        ));
  }
}
