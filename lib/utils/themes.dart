import 'package:flutter/material.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';

class Themes {
  static final light = lightTheme();
  static final dark = darkTheme();
}

ThemeData lightTheme() {
  final ThemeData lightTheme = ThemeData.light();

  // Use below color definitions to change colors that apply to more than one property of ThemeData
  final Color _mainTextColor = Color(0xFF1F1F1F);
  final Color _subtitleTextColor = Color(0xFF888888);
  final Color _mainAccentColor = Color(0xFF917f26);
  final Color _mainAccentColorHue = Color(0xFFE1E0D6);

  // Define everything text related here
  TextTheme _textTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: Styles.fontFamilyHeadline1,
          fontSize: Styles.fontSizeHeadline1,
          color: _mainTextColor,
        ),
        // used for general text
        bodyText1: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilyBodyText1,
          fontSize: Styles.fontSizeBodyText1,
          color: _mainTextColor,
        ),
        // used for all links
        bodyText2: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilyBodyText1,
          fontSize: Styles.fontSizeBodyText1,
          color: _mainAccentColor,
        ),
        // used for headlines in floating text
        headline2: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilyHeadline2,
          fontSize: Styles.fontSizeHeadline2,
          color: _mainAccentColor,
        ),
        // used for headlines in floating text
        subtitle1: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilySubtitleText1,
          fontSize: Styles.fontSizeSubtitleText1,
          color: _subtitleTextColor,
        ));
  }

  return lightTheme.copyWith(

      // The text theme for fonts
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
      switchTheme: SwitchThemeData(
        thumbColor:
            MaterialStateProperty.resolveWith((states) => _mainAccentColor),
        trackColor:
            MaterialStateProperty.resolveWith((states) => _mainAccentColorHue),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                  (state) => Color(0xFFE9E2BD)),
              foregroundColor: MaterialStateProperty.resolveWith(
                  (state) => _mainAccentColor))));
}

ThemeData darkTheme() {
  final ThemeData darkTheme = ThemeData.dark();

  // Use below color definitions to change colors that apply to more than one property of ThemeData
  final Color _mainTextColor = Color(0xFFFFFFFF);
  final Color _subtitleTextColor = Color(0xFF6A6A6A);
  final Color _mainAccentColor = Color(0xFF917f26);
  final Color _mainAccentColorHue = Color(0xFF484848);

  // Define everything text related here
  TextTheme _textTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: Styles.fontFamilyHeadline1,
          fontSize: Styles.fontSizeHeadline1,
          color: _mainTextColor,
        ),
        // used for general text
        bodyText1: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilyBodyText1,
          fontSize: Styles.fontSizeBodyText1,
          color: _mainTextColor,
        ),
        // used for all links
        bodyText2: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilyBodyText1,
          fontSize: Styles.fontSizeBodyText1,
          color: _mainAccentColor,
        ),
        // used for headlines in floating text
        headline2: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilyHeadline2,
          fontSize: Styles.fontSizeHeadline2,
          color: _mainAccentColor,
        ),
        // used for headlines in floating text
        subtitle1: base.bodyText1.copyWith(
          fontFamily: Styles.fontFamilySubtitleText1,
          fontSize: Styles.fontSizeSubtitleText1,
          color: _subtitleTextColor,
        ));
  }

  return darkTheme.copyWith(

      // The text theme for fonts
      textTheme: _textTheme(darkTheme.textTheme),

      // The foreground color for widgets (knobs, text, overscroll edge effect, etc).
      accentColor: _mainAccentColor,

      // The background color for major parts of the app (toolbars, tab bars, etc)
      primaryColor: Color(0xFF0B0B0B),

      // A color that contrasts with the primaryColor, e.g. used as the remaining part of a progress bar.
      backgroundColor: Color(0xFFFFFFFF),

      // The color that the Material widget uses to draw elevation shadows.
      shadowColor: Color(0xFF000000),

      // Background Color of drawer menu
      canvasColor: Color(0xFF000000),

      // Dialog background color
      dialogBackgroundColor: Color(0xFF0B0B0B),

      // The default color of the Material that underlies the Scaffold. The background color for a typical material app or a page within the app.
      scaffoldBackgroundColor: Color(0xFF060606),
      iconTheme: IconThemeData(
        color: _mainAccentColor,
        size: 25.0,
      ),
      switchTheme: SwitchThemeData(
        thumbColor:
            MaterialStateProperty.resolveWith((states) => _mainAccentColor),
        trackColor:
            MaterialStateProperty.resolveWith((states) => _mainAccentColorHue),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                  (state) => Color(0xFF221C01)),
              foregroundColor: MaterialStateProperty.resolveWith(
                  (state) => _mainAccentColor))));
}
