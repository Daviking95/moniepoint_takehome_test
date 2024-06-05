part of 'package:nova/modules/onboarding/exports.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final onboardingWatcher;
  late final onboardingReader;

  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    onboardingWatcher = AppNavigator.appContext!.watch<OnboardingProvider>();

    onboardingReader = AppNavigator.appContext!.read<OnboardingProvider>();

    AppPreferences.isOnboardingCarouselSeenOnce = true;
  }

  @override
  void dispose() {
    // onboardingReader.animationController.dispose();
    // onboardingReader.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NovaVSpace(40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaImagePng(
                          imgPath: NovaAssets.logoPng,
                          width: 98.w,
                          height: 31.h,
                        ),
                        NovaVSpace(2)
,                        NovaImagePng(
                          imgPath: NovaAssets.licenceImage,
                          width: 120.w,
                          height: 15.h,
                        ),
                      ],
                    ),
                  ).paddingAll(16),
                  Expanded(
                    // height: context.height,
                    child: PageView.builder(
                      controller: onboardingWatcher.pageController,
                      itemCount: OnBoardingModel().onboardingList.length,
                      onPageChanged: (int index) {
                        setState(() {
                          onboardingWatcher.currentPageIndex = index;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final double pageOffset =
                            (index - onboardingWatcher.currentPageIndex)
                                .abs()
                                .toDouble();
                        final double scale = 1 - (pageOffset * 0.2);
                        return Transform.scale(
                          scale: scale,
                          child: onboardingWatcher
                              .icons[onboardingReader.currentPageIndex],
                        );
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
