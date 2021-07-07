import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/agpeya_list_ctl.dart';
import 'package:prayer_app_getx/components/general_app_bar.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/hour_list_tile.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class AgpeyaListView extends StatelessWidget {
  final controller = Get.put(AgpeyaListController());
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            Obx(() => ListView.builder(
                padding: EdgeInsets.only(top: Styles.paddingUnderneathCustomAppBar),
                itemCount: controller.dbList.length,
                itemBuilder: (context, index) => _listItemBuilder(index))),
            GeneralAppBar(title: 'agpeya.title'.tr, hasBackButton: true),
          ],
        ));
  }

  _listItemBuilder(int index) {
    controller.setHour(index);
    return HourListTile(
        translationService.getTranslation(controller.hour, 'icon'),
        translationService.getTranslation(controller.hour, 'title'),
        translationService.getTranslation(controller.hour, 'subtitle'),
        controller.hour);
  }
}
