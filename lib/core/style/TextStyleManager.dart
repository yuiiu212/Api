
import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/fontWeight.dart';
import 'package:flutter/material.dart' show BuildContext, TextStyle;

class TextStyleManager {
  static TextStyle textStyleGreyColor100B50(BuildContext context) => TextStyle(
      color: ColorManager.GreyColor100,
      fontSize: Units.getFontSize(context: context, value: 50),
      fontWeight: fontWeight.Bold
    );
  static TextStyle textStyleGreyColor100B20(BuildContext context) => TextStyle(
      color: ColorManager.GreyColor100,
      fontSize: Units.getFontSize(context: context, value: 20),
      fontWeight: fontWeight.Bold
    );
  static TextStyle textStyleGreyColor100R11(BuildContext context) => TextStyle(
      color: ColorManager.GreyColor100,
      fontSize: Units.getFontSize(context: context, value: 11),
      fontWeight: fontWeight.regular
    );
  static TextStyle textStylePrimaryColor100B32(BuildContext context) => TextStyle(
      color: ColorManager.PrimaryColor100,
      fontSize: Units.getFontSize(context: context, value: 32),
      fontWeight: fontWeight.Bold
    );
  static TextStyle textStylePrimaryColor100B24(BuildContext context) => TextStyle(
      color: ColorManager.PrimaryColor100,
      fontSize: Units.getFontSize(context: context, value: 24),
      fontWeight: fontWeight.Bold
    );
  static TextStyle textStylePrimaryColor100B12(BuildContext context) => TextStyle(
      color: ColorManager.PrimaryColor100,
      fontSize: Units.getFontSize(context: context, value: 12),
      fontWeight: fontWeight.regular
    );
  static TextStyle textStyleBodyBackgroundR10(BuildContext context) => TextStyle(
      color: ColorManager.BodyBackground,
      fontSize: Units.getFontSize(context: context, value: 10),
      fontWeight: fontWeight.regular
    );
  static TextStyle textStyleBodyBackgroundR14(BuildContext context) => TextStyle(
      color: ColorManager.BodyBackground,
      fontSize: Units.getFontSize(context: context, value: 14),
      fontWeight: fontWeight.regular
    );
  static TextStyle textStyleGreyColor50M14(BuildContext context) => TextStyle(
      color: ColorManager.GreyColor50,
      fontSize: Units.getFontSize(context: context, value: 14),
      fontWeight: fontWeight.medium
    );
  static TextStyle textStylewhitSB20(BuildContext context) => TextStyle(
      fontSize: Units.getFontSize(context: context, value: 18),
                      fontWeight: fontWeight.semiBold,
                      color: ColorManager.WhiteBackground,
                          );
  static TextStyle textStyleGreyColor50M12(BuildContext context) => TextStyle(
      color: ColorManager.GreyColor50,
      fontSize: Units.getFontSize(context: context, value: 12),
      fontWeight: fontWeight.medium
    );
  static TextStyle textStyleGreyColor60R12(BuildContext context) => TextStyle(
      color: ColorManager.GreyColor60,
      fontSize: Units.getFontSize(context: context, value: 12),
      fontWeight: fontWeight.regular
    );
  static TextStyle textStyleGreyColor70R16(BuildContext context) => TextStyle(
      color: ColorManager.GreyColor70,
      fontSize: Units.getFontSize(context: context, value: 16),
      fontWeight: fontWeight.regular
    );
  }
