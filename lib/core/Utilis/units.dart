import 'package:flutter/material.dart';

abstract class Units {
  Units._();

  static const double _designScreenWidth = 375;
  static const double _designScreenHeight = 812;

  static double getHeight({
    required BuildContext context,
    required double value,
  }) {
    return value * (MediaQuery.sizeOf(context).height / _designScreenHeight);
  }

  static double getWidth({
    required BuildContext context,
    required double value,
  }) {
    return value * (MediaQuery.sizeOf(context).width / _designScreenWidth);
  }

  static double getRadius({
    required BuildContext context,
    required double value,
  }) {
    return getWidth(context: context, value: value);
  }

  static double getFontSize({
    required BuildContext context,
    required double value,
  }) {
    return getWidth(context: context, value: value);
  }

  static double getHorizontal({
    required BuildContext context,
    required double value,
  }) {
    return getWidth(context: context, value: value);
  }

  static double getVertical({
    required BuildContext context,
    required double value,
  }) {
    return getHeight(context: context, value: value);
  }
}