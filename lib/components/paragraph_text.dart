import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class ParagraphText extends StatelessWidget {
  final String text;
  final context = Get.context;

  ParagraphText(this.text);

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
      child: Html(
        data: text,
        style: {
          "html": Style(
              lineHeight: LineHeight.number(Styles.LineSpacing),
              color: context.theme.primaryColorDark),
          "body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
          "a": Style(
              color: context.theme.accentColor,
              textDecoration: TextDecoration.none)
        },
      ),
    );
  }
}
