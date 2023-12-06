part of 'package:peerlendly/modules/onboarding/exports.dart';

class PageviewWidget extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  final int index;

  const PageviewWidget(this.onBoardingModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingWatcher = context.watch<OnboardingProvider>();

    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PLVSpace(8),
          PLImagePng(
            imgPath: onBoardingModel.imagePath!,
            width: 202.w,
            height: 264.h,
          ),
          PLVSpace(32),
          SizedBox(
            width: 300.w,
            child: _titleSubTitle(onBoardingModel.onBoardingTitle1!,onBoardingModel.onBoardingTitle2!,onBoardingModel.onBoardingTitle3!),
          ),
          PLVSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildPageIndicator(context, OnboardingProvider.onboardingList.length, onboardingWatcher.currentPageIndex, PLColors.appPrimaryColorMain500, 16),
          ),
          // PLVSpace(20),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }

  Widget _titleSubTitle(String text1, String text2, String text3) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: text1,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: PLTypography.fontDisplaySmall,
                fontFamily: PLTypography.fontFamilyLight
              )),
          TextSpan(
            text: " $text2 ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: PLTypography.fontDisplaySmall,
              color: PLColors.appPrimaryColorMain500,
            ),
          ),
          TextSpan(
              text: text3,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: PLTypography.fontDisplaySmall,
                fontFamily: PLTypography.fontFamilyLight
              )),
        ],
      ),
      textAlign: TextAlign.center,
      softWrap: true,
      maxLines: 2,

    );
  }
}
