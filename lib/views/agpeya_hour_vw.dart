import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/action_button.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/short_prayer_list_tile.dart';
import 'package:prayer_app_getx/components/sliver_persistent_header_cstm.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class AgpeyaHourView extends StatelessWidget {
  final translationService = TranslationService();
  var hourController = Get.put(AgpeyaHourController(Get.arguments));

  // TODO: Shadow to ActionButton

  // TODO: Background behind status bar when scrolling so that clock time and
  // text from list does not overlap

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              CustomScrollView(
                controller: hourController.scrollController,
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
