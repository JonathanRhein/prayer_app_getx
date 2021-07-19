import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final dynamic args;

  ActionButton({this.text, this.args});

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () => Get.toNamed(Strings.AgpeyaPrayerRoute, arguments: args),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text.toUpperCase(),
              style: context.textTheme.bodyText1.copyWith(color: Colors.white)),
          Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}
