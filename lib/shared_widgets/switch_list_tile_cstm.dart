import 'package:flutter/material.dart';
import 'package:prayer_app_getx/shared_widgets/body_text.dart';

class SwitchListTileCustom extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  final String title;

  SwitchListTileCustom({this.value, this.onChanged, this.title});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
            value: value,
            onChanged: onChanged,
            title: Padding(
              padding: const EdgeInsets.only(left: 34.0),
              child: BodyText(title),
            ));
  }
}
