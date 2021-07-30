import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyText extends StatelessWidget {
  final String text;
  final bool enabled;

  BodyText(this.text, {this.enabled : true});

  @override
  Widget build(context) {
    return Text(text,
        style: enabled
            ? context.textTheme.bodyText1
            : context.textTheme.subtitle2);
  }
}
