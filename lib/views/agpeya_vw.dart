import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_cstm.dart';
import 'package:prayer_app_getx/shared_widgets/body_text.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_cstm.dart';

class AgpeyaView extends StatelessWidget {

  @override
  Widget build(context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            ListView.builder(
                padding: EdgeInsets.only(top: 320),
                itemExtent: 60,
                itemCount: 500,
                itemBuilder: (context, index) =>
                    _listItemBuilder(context, index)),
            AppBarCustom(title: labels.agpeya.title, hasBackButton: true),
          ],
        ));
  }
}

_listItemBuilder(BuildContext context, int index){ 

  return ListTile(
    leading: BodyText(index.toString()),
  );
}
