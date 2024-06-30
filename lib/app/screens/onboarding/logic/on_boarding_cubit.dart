import 'package:bloc/bloc.dart';
import 'package:grocery/app/screens/onboarding/logic/on_boarding_state.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:meta/meta.dart';

import '../widgets/on_boarding_child_widget.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnboardingInitial());
  final List<OnBoardingChildWidget> pages = [
    OnBoardingChildWidget(
        title: "Welcome",
        description: "Welcome to this amazing app!",
        image: AssetsManager.obBoardingIMG1),
    OnBoardingChildWidget(
        title: "Features",
        description: "Discover awesome features.",
        image: AssetsManager.obBoardingIMG2),
    OnBoardingChildWidget(
        title: "Get Started",
        description: "Let's get started!",
        image: AssetsManager.obBoardingIMG3),
  ];
}
