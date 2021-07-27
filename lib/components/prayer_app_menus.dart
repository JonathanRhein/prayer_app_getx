import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/box_decoration_cstm.dart';
import 'package:prayer_app_getx/components/setting_bottom_sheet.dart';
import 'package:prayer_app_getx/components/toc_bottom_sheet.dart';

import 'package:prayer_app_getx/controller/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';

import 'package:prayer_app_getx/utils/constants/styles.dart';

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
        _topMenu(context),
        _bottomMenu(context),
      ],
    );
  }

  Widget _topMenu(BuildContext context) {
    return Container(
      decoration: BoxDecorationCustom.getCustomBoxDecoration(),
      padding: EdgeInsets.only(top: 0.0, left: Styles.ScreenLeftPadding),
      height: Styles.TopMenuHeight,
      child: Padding(
        padding: EdgeInsets.only(right: Styles.ScreenRightPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasBackButton
                ? GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: () => Get.back(),
                  )
                : SizedBox(),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(title, style: context.textTheme.headline5),
            ),
            GestureDetector(
                child: Icon(Icons.menu),
                onTap: () => Scaffold.of(context).openEndDrawer()),
          ],
        ),
      ),
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
            heroTag: 'showTOC',
            onPressed: () {
              prayerController.dismissMenu();
              showModalBottomSheet(
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return TableOfContentsBottomSheet();
                  }).whenComplete(() => prayerController.enableMenu());
            },
            child: Icon(Icons.toc),
            backgroundColor: context.theme.scaffoldBackgroundColor,
          ),
          FloatingActionButton(
            heroTag: 'textStyling',
            onPressed: () => showModalBottomSheet(
                enableDrag: true,
                context: context,
                builder: (context) {
                  return SettingBottomSheet();
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
        ],
      ),
    );
  }
}
