import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';
import '../utils/const_value_manage.dart';
import '../utils/style_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        gradient: const LinearGradient(
          colors: [
            ColorManager.primaryColor,
            ColorManager.primaryDarkColor,
          ],
          begin: Alignment.bottomCenter,
          stops: [.1, 1],
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          minimumSize: Size.fromHeight(ConstValueManager.heightButtonSize.h),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: StyleManager.font14Bold(color: ColorManager.whiteColor),
        ),
      ),
    );
  }
}
