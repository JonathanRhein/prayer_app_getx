import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyText extends StatelessWidget {
  final String text;

  BodyText(this.text);

  @override
  Widget build(context) {
    return Text(text, style: context.textTheme.bodyText1);
  }
}
