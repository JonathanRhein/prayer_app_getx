import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  final bool enabled;

  SubtitleText(this.text, {this.enabled: true});

  @override
  Widget build(context) {
    return Text(text,
        style: enabled
            ? context.textTheme.subtitle1
            : context.textTheme.subtitle2);
  }
}
