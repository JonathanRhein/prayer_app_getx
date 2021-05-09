import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubtitleText extends StatelessWidget {
  final String text;

  SubtitleText(this.text);

  @override
  Widget build(context) {
    return Text(text, style: context.textTheme.subtitle1);
  }
}
