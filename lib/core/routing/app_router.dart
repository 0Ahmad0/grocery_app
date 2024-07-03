import 'package:flutter/material.dart';
import 'package:grocery/app/screens/categories/categories_screen.dart';
import 'package:grocery/app/screens/home/home_screen.dart';
import 'package:grocery/app/screens/onboarding/onboarding_screen.dart';

import '../../app/screens/details/details_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());

      case Routes.detailsScreen:
        return MaterialPageRoute(builder: (_) => DetailsScreen());

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
