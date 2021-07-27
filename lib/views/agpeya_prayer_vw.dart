import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/components/full_prayer_list_tile.dart';
import 'package:prayer_app_getx/components/prayer_app_menus.dart';
import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/controller/text_settings_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AgpeyaPrayerView extends StatelessWidget {
  final settingsController = Get.put(TextSettingsController());
  final prayerController = Get.put(AgpeyaPrayerController(Get.arguments));
  final hourController = AgpeyaHourController.find;
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Obx(() => SafeArea(
            bottom: false,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => prayerController.toggleMenus(),
                  child: ScrollablePositionedList.builder(
                      itemScrollController: prayerController.scrollController,
                      itemPositionsListener:
                          prayerController.itemPositionListener,
                      itemCount: hourController.prayerList.length,
                      itemBuilder: (context, index) => FullTextListTile(index)),
                ),
                AnimatedSwitcher(
                    switchInCurve: Curves.easeInOutCubic,
                    switchOutCurve: Curves.easeInOutCubic,
                    duration: Styles.AnimatedSwitcherDurationLong,
                    child: prayerController.showMenus.value
                        ? PrayerAppMenus(
                            title: translationService.getTranslation(
                                hourController.hour, 'title'),
                            hasBackButton: true,
                          )
                        : SizedBox()),
              ],
            ))));
  }
}
