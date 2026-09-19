import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String name;

  const HomeHeader({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name!',
              style: TextStyle(
                fontSize: Units.getFontSize(
                  context: context,
                  value: 24,
                ),
                fontWeight: FontWeight.bold,
                color: ColorManager.GreyColor100,
              ),
            ),

            SizedBox(
              height: Units.getHeight(
                context: context,
                value: 4,
              ),
            ),

            Text(
              'How Are you Today?',
              style: TextStyleManager.textStyleGreyColor50M14(
                context,
              ),
            ),
          ],
        ),

        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(
                Units.getFontSize(
                  context: context,
                  value: 10,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorManager.GreyColor20,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none,
                color: ColorManager.GreyColor100,
                size: Units.getFontSize(
                  context: context,
                  value: 24,
                ),
              ),
            ),

            Positioned(
              right: Units.getWidth(
                context: context,
                value: 8,
              ),
              top: Units.getHeight(
                context: context,
                value: 8,
              ),
              child: Container(
                width: Units.getWidth(
                  context: context,
                  value: 10,
                ),
                height: Units.getHeight(
                  context: context,
                  value: 10,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.SecondaryFillRed,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}