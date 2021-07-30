import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/action_button.dart';
import 'package:prayer_app_getx/components/general_app_bar.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/short_prayer_list_tile.dart';
import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class AgpeyaHourView extends StatelessWidget {
  final controller = Get.put(AgpeyaHourController(Get.arguments));
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            Obx(() => ListView.builder(
                padding: EdgeInsets.only(top: Styles.PaddingUnderneathGeneralAppBar),
                itemCount: controller.prayerList.length,
                itemBuilder: (context, index) =>
                    ShortPrayerListTile(index, controller))),
            GeneralAppBar(
              title:
                  translationService.getTranslation(controller.hour, 'title'),
              hasBackButton: true,
              hasEditButton: true 
            ),
            Positioned.fill(
                bottom: 30,
                right: 30,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: ActionButton(
                        text: 'agpeya.pray_now'.tr, args: 0)))
          ],
        ));
  }
}
