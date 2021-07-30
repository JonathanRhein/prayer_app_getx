import 'package:flutter/material.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';

class Styles {
  //-------------------- FONTS ----------------------
  // Headline1
  static const String FontFamilyHeadline1 = Strings.Vidaloka;
  static const double FontSizeHeadline1 = 55.0;

  // Headline2
  static const String FontFamilyHeadline2 = Strings.Vidaloka;
  static const double FontSizeHeadline2 = 20.0;

  // Headline3
  static const String FontFamilyHeadline3 = Strings.Montserrat;
  static const double FontSizeHeadline3 = 18.0;
  static const FontWeight FontWeightHeadline3 = FontWeight.bold;

  // Headline4
  static const String FontFamilyHeadline4 = Strings.Vidaloka;
  static const double FontSizeHeadline4 = 24.0;

  // Headline4
  static const String FontFamilyHeadline5 = Strings.Vidaloka;
  static const double FontSizeHeadline5 = 24.0;

  // BodyText1
  static const String FontFamilyBodyText1 = Strings.Montserrat;
  static const double FontSizeBodyText1 = 18.0;

  // Subtitle1
  static const String FontFamilySubtitleText1 = Strings.Montserrat;
  static const double FontSizeSubtitleText1 = 18.0;

  // Default TextAlignment
  static const String TextAlignmnet = Strings.Left;

  //-------------------- SPACERS ----------------------

  // General padding values (left & right) for each screen
  static const double GeneralPadding = 25.0;
  static const double ScreenLeftPadding = 25.0;
  static const double ScreenRightPadding = 25.0;

  // Padding for button grid layouts
  static const double ButtonSpacing = 10.0;

  // Top padding for all content underneath custom app bar
  static const double PaddingUnderneathGeneralAppBar = 320.0;

  // Line spacing applied to text shown on prayer views
  static const double LineSpacing = 1.5;

  // Height of top in prayer view
  static const double TopMenuHeight = 50;

  //-------------------- MAX & MIN VALUES --------------------

  // For prayer views where text appearance can be adjusted by the user
  static const double FontSizeTextMax = 30.0;
  static const double FontSizeTextMin = 10.00;

  // Line spacing minimum and maximum applied to text shown on prayer views
  static const double LineSpacingMax = 2.5;
  static const double LineSpacingMin = 1.0;

  //-------------------- DURATIONS --------------------

  static const Duration ScrollDurationLong = Duration(milliseconds: 1500);
  static const Duration ScrollDurationShort = Duration(milliseconds: 750);

  static const Duration AnimatedSwitcherDurationLong =
      Duration(milliseconds: 500);
  static const Duration AnimatedSwitcherDurationShort =
      Duration(milliseconds: 200);
}
