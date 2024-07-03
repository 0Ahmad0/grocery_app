import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/app/screens/categories/logic/category_const.dart';
import 'package:grocery/core/helpers/extensions.dart';
import 'package:grocery/core/routing/routes.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/color_manager.dart';
import 'package:grocery/core/utils/string_manager.dart';
import 'package:grocery/core/utils/style_manager.dart';

import 'widgets/home_section_widget.dart';

bool isFav = false;
final List<String> imageUrls = [
  'https://via.placeholder.com/400',
  'https://via.placeholder.com/400',
  'https://via.placeholder.com/400',
];

final List<String> categories = [
  'Category 1',
  'Category 2',
  'Category 3',
  'Category 4',
];

final List<String> products = List.generate(20, (index) => 'Product $index');

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 14.h,
            ),
          ),
          SliverAppBar(
            floating: true,
            leadingWidth: 0.0,
            leading: SizedBox.shrink(),
            snap: true,
            title: TextField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: ColorManager.grayColor,
                    ),
                  ),
                  hintText: StringManager.searchKeyword,
                  hintStyle:
                      StyleManager.font14Medium(color: ColorManager.grayColor),
                  fillColor: ColorManager.scaffoldColor,
                  filled: true),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                height: 282.h,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Image.network(url, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          HomeSectionWidget(
            label: StringManager.categories,
            onTap: () {
              context.pushNamed(Routes.categoriesScreen);
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CategoryConst.categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 2,
                          child: SvgPicture.asset(
                              CategoryConst.categories[index].image),
                        ),
                        Flexible(
                          child: Text(
                            CategoryConst.categories[index].name,
                            style: StyleManager.font10Medium(
                                color: ColorManager.grayColor),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
          HomeSectionWidget(
            label: StringManager.featuredProducts,
            onTap: () {},
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: .75),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorManager.scaffoldColor,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 4,
                                child: Image.asset(
                              AssetsManager.lemonIMG,
                            )),
                            Flexible(
                                child: Text(
                              '\$2.09',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: StyleManager.font12Medium(
                                  color: ColorManager.primaryDarkColor),
                            )),
                            Flexible(
                                child: Text(
                              'Pomegranate',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                              style: StyleManager.font14Bold(),
                            )),
                            Flexible(

                                child: Text(
                              '1.50 lbs',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                              style: StyleManager.font12Medium(
                                color: ColorManager.grayColor,
                              ),
                            )),
                            const Spacer(),
                            Divider(),
                            TextButton.icon(
                              onPressed: () {},
                              label: Text(
                                StringManager.addToCart,
                                style: StyleManager.font12Medium(),
                              ),
                              icon: SvgPicture.asset(
                                AssetsManager.cartIcon,
                                color: ColorManager.primaryDarkColor,
                              ),
                            )
                          ],
                        ),
                        StatefulBuilder(builder: (context, FavoriteSetState) {
                          return Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                FavoriteSetState(() {
                                  isFav = !isFav;
                                });
                              },
                              icon: ZoomIn(
                                key: UniqueKey(),
                                child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: isFav ? 30.sp : null,
                                  color: isFav
                                      ? ColorManager.errorColor
                                      : ColorManager.grayColor,
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  );
                },
                childCount: products.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 14.h,
            ),
          ),
        ],
      ),
    );
  }
}
