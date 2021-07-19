import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetText extends StatelessWidget {
  final String text;

  BottomSheetText(this.text);

  @override
  Widget build(context) {
    return Text(
      text,
      style: context.textTheme.bodyText1,
      textScaleFactor: 0.8,
    );
  }
}
