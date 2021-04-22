import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndDrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: context.theme.accentColor),
            child: Container()
          ),
          ListTile(
              title: Text(
                'settings.title'.tr,
                textAlign: TextAlign.end,
              ),
              onTap: () => {
                    Get.back(),
                    Get.toNamed('/settings')
                  })
        ],
      ),
    );
  }
}
