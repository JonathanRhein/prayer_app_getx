import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkText extends StatelessWidget {
  final String text;
  final String fontFamily;

  LinkText(this.text, {this.fontFamily});

  @override
  Widget build(context) {
    return Text(text,
        style: context.textTheme.bodyText2.copyWith(fontFamily: fontFamily));
  }
}
