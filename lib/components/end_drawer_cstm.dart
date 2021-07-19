import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';

class EndDrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: context.theme.accentColor),
              child: SizedBox()),
          ListTile(
              title: Text(
                'settings.title'.tr,
                textAlign: TextAlign.end,
              ),
              onTap: () => {Get.back(), Get.toNamed(Strings.SettingsRoute)})
        ],
      ),
    );
  }
}
