part of 'package:nova/modules/onboarding/exports.dart';

class PageviewWidget extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  final int index;

  const PageviewWidget(this.onBoardingModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingWatcher = context.watch<OnboardingProvider>();

    return Stack(
      children: [
        Positioned(
            bottom: -.5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NovaImagePng(
                imgPath: onBoardingModel.onboardingList[index].imagePathBg ??
                    NovaAssets.pageviewOneBgPng,
                width: context.width,
                height: index == 1 ? 470.h : 510.h,
                boxFit: BoxFit.fill,
              ),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NovaImagePng(
                  imgPath: onBoardingModel.imagePath!,
                  width: 350.w,
                  height: 360.h,
                ),
                // NovaVSpace(32),
              ],
            ),
            _titleSubTitle(onBoardingModel.onBoardingTitle1!,
                onBoardingModel.onBoardingTitle2!),
            index == onBoardingModel.onboardingList.length - 1
                ? Column(
                    children: [
                      NovaButtonRound(
                          textTitle: "Get Started",
                          textColor: NovaColors.appPrimaryColorMain500,
                          bgColor: NovaColors.appWhiteColor,
                          isAllCaps: true,
                          functionToRun: () {
                            AppNavigator.push(const OnboardingMenuScreen());
                          }),
                      // NovaVSpace(14),
                      NovaButtonRound(
                        textTitle: "Already Have An Account",
                        textColor: NovaColors.appWhiteColor,
                        textStyle: NovaTypography.textBodyMediumStyleBold
                            .copyWith(
                                color: NovaColors.appWhiteColor,
                                fontFamily: NovaTypography.fontFamilyMedium),
                        bgColor: Color(0xff25215E),
                        isAllCaps: true,
                        functionToRun: () {
                          AppNavigator.push(const HaveAnAccountScreen());
                        }
                      ),
                      NovaVSpace(20),
                    ],
                  ).paddingSymmetric(horizontal: 32)
                : Stack(
                    children: [
                      Positioned(
                        right: 15,
                        child: InkWell(
                          onTap: () {
                            onboardingWatcher.pageController.animateToPage(
                              onboardingWatcher.currentPageIndex + 1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            width: 64.w,
                            height: 64.h,
                            decoration: BoxDecoration(
                              borderRadius: NovaDecorations
                                  .borderRadiusGeometryCircular100,
                              color: const Color(0xff066194),
                            ),
                            child: NovaImageSvg(
                              svgPath: NovaAssets.onboardingArrow,
                              height: 17.h,
                              width: 17.w,
                            ).paddingAll(20),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          NovaVSpace(40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: buildPageIndicator(
                                context,
                                OnboardingProvider.onboardingList.length,
                                onboardingWatcher.currentPageIndex,
                                NovaColors.appPrimaryColor900,
                                16),
                          ),
                          NovaVSpace(40),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ],
    );
  }

  Widget _titleSubTitle(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NovaVSpace(20),
        NovaTextWidget(
          title: text1,
          textSize: NovaTypography.fontDisplaySmall,
          fontWeight: FontWeight.w800,
          fontFamily: NovaTypography.fontFamilyBold,
          textColor: NovaColors.appWhiteColor,
          textAlign: TextAlign.center,
        ),
        NovaVSpace(8),
        SizedBox(
          width: 350.w,
          child: NovaTextWidget(
            title: text2,
            textSize: NovaTypography.fontBodyLarge,
            textColor: NovaColors.appWhiteColor,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
