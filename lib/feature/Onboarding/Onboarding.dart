import 'package:docdoc_app/core/Navigation/Routes.dart';
import 'package:docdoc_app/core/Share/Custome_main_bottun.dart';
import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/AssetsManager.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Units.getHeight(context: context, value: 62),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsManager.Logo,
                  width: Units.getWidth(
                    context: context,
                    value: 38.0217399597168,
                  ),
                  height: Units.getHeight(
                    context: context,
                    value: 38.0217399597168,
                  ),
                ),
                SizedBox(width: Units.getWidth(context: context, value: 8)),
                Text(
                  'Docdoc',
                  style: TextStyleManager.textStyleGreyColor100B20(context),
                ),
              ],
            ),
          ),

          SizedBox(height: Units.getHeight(context: context, value: 41.02)),

          Stack(
            alignment: .bottomCenter,
            children: [
              Image.asset(AssetsManager.image),

              Container(
                width: .infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.WhiteBackground,
                      ColorManager.WhiteBackground,
                      ColorManager.WhiteBackground,
                      ColorManager.WhiteBackground.withAlpha(90),
                    ],
                    begin: .bottomCenter,
                    end: .topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Best Doctor\nAppointment App',
                      textAlign: TextAlign.center,
                      style: TextStyleManager.textStylePrimaryColor100B32(
                        context,
                      ),
                    ),
                    SizedBox(
                      height: Units.getHeight(context: context, value: 10),
                    ),
                    Text(
                      'Manage and schedule all of your medical appointments easily \nwith Docdoc to get a new experience.',
                      style: TextStyleManager.textStyleBodyBackgroundR10(
                        context,
                      ),
                      textAlign: .center,
                    ),
                    SizedBox(
                      height: Units.getHeight(context: context, value: 32),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomMainButton(
            onPressed: () {
              setState(() {
                context.pushReplacement(Routes.kLogin);
              });
            },
            btnTitle: 'Continue',
            title: 'Continue',
          ),
        ],
      ),
    );
  }
}
