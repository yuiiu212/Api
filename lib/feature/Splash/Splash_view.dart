import 'package:docdoc_app/core/Navigation/Routes.dart';
import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/AssetsManager.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.WhiteBackground,
      body: Center(
        child: Row(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          mainAxisSize: .max,
          children: [
            Image.asset(
              AssetsManager.Logo,
              width: Units.getWidth(context: context, value: 72.04119110107422),
              height: Units.getHeight(
                context: context,
                value: 72.04119110107422,
              ),
            ),
            SizedBox(width: Units.getWidth(context: context, value: 15)),
            Text(
              'Docdoc',
              style: TextStyleManager.textStyleGreyColor100B50(context),
            ),
          ],
        ),
      ),
    );
  }

  void routingtoOnboarding() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.pushReplacement(Routes.kOnboardingView);
    });
  }

  @override
  void initState() {
    routingtoOnboarding();
    super.initState();
  }
}
