import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controllers/text_settings_ctl.dart';

class PrayerSectionHeading extends StatelessWidget {
  final String text;
  final settingsController = TextSettingsController.find;

  PrayerSectionHeading(this.text);

  @override
  Widget build(context) {
    return Text(text,
        textAlign: settingsController.textAlignment,
        style: TextStyle(
            height: settingsController.lineSpacing,
            fontSize: settingsController.fontSizeSectionHeading,
            fontFamily: 'Vidaloka'));
  }
}
