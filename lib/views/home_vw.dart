import 'package:flutter/material.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_cstm.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_cstm.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            ListView(
              itemExtent: 60,
              padding: EdgeInsets.only(top: 320),
              children: <Widget>[],
            ),
            AppBarCustom(title: labels.app.title, hasBackButton: true),
          ],
        ));
  }
}
