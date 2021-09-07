import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/action_button.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/short_prayer_list_tile.dart';
import 'package:prayer_app_getx/components/sliver_persistent_header_cstm.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controllers/general_scroll_controller.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class AgpeyaHourView extends StatelessWidget {
  final translationService = TranslationService();

  @override
  Widget build(context) {
    var hourController = Get.put(AgpeyaHourController(), tag: Get.arguments);
    var generalScrollController =
        Get.put(GeneralScrollController(), tag: Get.arguments);
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              CustomScrollView(
                controller: generalScrollController.scrollController,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverPersistentHeaderCustom(
                      translationService.getTranslation(
                          hourController.hour, 'title'),
                      icon: translationService.getTranslation(
                          hourController.hour, 'icon'),
                    ),
                  ),
                  GetBuilder<AgpeyaHourController>(
                    tag: Get.arguments,
                    builder: (_) {
                      return SliverPadding(
                        padding: EdgeInsets.only(top: 15),
                        sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) =>
                              ShortPrayerListTile(index, hourController),
                          childCount: hourController.prayerList.length,
                        )),
                      );
                    },
                  ),
                ],
              ),
              Positioned.fill(
                  bottom: Styles.GeneralPadding * 2,
                  right: Styles.ScreenRightPadding,
                  left: Styles.ScreenLeftPadding,
                  child: Container(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child:
                            ActionButton(text: 'agpeya.pray_now'.tr, args: 0)),
                  ))
            ],
          ),
        ));
  }
}
