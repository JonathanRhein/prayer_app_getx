import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerHeading extends StatelessWidget {
  final String text;

  PrayerHeading(this.text);

  @override
  Widget build(context) {
    return Text(text, style: context.textTheme.headline3);
  }
}
