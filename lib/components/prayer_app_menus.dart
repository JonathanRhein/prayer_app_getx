import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/text_settings.dart';
import 'package:prayer_app_getx/components/small_app_bar.dart';
import 'package:prayer_app_getx/components/table_of_contents.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controllers/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';

class PrayerAppMenus extends StatelessWidget {
  final bool hasBackButton;
  final String title;
  final prayerController = AgpeyaPrayerController.find;
  final hourController = AgpeyaHourController.find;

  PrayerAppMenus({Key key, this.title, this.hasBackButton: true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallAppBar(title),
        _bottomMenu(context),
      ],
    );
  }

  Widget _bottomMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'editPrayers',
            onPressed: () => Get.toNamed(Strings.EditPrayerRoute),
            child: Icon(Icons.settings_outlined),
            backgroundColor: context.theme.scaffoldBackgroundColor,
          ),
          FloatingActionButton(
            heroTag: 'textStyling',
            onPressed: () => showModalBottomSheet(
                enableDrag: true,
                context: context,
                builder: (context) {
                  return TextSettings();
                }),
            child: Icon(Icons.text_format),
            backgroundColor: context.theme.scaffoldBackgroundColor,
          ),
          FloatingActionButton(
            heroTag: 'scrollTop',
            onPressed: () => prayerController.scrollToPrayer(0),
            child: Icon(Icons.arrow_upward),
            backgroundColor: context.theme.scaffoldBackgroundColor,
          ),
          FloatingActionButton(
            heroTag: 'showTOC',
            onPressed: () {
              prayerController.dismissMenu();
              showModalBottomSheet(
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return TableOfContents();
                  }).whenComplete(() => prayerController.enableMenu());
            },
            child: Icon(Icons.toc),
            backgroundColor: context.theme.scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}
