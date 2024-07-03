import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery/app/screens/categories/logic/category_const.dart';
import 'package:grocery/app/screens/categories/widgets/category_item_widget.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/color_manager.dart';
import 'package:grocery/core/utils/string_manager.dart';
import 'package:grocery/core/utils/style_manager.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.categories),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 20.h
        ),
        itemCount: CategoryConst.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 14.h,
        ),
        itemBuilder: (context, index) => CategoryItemWidget(
          name: CategoryConst.categories[index].name,
          image: CategoryConst.categories[index].image,


        ),
      ),
    );
  }
}
