import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/app_bar_background.dart';

class AppBarCustom extends StatelessWidget {
  final bool hasBackButton;
  final String title;
  final String backgroundImage;

  AppBarCustom({this.title, this.hasBackButton: true, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    // check if there is a background image provided and change font color
    // to light color
    final bool _isDarkBackground = this.backgroundImage != null;
    return Container(
      decoration: ShapeDecoration(
        image: _isDarkBackground
            ? DecorationImage(
                alignment: Alignment.topCenter,
                image: ExactAssetImage(this.backgroundImage),
                fit: BoxFit.cover)
            : null,
        color: context.theme.primaryColor,
        shape: AppBarBackground(),
        shadows: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 70.0, left: 50),
      height: 370,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                this.hasBackButton
                    ? _isDarkBackground
                        ? _backButtonWithBackground()
                        : GestureDetector(
                            child: Icon(Icons.arrow_back),
                            onTap: () => Get.back(),
                          )
                    : Container(),
                GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () => Scaffold.of(context).openEndDrawer()),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: _isDarkBackground
                  ? null
                  : Text(
                      title,
                      style: context.textTheme.headline1,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButtonWithBackground() {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(Icons.arrow_back, size: 50.0, color: Colors.black38)),
    );
  }
}
