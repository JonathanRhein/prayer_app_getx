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
          fontFamily: Styles.FontFamilyHeadline1,
          fontSize: Styles.FontSizeHeadline1,
          color: _mainTextColor,
        ),
        // used for general text
        bodyText1: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyBodyText1,
          fontSize: Styles.FontSizeBodyText1,
          color: _mainTextColor,
        ),
        // used for all links
        bodyText2: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyBodyText1,
          fontSize: Styles.FontSizeBodyText1,
          color: _mainAccentColor,
        ),
        // used for headlines in floating text
        headline2: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline2,
          fontSize: Styles.FontSizeHeadline2,
          color: _mainAccentColor,
        ),
        // used for headlines of prayers in text
        headline3: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline3,
          fontSize: Styles.FontSizeHeadline3,
          fontWeight: Styles.FontWeightHeadline3,
          color: _mainTextColor,
        ),
        // used for section headlines of prayers in text
        headline4: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline4,
          fontSize: Styles.FontSizeHeadline4,
          color: _mainAccentColor,
        ),
        // used text in prayer app bar
        headline5: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline5,
          fontSize: Styles.FontSizeHeadline5,
          color: _mainTextColor,
        ),
        // used for headlines in floating text
        subtitle1: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilySubtitleText1,
          fontSize: Styles.FontSizeSubtitleText1,
          color: _subtitleTextColor,
        ));
  }

  return lightTheme.copyWith(
    // The text theme for fonts
    textTheme: _textTheme(lightTheme.textTheme),

    // The foreground color for widgets (knobs, text, overscroll edge effect, etc).
    accentColor: _mainAccentColor,

    // The color for texts which are not set through textTheme but manually
    primaryColorDark: _mainTextColor,

    // The background color for major parts of the app (toolbars, tab bars, etc)
    primaryColor: Color(0xFFFFFFFF),

    // A color that contrasts with the primaryColor, e.g. used as the remaining part of a progress bar.
    backgroundColor: Color(0xFF000000),

    // The color that the Material widget uses to draw elevation shadows.
    shadowColor: Color(0xFFDCDCDC),

    primaryColorLight: Color(0xFFE1E0D6),

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
    /* TODO: check why this has no effect on the bottomSheet */
    bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(35)))),

    sliderTheme: SliderThemeData(
        activeTrackColor: _mainAccentColor,
        thumbColor: _mainAccentColor,
        inactiveTrackColor: _mainAccentColorHue,
        overlayColor: _mainAccentColor.withOpacity(0.2)),

    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      side: MaterialStateProperty.resolveWith(
          (state) => BorderSide(color: _mainAccentColorHue)),
      backgroundColor:
          MaterialStateProperty.resolveWith((state) => Colors.transparent),
      foregroundColor:
          MaterialStateProperty.resolveWith((state) => _mainTextColor),
      overlayColor:
          MaterialStateProperty.resolveWith((state) => _mainAccentColorHue),
    )),

    floatingActionButtonTheme:
        FloatingActionButtonThemeData(foregroundColor: _mainAccentColor),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((state) => TextStyle(
                  color: Colors.white,
                  fontFamily: Styles.FontFamilyBodyText1,
                )),
            padding: MaterialStateProperty.resolveWith((state) =>
                EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)),
            backgroundColor:
                MaterialStateProperty.resolveWith((state) => _mainAccentColor),
            overlayColor: MaterialStateProperty.resolveWith(
                (state) => _mainAccentColorHue.withOpacity(0.2)),
            shape: MaterialStateProperty.resolveWith((state) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0))),
            shadowColor: MaterialStateProperty.resolveWith(
                (states) => Colors.transparent))),

    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.resolveWith((state) => Color(0xFFE9E2BD)),
            foregroundColor: MaterialStateProperty.resolveWith(
                (state) => _mainAccentColor))),
  );
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
          fontFamily: Styles.FontFamilyHeadline1,
          fontSize: Styles.FontSizeHeadline1,
          color: _mainTextColor,
        ),
        // used for general text
        bodyText1: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyBodyText1,
          fontSize: Styles.FontSizeBodyText1,
          color: _mainTextColor,
        ),
        // used for all links
        bodyText2: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyBodyText1,
          fontSize: Styles.FontSizeBodyText1,
          color: _mainAccentColor,
        ),
        // used for headlines in floating text
        headline2: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline2,
          fontSize: Styles.FontSizeHeadline2,
          color: _mainAccentColor,
        ),
        // used for headlines of prayers in text
        headline3: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline3,
          fontSize: Styles.FontSizeHeadline3,
          fontWeight: Styles.FontWeightHeadline3,
          color: _mainTextColor,
        ),
        // used for section headlines of prayers in text
        headline4: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline4,
          fontSize: Styles.FontSizeHeadline4,
          color: _mainAccentColor,
        ),
        // used text in prayer app bar
        headline5: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilyHeadline5,
          fontSize: Styles.FontSizeHeadline5,
          color: _mainTextColor,
        ),
        // used for headlines in floating text
        subtitle1: base.bodyText1.copyWith(
          fontFamily: Styles.FontFamilySubtitleText1,
          fontSize: Styles.FontSizeSubtitleText1,
          color: _subtitleTextColor,
        ));
  }

  return darkTheme.copyWith(

      // The text theme for fonts
      textTheme: _textTheme(darkTheme.textTheme),

      // The foreground color for widgets (knobs, text, overscroll edge effect, etc).
      accentColor: _mainAccentColor,

      // The color for texts which are not set through textTheme but manually
      primaryColorDark: _mainTextColor,

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
      primaryColorLight: Color(0xFF484848),

      // The default color of the Material that underlies the Scaffold. The background color for a typical material app or a page within the app.
      scaffoldBackgroundColor: Color(0xFF060606),
      iconTheme: IconThemeData(
        color: _mainAccentColor,
        size: 25.0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)))),
      sliderTheme: SliderThemeData(
          activeTrackColor: _mainAccentColor,
          thumbColor: _mainAccentColor,
          inactiveTrackColor: _mainAccentColorHue,
          overlayColor: _mainAccentColor.withOpacity(0.2)),
      switchTheme: SwitchThemeData(
        thumbColor:
            MaterialStateProperty.resolveWith((state) => _mainAccentColor),
        trackColor:
            MaterialStateProperty.resolveWith((state) => _mainAccentColorHue),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              side: MaterialStateProperty.resolveWith(
                  (state) => BorderSide(color: _mainAccentColorHue)),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (state) => Colors.transparent),
              foregroundColor:
                  MaterialStateProperty.resolveWith((state) => _mainTextColor),
              overlayColor: MaterialStateProperty.resolveWith(
                  (state) => _mainAccentColorHue),
              shadowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.transparent))),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(foregroundColor: _mainAccentColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith((state) => TextStyle(
                    color: Colors.white,
                    fontFamily: Styles.FontFamilyBodyText1,
                  )),
              padding: MaterialStateProperty.resolveWith((state) =>
                  EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (state) => _mainAccentColor),
              overlayColor:
                  MaterialStateProperty.resolveWith((state) => _mainAccentColorHue.withOpacity(0.2)),
              shape: MaterialStateProperty.resolveWith((state) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0))),
              shadowColor: MaterialStateProperty.resolveWith((states) => Colors.transparent))),
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((state) => Color(0xFF221C01)), foregroundColor: MaterialStateProperty.resolveWith((state) => _mainAccentColor))));
}
