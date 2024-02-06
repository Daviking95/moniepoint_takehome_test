part of 'package:peerlendly/modules/onboarding/exports.dart';

class OnboardingProvider extends ChangeNotifier{

  int _currentPageIndex = 0;
  late Timer timer;
  late PageController pageController = PageController();
  late AnimationController _animationController;
  final slideDuration = const Duration(seconds: 5);

  AnimationController get animationController => _animationController;

  set animationController(AnimationController value) {
    _animationController = value;
    notifyListeners();
  }

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int value) {
    _currentPageIndex = value;
    notifyListeners();
  }

  static List<OnBoardingModel> onboardingList =
      OnBoardingModel().onboardingList;

  void setAnimationController(_OnboardingScreenState onboardingScreenState) {
    _animationController = AnimationController(
      vsync: onboardingScreenState,
      duration: slideDuration,
    );
    notifyListeners();
  }

  void animateSlider() {
    timer = Timer.periodic(slideDuration, (timer) async {
      currentPageIndex = (currentPageIndex + 1) % onboardingList.length;

      // if (currentPageIndex < onboardingList.length - 1) {
        pageController.animateToPage(
          currentPageIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      // }
      notifyListeners();
    });
  }

  List<Widget> icons = [
    PageviewWidget(onboardingList[0], 0),
    PageviewWidget(onboardingList[1], 1),
    PageviewWidget(onboardingList[2], 2),
  ];

  void loadApp(BuildContext context) async {
    String? returningCustomer = AppPreferences.returnDetails;
    Future.delayed(const Duration(seconds: 2), () async {
      "returningCustomer $returningCustomer".logger();

      // returningCustomer != null && returningCustomer != ""
      AppPreferences.isOnboardingCarouselSeenOnce
          ?
      AppPreferences.isReturningCustomer && AppPreferences.returnDetails.isNotEmpty
          ?
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false)
          :
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signUp, (route) => false)
          :
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.onboarding, (route) => false); // onboarding
    });
  }
}