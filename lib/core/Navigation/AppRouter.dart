import 'package:docdoc_app/feature/Home/Presentation/view/Home_view.dart';
import 'package:docdoc_app/feature/Login/View/Login_view.dart';
import 'package:docdoc_app/feature/Signup/view/Signup_view.dart';
import 'package:docdoc_app/core/Navigation/Routes.dart';
import 'package:docdoc_app/feature/Onboarding/Onboarding.dart';
import 'package:docdoc_app/feature/Splash/Splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter appRouter = GoRouter(routes: routes);
  static List<GoRoute> routes = [
    GoRoute(
      path: Routes.kSplashView,
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: Routes.kOnboardingView,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: Routes.kLogin,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: Routes.kSignup,
      builder: (context, state) => SignupView(),
    ),
    GoRoute(
      path: Routes.kHome,
      builder: (context, state) => HomeView(),
    ),
  ];
}
