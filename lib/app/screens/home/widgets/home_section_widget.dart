import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/style_manager.dart';

class HomeSectionWidget extends StatelessWidget {
  const HomeSectionWidget({
    super.key,
    required this.label,
    required this.onTap,
  });
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                label,
                style: StyleManager.font20Bold(),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: ColorManager.blackColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
