import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final dynamic args;

  ActionButton({this.text, this.args});

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () =>
              Get.toNamed(Strings.EditPrayerRoute, arguments: Get.arguments),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(Styles.GeneralPadding / 1.5),
              child: Icon(
                Icons.edit_outlined,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: context.theme.shadowColor,
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: Offset(2, 2))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              color: context.theme.accentColor,
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Strings.AgpeyaPrayerRoute, arguments: args),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(Styles.GeneralPadding / 1.5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(text.toUpperCase(),
                      style: TextStyle(color: Colors.white)),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: context.theme.shadowColor,
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: Offset(2, 2))
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: context.theme.accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
