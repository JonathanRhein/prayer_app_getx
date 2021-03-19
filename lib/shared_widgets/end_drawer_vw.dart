import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/localizations.dart';

class EndDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
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
                labels.settings.title,
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
