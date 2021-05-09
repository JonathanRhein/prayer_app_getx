import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/agpeya_list_ctl.dart';
import 'package:prayer_app_getx/components/app_bar_cstm.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/hour_list_tile.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';

class AgpeyaListView extends StatelessWidget {
  final ctl = Get.put(AgpeyaListController());
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
            AppBarCustom(title: 'agpeya.title'.tr, hasBackButton: true),
          ],
        ));
  }

  _listItemBuilder(int index) {
    ctl.setHour(index);
    return HourListTile(
        tS.getTrnsltn(ctl.hour, 'icon'),
        tS.getTrnsltn(ctl.hour, 'title'),
        tS.getTrnsltn(ctl.hour, 'subtitle'),
        ctl.hour);
  }
}
