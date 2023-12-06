part of 'package:peerlendly/modules/onboarding/exports.dart';

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

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   onboardingWatcher.setAnimationController(this);
    //   onboardingWatcher.animateSlider();
    // });
  }

  @override
  void dispose() {
    // onboardingReader.animationController.dispose();
    onboardingReader.pageController.dispose();
    // onboardingReader.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          PLAssets.pageViewBgPng,
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.height / 1.75,
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
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: strCreateAnAccount,
                          functionToRun: () =>
                              Navigator.pushNamed(context, AppRoutes.signUp),
                        ),
                        PLVSpace(14),
                        const AlreadyHaveAccountWidget(),
                      ],
                    ).paddingSymmetric(horizontal: 20, vertical: 16),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
