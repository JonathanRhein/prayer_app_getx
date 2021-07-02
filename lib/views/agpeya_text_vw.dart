import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/text_list_tile.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/controller/agpeya_text_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';

class AgpeyaTextView extends StatelessWidget {
  final textController =
      Get.put(AgpeyaTextController(Get.arguments));
  final prayerController = AgpeyaPrayerController.to;
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        body: Obx(() => ListView.builder(
                padding: EdgeInsets.only(top: 320),
                itemCount: prayerController.prayerList.length,
                itemBuilder: (context, index) =>
                    TextListTile(index, prayerController))));
  }

}
