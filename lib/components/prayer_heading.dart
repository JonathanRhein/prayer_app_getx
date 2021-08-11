import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controllers/text_settings_ctl.dart';

class PrayerHeading extends StatelessWidget {
  final String text;
  final settingsController = TextSettingsController.find;
  final context = Get.context;
  final isMarian;

  PrayerHeading(this.text, {this.isMarian: false});

  @override
  Widget build(context) {
    return RichText(
        textAlign: settingsController.textAlignment,
        text: TextSpan(
            text: '♱',
            style: TextStyle(
                height: settingsController.lineSpacing,
                color: context.theme.primaryColorDark,
                fontSize: settingsController.fontSizePrayerHeading + 5),
            children: <TextSpan>[
              TextSpan(
                text: ' ' + text,
                style: TextStyle(
                    fontStyle: isMarian ? FontStyle.italic : FontStyle.normal,
                    height: settingsController.lineSpacing,
                    color: context.theme.primaryColorDark,
                    fontWeight: FontWeight.bold,
                    fontSize: settingsController.fontSizePrayerHeading,
                    fontFamily: settingsController.fontFamily),
              )
            ]));
  }
}
