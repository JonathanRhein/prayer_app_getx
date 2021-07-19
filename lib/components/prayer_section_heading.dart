import 'package:flutter/material.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';

class PrayerSectionHeading extends StatelessWidget {
  final String text;
  final prayerController = AgpeyaPrayerController.find;

  PrayerSectionHeading(this.text);

  @override
  Widget build(context) {
    return Text(text,
        textAlign: prayerController.textAlignment,
        style: TextStyle(
            height: prayerController.lineSpacing,
            fontSize: prayerController.fontSizeSectionHeading,
            fontFamily: 'Vidaloka'));
  }
}
