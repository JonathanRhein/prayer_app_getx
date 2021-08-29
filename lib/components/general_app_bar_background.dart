import 'package:flutter/material.dart';

class GeneralAppBarBackground extends ShapeBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Offset controllPoint2 = Offset(rect.size.width, rect.size.height);
    Offset endPoint2 = Offset(rect.size.width, rect.size.height - 100);

    return Path()
      ..lineTo(0, rect.size.height)
      ..lineTo(rect.size.width - 100, rect.size.height)
      ..quadraticBezierTo(
          controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy)
      ..lineTo(rect.size.width, 0);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
