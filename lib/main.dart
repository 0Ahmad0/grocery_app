import 'package:flutter/material.dart';
import 'package:grocery/app/grocery_app.dart';
import 'package:grocery/core/routing/app_router.dart';

void main() {
  runApp(
    GroceryApp(
      appRouter: AppRouter(),
    ),
  );
}
