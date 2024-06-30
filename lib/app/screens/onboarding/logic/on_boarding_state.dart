abstract class OnBoardingState {
  final int pageIndex;

  const OnBoardingState(this.pageIndex);
}

class OnboardingInitial extends OnBoardingState {
  OnboardingInitial() : super(0);
}

class OnboardingPageChanged extends OnBoardingState {
  const OnboardingPageChanged(int pageIndex) : super(pageIndex);
}

class OnboardingCompleted extends OnBoardingState {
  OnboardingCompleted() : super(-1);
}