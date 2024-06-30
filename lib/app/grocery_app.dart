import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery/core/helpers/extensions.dart';
import 'package:grocery/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/routing/routes.dart';
import 'package:grocery/core/utils/color_manager.dart';
import 'package:grocery/core/utils/const_value_manage.dart';
import 'package:grocery/core/utils/string_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize:
          const Size(ConstValueManager.widthSize, ConstValueManager.heightSize),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: StringManager.appName,
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            primaryColor: ColorManager.primaryColor,
            primarySwatch: ColorManager.primaryColor.toMaterialColor(),
            scaffoldBackgroundColor: ColorManager.scaffoldColor
          ),
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
