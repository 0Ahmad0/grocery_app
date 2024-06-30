import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/app/screens/onboarding/logic/on_boarding_cubit.dart';
import 'package:grocery/app/screens/onboarding/widgets/on_boarding_child_widget.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';
import 'logic/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
                listener: (context, state) {
              if (state is OnboardingCompleted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Scaffold(
                  )),
                );
              }
            }, builder: (context, state) {
              final cubit = context.read<OnBoardingCubit>();
              final page = cubit.pages[state.pageIndex];
              return PageView.builder(
                itemCount: cubit.pages.length,
                itemBuilder: (context, index) => OnBoardingChildWidget(
                  title: cubit.pages[index].title,
                  description: cubit.pages[index].description,
                  image: cubit.pages[index].image,
                ),
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 60.h),
            child: ZoomIn(
              delay: Duration(milliseconds: 600),
              child: AppButton(label: 'Login'),
            ),
          ),
        ],
      ),
    );
  }
}
