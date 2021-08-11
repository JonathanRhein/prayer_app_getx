import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  final bool enabled;
  final bool isMarian;

  SubtitleText(this.text, {this.enabled: true, this.isMarian: false});

  @override
  Widget build(context) {
    return Text(text,
        style: enabled
            ? context.textTheme.subtitle1.copyWith(
                fontStyle: isMarian ? FontStyle.italic : FontStyle.normal)
            : context.textTheme.subtitle2.copyWith(
                fontStyle: isMarian ? FontStyle.italic : FontStyle.normal));
  }
}
