import 'package:flutter/material.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class DividerCustom extends StatelessWidget {
  DividerCustom();

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
      child: Column(
        children: [
          Divider(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
