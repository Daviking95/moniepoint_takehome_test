part of 'package:nova/modules/onboarding/exports.dart';

class OnboardingMenuScreen extends StatelessWidget {
  const OnboardingMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onboardingWatcher = context.watch<OnboardingProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NovaVSpace(80),
                            // Text.rich(
                            //   TextSpan(
                            //     children: [
                            //       TextSpan(
                            //           text: "Welcome To ",
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w400,
                            //               fontSize: NovaTypography.fontHeadlineMedium,
                            //               fontFamily:
                            //               NovaTypography.fontFamilyRegular)),
                            //       TextSpan(
                            //         text: dotenv.env['APP_NAME'],
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.w500,
                            //             fontSize: NovaTypography.fontHeadlineMedium,
                            //             color: NovaColors.appPrimaryColorMain500,
                            //             fontFamily: NovaTypography.fontFamilyMedium),
                            //       ),
                            //     ],
                            //   ),
                            //   textAlign: TextAlign.left,
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                NovaTextWidget(
                                  title: "Welcome To ",
                                  textStyle:
                                      NovaTypography.textHeadlineMediumStyle,
                                  textSize: NovaTypography.fontHeadlineMedium,
                                  textColor: NovaColors.appBlackColor,
                                ),
                                NovaTextWidget(
                                  title: dotenv.env['APP_NAME'],
                                  textStyle:
                                      NovaTypography.textBodyMediumStyleBold,
                                  textSize: NovaTypography.fontHeadlineMedium,
                                  textColor: NovaColors.appPrimaryColorMain500,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: NovaTypography.fontFamilyMedium,
                                ),
                              ],
                            ),
                            NovaVSpace(5),
                            NovaTextWidget(
                              title:
                                  "What you require to get started with ${dotenv.env['APP_NAME']} 👇",
                              textColor: NovaColors.appBlackColor,
                              textSize: NovaTypography.fontLabelLarge,
                            ),
                            NovaVSpace(32),
                            const MenuItemWidget(
                                img: NovaAssets.onboardingMenuBvn,
                                text: "Your BVN"),
                            NovaVSpace(32),
                            const MenuItemWidget(
                                img: NovaAssets.onboardingMenuPhoto,
                                text: "Photo Of Your Face"),
                            NovaVSpace(20),
                          ]),
                      Column(
                        children: [
                          TermsAndConditionTextWidget(
                          showCheckbox: true,
                              isChecked: (val) {
                            onboardingWatcher.isTermsChecked = val;
                          }),
                          NovaVSpace(8),
                          NovaButtonRound(
                            textTitle: strProceed,
                            isFormValidated: onboardingWatcher.isTermsChecked,
                            hasBgImg: true,
                            functionToRun: () {
                              "calling".logger();
                              AppNavigator.push(const SignupScreen());
                            },
                          ),
                          NovaVSpace(24),
                        ],
                      ),
                    ]),
              )),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String img;
  final String text;

  const MenuItemWidget({
    super.key,
    required this.img,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NovaImageSvg(
          svgPath: img,
          width: 50.w,
          height: 50.h,
        ),
        NovaHSpace(16),
        NovaTextWidget(
          title: text,
          textColor: NovaColors.appBlackColor,
          textSize: NovaTypography.fontTitleMedium,
        ),
      ],
    );
  }
}
