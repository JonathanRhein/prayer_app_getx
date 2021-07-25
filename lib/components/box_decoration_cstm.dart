import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxDecorationCustom {
  static BoxDecoration getCustomBoxDecoration() {
    var context = Get.context;
    return BoxDecoration(
      color: context.theme.scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 8),
          color: context.theme.shadowColor,
          blurRadius: 8.0,
          spreadRadius: 1.0,
        ),
      ],
    );
  }
}
