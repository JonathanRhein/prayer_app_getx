import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controllers/text_settings_ctl.dart';

class PrayerHeading extends StatelessWidget {
  final String text;
  final settingsController = TextSettingsController.find;
  final context = Get.context;

  PrayerHeading(this.text);

  @override
  Widget build(context) {
    return Text(text,
        textAlign: settingsController.textAlignment,
        style: TextStyle(
            height: settingsController.lineSpacing,
            color: context.theme.primaryColorDark,
            fontWeight: FontWeight.bold,
            fontSize: settingsController.fontSizePrayerHeading,
            fontFamily: settingsController.fontFamily));
  }
}
