import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerListSectionHeading extends StatelessWidget {
  final String text;

  PrayerListSectionHeading(this.text);

  @override
  Widget build(context) {
    return Text(text, style: context.textTheme.headline4);         
  }
}
