import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/style_manager.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: InkWell(
        borderRadius: BorderRadius.circular(6.r),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(6.sp),
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                image,
                width: 66.w,
                height: 66.h,
              ),
              Flexible(
                  child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: StyleManager.font10Medium(color: ColorManager.grayColor),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
