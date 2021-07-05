import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/full_prayer_list_tile.dart';
import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AgpeyaPrayerView extends StatelessWidget {
  
  final prayerController = Get.put(AgpeyaPrayerController(Get.arguments));
  final hourController = AgpeyaHourController.to;
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        body: Obx(() => ScrollablePositionedList.builder(
            padding: EdgeInsets.only(top: 40),
            itemScrollController: prayerController.scrollController,
            itemCount: hourController.prayerList.length,
            itemBuilder: (context, index) =>
                FullTextListTile(index, hourController))));
  }
}
