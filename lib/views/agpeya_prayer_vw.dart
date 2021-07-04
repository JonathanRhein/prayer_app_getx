import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/full_prayer_list_tile.dart';
import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';

class AgpeyaPrayerView extends StatelessWidget {
  final textController =
      Get.put(AgpeyaPrayerController(Get.arguments));
  final prayerController = AgpeyaHourController.to;
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        body: Obx(() => ListView.builder(
                padding: EdgeInsets.only(top: 40),
                itemCount: prayerController.prayerList.length,
                itemBuilder: (context, index) =>
                    FullTextListTile(index, prayerController))));
  }

}
