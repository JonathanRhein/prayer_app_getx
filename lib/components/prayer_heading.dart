import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';

class PrayerHeading extends StatelessWidget {
  final String text;
  final prayerController = AgpeyaPrayerController.find;
  final context = Get.context;

  PrayerHeading(this.text);

  @override
  Widget build(context) {
    return Text(text,
        textAlign: prayerController.textAlignment,
        style: TextStyle(
            height: prayerController.lineSpacing,
            color: context.theme.primaryColorDark,
            fontWeight: FontWeight.bold,
            fontSize: prayerController.fontSizePrayerHeading,
            fontFamily: prayerController.fontFamily));
  }
}
