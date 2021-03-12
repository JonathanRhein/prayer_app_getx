import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
            child: Container()
          ),
          ListTile(
              title: Text(
                'settings'.tr,
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
