import 'package:flutter/material.dart';
import 'package:prayer_app_getx/utils/styles/shared_styles.dart';

ThemeData lightTheme() {

  final ThemeData lightTheme = ThemeData.light();

  // Use below to change color settings
  final Color _mainTextColor = Color(0xFF3A3A3A);
  final Color _mainAccentColor = Color(0xFF917f26);


  // Define everything text related here
  TextTheme _textTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: SharedStyles.fontFamilyHeadline1,
          fontSize: SharedStyles.fontSizeHeadline1,
          color: _mainTextColor,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontFamily: SharedStyles.fontFamilyBodyText1,
          fontSize: SharedStyles.fontSizeBodyText1,
          color: _mainTextColor,
        ));
  }

  return lightTheme.copyWith(
      textTheme: _textTheme(lightTheme.textTheme),

      // The foreground color for widgets (knobs, text, overscroll edge effect, etc).
      accentColor: _mainAccentColor,

      // The background color for major parts of the app (toolbars, tab bars, etc)
      primaryColor: Color(0xFFFFFFFF),

      // A color that contrasts with the primaryColor, e.g. used as the remaining part of a progress bar.
      backgroundColor: Color(0xFF000000),

      // The color that the Material widget uses to draw elevation shadows.
      shadowColor: Color(0xFFDCDCDC),

      // The default color of the Material that underlies the Scaffold. The background color for a typical material app or a page within the app.
      scaffoldBackgroundColor: Color(0xFFF5F5F5),

      iconTheme: IconThemeData(
        color: _mainAccentColor,
        size: 25.0,
      ),

      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                  (state) => Color(0xFFE9E2BD)),
              foregroundColor: MaterialStateProperty.resolveWith(
                  (state) => _mainAccentColor))));
}
