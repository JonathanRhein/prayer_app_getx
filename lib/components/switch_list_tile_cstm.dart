import 'package:flutter/material.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class SwitchListTileCustom extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  final String title;

  SwitchListTileCustom({this.value, this.onChanged, this.title});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        contentPadding: EdgeInsets.only(
            left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
        value: value,
        onChanged: onChanged,
        title: BodyText(title));
  }
}
