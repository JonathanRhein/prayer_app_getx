// TODO: Remove if not used in future!

import 'package:flutter/material.dart';

class PrayerAppBarBackground extends ShapeBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Offset controllPoint1 = Offset(0, rect.size.height - 20);
    Offset endPoint1 = Offset(20, rect.size.height - 20);
    Offset controllPoint2 = Offset(rect.size.width, rect.size.height - 20);
    Offset endPoint2 = Offset(rect.size.width, rect.size.height - 40);

    return Path()
      ..lineTo(0, rect.size.height)
      ..quadraticBezierTo(
          controllPoint1.dx, controllPoint1.dy, endPoint1.dx, endPoint1.dy)
      ..lineTo(rect.size.width - 20, rect.size.height - 20)
      ..quadraticBezierTo(
          controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy)
      ..lineTo(rect.size.width, 0);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  //Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    Offset controllPoint1 = Offset(0, rect.size.height - 20);
    Offset endPoint1 = Offset(20, rect.size.height - 20);
    Offset controllPoint2 = Offset(rect.size.width, rect.size.height - 20);
    Offset endPoint2 = Offset(rect.size.width, rect.size.height - 40);

    return Path()
      ..lineTo(0, rect.size.height)
      ..quadraticBezierTo(
          controllPoint1.dx, controllPoint1.dy, endPoint1.dx, endPoint1.dy)
      ..lineTo(rect.size.width - 20, rect.size.height - 20)
      ..quadraticBezierTo(
          controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy)
      ..lineTo(rect.size.width, 0);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
