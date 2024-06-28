import 'package:flutter/material.dart';
import 'package:grocery/app/screens/login/login_screen.dart';
import 'package:grocery/app/screens/onboarding/onboarding_screen.dart';

import '../../app/screens/signup/signup_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No routes defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
