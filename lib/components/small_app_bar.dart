import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/box_decoration_cstm.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class SmallAppBar extends StatelessWidget {
  final String title;

  SmallAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationCustom.getCustomBoxDecoration(),
      padding: EdgeInsets.only(top: 0.0, left: Styles.ScreenLeftPadding),
      height: Styles.TopMenuHeight,
      child: Padding(
        padding: EdgeInsets.only(right: Styles.ScreenRightPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () => Get.back(),
            ),
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
}
