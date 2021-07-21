import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/text_settings_ctl.dart';

class PrayerText extends StatelessWidget {
  final String text;
  final settingsController = TextSettingsController.find;
  final context = Get.context;

  PrayerText(this.text);

  @override
  Widget build(context) {
    return Html(
      data: text,
      style: {
        "html": Style(
            lineHeight: LineHeight.number(settingsController.lineSpacing),
            textAlign: settingsController.textAlignment,
            color: context.theme.primaryColorDark,
            fontSize: FontSize(settingsController.fontSizeText),
            fontFamily: settingsController.fontFamily),
        "body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero)
      },
    );
  }
}
