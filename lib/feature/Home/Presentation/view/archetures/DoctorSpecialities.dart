import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/AssetsManager.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitiesList extends StatelessWidget {
  const DoctorSpecialitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              width: Units.getWidth(
                context: context,
                value: 60,
              ),
              height: Units.getHeight(
                context: context,
                value: 60,
              ),
              decoration: BoxDecoration(
                color: ColorManager.PrimaryColor20,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AssetsManager.Icon,
                  width: Units.getWidth(
                    context: context,
                    value: 30,
                  ),
                  height: Units.getHeight(
                    context: context,
                    value: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Units.getVertical(
                context: context,
                value: 8,
              ),
            ),
            Text(
              'General',
              style: TextStyleManager.textStyleGreyColor50M12(
                context,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Container(
              width: Units.getWidth(
                context: context,
                value: 60,
              ),
              height: Units.getHeight(
                context: context,
                value: 60,
              ),
              decoration: BoxDecoration(
                color: ColorManager.PrimaryColor20,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AssetsManager.Icon1,
                  width: Units.getWidth(
                    context: context,
                    value: 30,
                  ),
                  height: Units.getHeight(
                    context: context,
                    value: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Units.getVertical(
                context: context,
                value: 8,
              ),
            ),
            Text(
              'Neurologic',
              style: TextStyleManager.textStyleGreyColor50M12(
                context,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Container(
              width: Units.getWidth(
                context: context,
                value: 60,
              ),
              height: Units.getHeight(
                context: context,
                value: 60,
              ),
              decoration: BoxDecoration(
                color: ColorManager.PrimaryColor20,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AssetsManager.Icon2,
                  width: Units.getWidth(
                    context: context,
                    value: 30,
                  ),
                  height: Units.getHeight(
                    context: context,
                    value: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Units.getVertical(
                context: context,
                value: 8,
              ),
            ),
            Text(
              'Pediatric',
              style: TextStyleManager.textStyleGreyColor50M12(
                context,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Container(
              width: Units.getWidth(
                context: context,
                value: 60,
              ),
              height: Units.getHeight(
                context: context,
                value: 60,
              ),
              decoration: BoxDecoration(
                color: ColorManager.PrimaryColor20,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AssetsManager.Icon3,
                  width: Units.getWidth(
                    context: context,
                    value: 30,
                  ),
                  height: Units.getHeight(
                    context: context,
                    value: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Units.getVertical(
                context: context,
                value: 8,
              ),
            ),
            Text(
              'Radiology',
              style: TextStyleManager.textStyleGreyColor50M12(
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}