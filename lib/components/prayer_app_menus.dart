import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/box_decoration_cstm.dart';
import 'package:prayer_app_getx/components/setting_bottom_sheet.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class PrayerAppMenus extends StatelessWidget {
  final bool hasBackButton;
  final String title;
  final prayerController = AgpeyaPrayerController.find;

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
      height: 50,
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
    return Container(
      decoration: BoxDecorationCustom.getCustomBoxDecoration(),
      padding: EdgeInsets.only(top: 10),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              child: Icon(Icons.text_format),
              onTap: () => showModalBottomSheet(
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return SettingBottomSheet();
                  })),
        ],
      ),
    );
  }
}
