import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/agpeya_list_ctl.dart';
import 'package:prayer_app_getx/components/app_bar_cstm.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/list_tile_cstm.dart';

class AgpeyaListView extends StatelessWidget {
  final ctl = Get.put(AgpeyaListController());

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
    return ListTileCustom(ctl.getTrnsltn('icon'), ctl.getTrnsltn('title'),
        ctl.getTrnsltn('subtitle'), ctl.hour);
  }
}
