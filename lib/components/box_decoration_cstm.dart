import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxDecorationCustom {
  static BoxDecoration getCustomBoxDecoration() {
    var context = Get.context;
    return BoxDecoration(
      color: context.theme.scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: context.theme.scaffoldBackgroundColor,
          blurRadius: 4.0,
          spreadRadius: 2.0,
        ),
      ],
    );
  }
}
