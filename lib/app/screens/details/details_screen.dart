import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery/core/utils/string_manager.dart';
import 'package:grocery/core/utils/style_manager.dart';
import 'package:grocery/core/widgets/app_button.dart';
import 'package:grocery/core/widgets/app_button_with_icon.dart';
import 'package:readmore/readmore.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';

int quantityNum = 0;

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Column(
        children: [
          Expanded(
              child: FadeInDownBig(
                child: Stack(
            children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Container(
                  height: ScreenUtil.defaultSize.height / 2,
                  decoration: BoxDecoration(
                      color: ColorManager.detailsContainerColor,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(200.r, 130.r))),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ZoomIn(
                    delay: Duration(milliseconds: 1000),
                    child: Image.asset(
                      AssetsManager.lemonIMG,
                      width: 300.w,
                      height: 300.w,
                    ),
                  ),
                ),
                SafeArea(child: BackButton())
            ],
          ),
              )),
          Expanded(
              child: FadeInUpBig(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
              decoration: BoxDecoration(
                color: ColorManager.scaffoldColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$2.22',
                      style: StyleManager.font20Bold(
                          color: ColorManager.primaryDarkColor),
                    ),
                    Text(
                      'Organic Lemons',
                      style: StyleManager.font20Bold(),
                    ),
                    Text(
                      '1.50 lbs',
                      style: StyleManager.font12Medium(
                          color: ColorManager.grayColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          '4.5',
                          style: StyleManager.font12Medium(),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        RatingBar.builder(
                            glow: false,
                            allowHalfRating: true,
                            itemSize: 14.w,
                            initialRating: .5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                            itemBuilder: (_, index) => SvgPicture.asset(
                                  AssetsManager.starIcon,
                                  width: 14.w,
                                  height: 14.h,
                                ),
                            onRatingUpdate: (value) {}),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '(89 reviews)',
                          style: StyleManager.font12Medium(
                              color: ColorManager.grayColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ReadMoreText(
                      'Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world\'s finest lemon for juicing' +
                          ' ',
                      trimMode: TrimMode.Line,
                      style: StyleManager.font14Medium(
                          color: ColorManager.grayColor),
                      trimLines: 5,
                      colorClickableText: Colors.pink,
                      trimCollapsedText: StringManager.more,
                      trimExpandedText: StringManager.less,
                      moreStyle: StyleManager.font14Bold(),
                      lessStyle: StyleManager.font14Bold(
                          color: ColorManager.primaryColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.whiteColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              StringManager.quantity,
                              style: StyleManager.font12Medium(
                                color: ColorManager.grayColor,
                              ),
                            ),
                            const Spacer(),
                            StatefulBuilder(
                                builder: (context, QuantitySetState) {
                              return Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        QuantitySetState(() {
                                          if (quantityNum > 0) quantityNum--;
                                        });
                                      },
                                      icon: Icon(Icons.remove,
                                          color:
                                              ColorManager.primaryDarkColor)),
                                  VerticalDivider(),
                                  Text(
                                    '  $quantityNum  ',
                                    style: StyleManager.font20Bold(),
                                  ),
                                  VerticalDivider(),
                                  IconButton(
                                      onPressed: () {
                                        QuantitySetState(() {
                                          if (quantityNum < 100) quantityNum++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: ColorManager.primaryDarkColor,
                                      )),
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    AppButtonWithIcon(
                      label: StringManager.addToCart,
                      onPressed: () {},
                      icon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: SvgPicture.asset(AssetsManager.cartIcon),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
