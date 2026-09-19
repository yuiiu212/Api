import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/AssetsManager.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.PrimaryColor80,
        borderRadius: BorderRadius.circular(
          Units.getRadius(context: context, value: 20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(
                Units.getWidth(context: context, value: 20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book and schedule with nearest doctor',
                    style: TextStyleManager.textStylewhitSB20(context),
                  ),

                  SizedBox(
                    height: Units.getVertical(context: context, value: 15),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.WhiteBackground,
                      foregroundColor: ColorManager.PrimaryColor100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Units.getRadius(context: context, value: 20),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Units.getHorizontal(
                          context: context,
                          value: 20,
                        ),
                        vertical: Units.getVertical(
                          context: context,
                          value: 10,
                        ),
                      ),
                    ),
                    child: const Text('Find Nearby'),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: Units.getVertical(context: context, value: 160),
                margin: EdgeInsets.only(
                  top: Units.getVertical(context: context, value: 20),
                ),
                child: Center(
                  child: Image.asset(
                    AssetsManager.image2,
                    width: Units.getWidth(context: context, value: 160),
                    height: Units.getVertical(context: context, value: 160),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
