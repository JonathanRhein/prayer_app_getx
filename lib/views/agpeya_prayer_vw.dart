import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/app_bar_cstm.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/prayer_list_tile.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';

class AgpeyaPrayerView extends StatelessWidget {
  final ctl = Get.put(AgpeyaPrayerController(Get.arguments));
  final tS = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            Obx(() => ListView.builder(
                padding: EdgeInsets.only(top: 320),
                itemCount: ctl.dbList.length,
                itemBuilder: (context, index) => _listItemBuilder(index))),
            AppBarCustom(
              title: tS.getTrnsltn(ctl.hour, 'title'),
              hasBackButton: true,
            ),
          ],
        ));
  }

  _listItemBuilder(int index) {
    ctl.setPrayer(index);
    return PrayerListTile(tS.getTrnsltn(ctl.prayer, 'title'),
        tS.getTrnsltn(ctl.prayer, 'text'), ctl.hour);
  }
}
