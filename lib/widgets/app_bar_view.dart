import 'package:flutter/material.dart';
import 'package:prayer_app_getx/widgets/app_bar_background.dart';

class AppBarView extends StatelessWidget {
  final bool hasBackButton;
  final String title;

  AppBarView({this.title, this.hasBackButton: true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: AppBarBackground(),
        shadows: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 70.0, left: 50),
      height: 370,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                this.hasBackButton
                    ? GestureDetector(
                        child: new Icon(Icons.arrow_back),
                        onTap: () => Navigator.of(context).pop(),
                      )
                    : Container(),
                GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () => Scaffold.of(context).openEndDrawer()),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
