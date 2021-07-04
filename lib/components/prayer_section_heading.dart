import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerSectionHeading extends StatelessWidget {
  final String text;

  PrayerSectionHeading(this.text);

  @override
  Widget build(context) {
    return Text(text, style: context.textTheme.headline4);
  }
}
