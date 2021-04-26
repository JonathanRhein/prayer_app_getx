import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkText extends StatelessWidget {
  final String text;

  LinkText(this.text);

  @override
  Widget build(context) {
    return Text(text, style: context.textTheme.bodyText2);         
  }
}
