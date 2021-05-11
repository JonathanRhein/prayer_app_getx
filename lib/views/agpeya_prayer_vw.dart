import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/action_button.dart';
import 'package:prayer_app_getx/components/app_bar_cstm.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/prayer_list_tile.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';

class AgpeyaPrayerView extends StatelessWidget {
  final controller = Get.put(AgpeyaPrayerController(Get.arguments));
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            Obx(() => ListView.builder(
                padding: EdgeInsets.only(top: 320),
                itemCount: controller.prayerList.length,
                itemBuilder: (context, index) =>
                    PrayerListTile(index, controller))),
            AppBarCustom(
              title:
                  translationService.getTranslation(controller.hour, 'title'),
              hasBackButton: true,
            ),
            Positioned.fill(
                bottom: 30,
                right: 30,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: ActionButton(
                        text: 'agpeya.pray_now'.tr, args: controller.hour)))
          ],
        ));
  }
}
