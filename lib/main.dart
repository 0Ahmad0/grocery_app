import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/app/grocery_app.dart';
import 'package:grocery/core/routing/app_router.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(
    GroceryApp(
      appRouter: AppRouter(),
    ),
  );
}
