import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/general_app_bar.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            ListView(
              itemExtent: 60,
              padding: EdgeInsets.only(top: Styles.PaddingUnderneathCustomAppBar),
              children: <Widget>[],
            ),
            GeneralAppBar(title: 'app.title'.tr, hasBackButton: true),
          ],
        ));
  }
}
