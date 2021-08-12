import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class ListSectionHeading extends StatelessWidget {
  final String text;
  final bool padding;
  final double scaleFactor;

  ListSectionHeading(this.text, {this.padding: false, this.scaleFactor: 1});

  @override
  Widget build(context) {
    return Padding(
      padding: padding
          ? EdgeInsets.only(
              left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding)
          : EdgeInsets.all(0),
      child: Text(text,
          style: context.textTheme.headline4, textScaleFactor: scaleFactor),
    );
  }
}
