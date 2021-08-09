import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class BodyText extends StatelessWidget {
  final String text;
  final bool enabled;
  final bool padding;

  BodyText(this.text, {this.enabled: true, this.padding: false});

  @override
  Widget build(context) {
    return Padding(
      padding: padding
          ? EdgeInsets.only(
              left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding)
          : EdgeInsets.all(0),
      child: Text(text,
          style: enabled
              ? context.textTheme.bodyText1
              : context.textTheme.subtitle2),
    );
  }
}
