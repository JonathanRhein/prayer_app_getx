import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/app_bar_cstm.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';

class AgpeyaPrayerView extends StatelessWidget {
  final ctl = Get.put(AgpeyaPrayerController(Get.arguments));

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
              title: ctl.getTrnsltn('title'),
              hasBackButton: true,
              backgroundImage: ctl.getTrnsltn('icon'),
            ),
          ],
        ));
  }

  _listItemBuilder(int index) {
    return Container();
  }
}
