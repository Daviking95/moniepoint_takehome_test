part of 'package:peerlendly/modules/app_tutorial/exports.dart';


class TutorialStep3Widget extends StatelessWidget {
  const TutorialStep3Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseStackedWidget(
      iconSet: PLAssets.peopleSmiling,
      buildWidget: step1Widget(),
      topHeight: 200.h,
    );
  }

  step1Widget() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          backgroundColor: PLColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PLVSpace(32),
                          PLTextWidget(
                            title: "Fund a Loan",
                            isTitle: true,
                            textStyle: PLTypography.textHeadlineMediumStyle,
                            textSize: PLTypography.fontHeadlineSmall,
                          ),
                          PLVSpace(5),
                          PLTextWidget(
                            title:
                            "Fund a loan request by clicking the Marketplace button",
                            textColor: PLColors.appGrayText,
                            textSize: PLTypography.fontLabelMedium,
                          ),
                          PLVSpace(20),

                        ]),
                    PLImagePng(
                      imgPath: PLAssets.step2Icon,
                      width: 156.w,
                      height: 338.h,
                      boxFit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: strNext,
                          functionToRun: () {
                            AppNavigator.push(const TutorialStep4Widget());
                          },
                        ),
                        PLVSpace(24),

                      ],
                    ),
                  ])),
        ),
      ),
    );
  }
}
