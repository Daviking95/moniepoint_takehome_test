part of 'package:peerlendly/modules/app_tutorial/exports.dart';

class TutorialMainWidget extends StatelessWidget {
  const TutorialMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        title: "Welcome to the Peer Lendly Community",
                        isTitle: true,
                        textStyle: PLTypography.textHeadlineMediumStyle,
                        textSize: PLTypography.fontHeadlineSmall,
                      ),
                      PLVSpace(5),
                      PLTextWidget(
                        title:
                            "Are you here to fund dreams or fulfil yours? \nLearn how to request or fund a loan to get started. ",
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(20),
                      PLCardsWithTextAndImage(
                          bgColor: PLColors.appPrimaryColorMain500,
                          imageWidget: PLImagePng(
                            imgPath: PLAssets.tutRequestLoan,
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.fill,
                          ),
                          textWidget: [
                            const PLTextWidget(
                              title: "Request a Loan",
                              textColor: PLColors.appWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                            PLVSpace(8),
                            PLTextWidget(
                              title: "Begin your journey! Define how much you wish to borrow.",
                              textColor: PLColors.appWhiteColor,
                              textSize: PLTypography.fontBodySmall,
                            )
                          ]),
                      PLVSpace(8),
                      PLCardsWithTextAndImage(
                          bgColor: PLColors.appPrimaryColorMain500,
                          imageWidget: PLImagePng(
                            imgPath: PLAssets.tutLendLoan,
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.fill,
                          ),
                          textWidget: [
                            const PLTextWidget(
                              title: "Fund a Loan",
                              textColor: PLColors.appWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                            PLVSpace(8),
                            PLTextWidget(
                              title: "Dive in and handpick loans you'd love to fund in the Lendly Marketplace!",
                              textColor: PLColors.appWhiteColor,
                              textSize: PLTypography.fontBodySmall,
                            )
                          ]),
                    ],
                  ),
                  Column(
                    children: [
                      PLButtonRound(
                        textTitle: strNext,
                        functionToRun: () {

                          AppPreferences.userHasWatchedTutorial = true;

                          AppNavigator.push(const TutorialStep1Widget());
                        },
                      ),
                      PLButtonOutline(
                          borderColor: PLColors.appWhiteColor,
                          textTitle: "Skip Tutorial",
                          functionToRun: () {

                            AppPreferences.userHasWatchedTutorial = true;

                            AppNavigator.pushAndRemoveUtil(const PersistentTab());
                          }),
                      PLVSpace(4),

                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
