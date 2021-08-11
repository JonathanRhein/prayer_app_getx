import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/action_button.dart';
import 'package:prayer_app_getx/components/general_app_bar.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/short_prayer_list_tile.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class AgpeyaHourView extends StatelessWidget {
  final hourController = Get.put(AgpeyaHourController(Get.arguments));
  final translationService = TranslationService();

  // TODO: Shadow to ActionButton

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            GetBuilder<AgpeyaHourController>(builder: (_) {
              return ListView.builder(
                  padding: EdgeInsets.only(
                      top: Styles.PaddingUnderneathGeneralAppBar),
                  itemCount: hourController.prayerList.length,
                  itemBuilder: (context, index) =>
                      ShortPrayerListTile(index, hourController));
            }),
            GeneralAppBar(
                title:
                    translationService.getTranslation(hourController.hour, 'title'),
                hasBackButton: true,
                hasEditButton: true),
            Positioned.fill(
                bottom: 30,
                right: 30,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: ActionButton(text: 'agpeya.pray_now'.tr, args: 0)))
          ],
        ));
  }
}
