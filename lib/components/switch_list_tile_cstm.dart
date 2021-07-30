import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class SwitchListTileCustom extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  final title;

  SwitchListTileCustom({this.value, this.onChanged, this.title});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        inactiveThumbColor: Get.context.theme.primaryColorLight,
        contentPadding: EdgeInsets.only(
            left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
        value: value,
        onChanged: onChanged,
        title: title);
  }
}
