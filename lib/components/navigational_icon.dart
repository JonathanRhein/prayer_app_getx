import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationalIcon extends StatelessWidget {
  final IconData icon;
  final Function natviagteTo;

  NavigationalIcon(this.icon, this.natviagteTo);

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: natviagteTo,
      child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: context.theme.primaryColor
                    .withOpacity(Get.isDarkMode ? .6 : .9),
                blurRadius: 10.0,
                spreadRadius: 6),
          ]),
          child: Icon(
            icon,
            color: context.theme.primaryColorDark,
          )),
    );
  }
}
