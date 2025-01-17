import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/edit_prayer_list_tile.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/small_app_bar.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class EditPrayerView extends StatelessWidget {
  final translationService = TranslationService();
  final hourController = Get.put(AgpeyaHourController(), tag: Get.arguments[0].hour);

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              GetBuilder<AgpeyaHourController>(builder: (_) {
                return ListView.builder(
                    padding: EdgeInsets.only(top: Styles.TopMenuHeight),
                    itemCount: hourController.prayerList.length,
                    itemBuilder: (context, index) => EditPrayerListTile(index));
              }),
              SmallAppBar('settings.edit_hour'.trParams({
                'hour': translationService.getTranslation(
                    hourController.hour, 'title')
              }))
            ],
          ),
        ));
  }
}
