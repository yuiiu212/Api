import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/fontWeight.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? customContent;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? textColor;

  const CustomMainButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.customContent,
    this.height,
    this.width,
    this.fontSize,
    this.textColor, required String btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Units.getWidth(
        context: context,
        value: width ?? 327,
      ),
      height: Units.getHeight(
        context: context,
        value: height ?? 56,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorManager.PrimaryColor100,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Units.getRadius(
                context: context,
                value: 12,
              ),
            ),
          ),
        ),
        child: customContent ??
            Text(
              title,
              style: TextStyle(
                color: textColor ?? ColorManager.WhiteBackground,
                fontSize: Units.getHeight(
                  context: context,
                  value: fontSize ?? 18,
                ),
                fontWeight: fontWeight.medium,
              ),
            ),
      ),
    );
  }
}