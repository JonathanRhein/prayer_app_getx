import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/general_app_bar.dart';
import 'package:prayer_app_getx/components/end_drawer_cstm.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class AgpeyaInformation extends StatelessWidget {
  //TODO: ad a bottom sheet with TOC

  @override
  Widget build(context) {
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: Styles.PaddingUnderneathGeneralAppBar - 30,
                    right: Styles.ScreenRightPadding,
                    left: Styles.ScreenLeftPadding),
                child: Html(data: 'agpeya.information_text'.tr, style: {
                  "html": Style(
                      lineHeight: LineHeight.number(Styles.LineSpacing),
                      color: context.theme.primaryColorDark),
                  "h2": Style(
                      fontWeight: FontWeight.normal,
                      fontSize: FontSize.xLarge,
                      fontFamily: Strings.Vidaloka,
                      padding: EdgeInsets.only(top: 30),
                      color: context.theme.accentColor)
                })),
            GeneralAppBar(title: 'agpeya.introduction'.tr, hasBackButton: true),
          ],
        ));
  }
}
