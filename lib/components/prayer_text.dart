import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';

class PrayerText extends StatelessWidget {
  final String text;

  PrayerText(this.text);

  @override
  Widget build(context) {
    return Html(
    data: text,
    style: {
    "html": Style.fromTextStyle(context.textTheme.bodyText1),
    "body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero)
    },
);
  }
}
