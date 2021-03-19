import 'package:flutter/material.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_vw.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_vw.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
        endDrawer: EndDrawerView(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarView(title: labels.app.title, hasBackButton: false),
          ],
        ));
  }
}
