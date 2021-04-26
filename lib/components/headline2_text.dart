import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Headline2Text extends StatelessWidget {
  final String text;

  Headline2Text(this.text);

  @override
  Widget build(context) {
    return Text(text, style: context.textTheme.headline2);
  }
}