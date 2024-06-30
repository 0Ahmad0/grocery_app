import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/style_manager.dart';
import 'package:grocery/core/widgets/app_button.dart';

import '../../../../core/utils/color_manager.dart';

class OnBoardingChildWidget extends StatelessWidget {
  const OnBoardingChildWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.h,
          ),
          FadeInUp(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                title,
                style: StyleManager.font20Bold(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          FadeInUp(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                description,
                style:
                    StyleManager.font14Regular(color: ColorManager.grayColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: FadeInUpBig(
              child: Image.asset(
                image,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
