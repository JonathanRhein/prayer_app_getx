import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationalIcon extends StatelessWidget {
  final IconData icon;
  final Function natviagteTo;
  final int rgbValue;

  NavigationalIcon(this.icon, this.natviagteTo, this.rgbValue);

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: natviagteTo,
      child: Icon(
        icon,
        color: Get.isDarkMode
            ? Get.context.theme.primaryColorDark
            : Color.fromRGBO(rgbValue, rgbValue, rgbValue, 1),
      ),
    );
  }
}
