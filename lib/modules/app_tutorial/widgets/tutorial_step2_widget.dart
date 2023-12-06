part of 'package:peerlendly/modules/app_tutorial/exports.dart';

class TutorialStep2Widget extends StatelessWidget {
  const TutorialStep2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return step2Widget();
  }

  step2Widget() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          backgroundColor: PLColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PLVSpace(64),
                            PLTextWidget(
                              title: "Request a Loan",
                              isTitle: true,
                              textStyle: PLTypography.textHeadlineMediumStyle,
                              textSize: PLTypography.fontHeadlineSmall,
                            ),
                            PLVSpace(5),
                            PLTextWidget(
                              title:
                                  "State exactly how much you want and when you can repay ",
                              textColor: PLColors.appGrayText,
                              textSize: PLTypography.fontLabelMedium,
                            ),
                            PLVSpace(28),
                            const LoanJourneyItem(
                                PLAssets.loanJourneyIcon1, "Request New Loan"),
                            const DownArrow(),
                            const LoanJourneyItem(PLAssets.loanJourneyIcon2,
                                "Say the Purpose of your Loan"),
                            const DownArrow(),
                            const LoanJourneyItem(
                                PLAssets.loanJourneyIcon3, "Set Amount & Date"),
                            const DownArrow(),
                            const LoanJourneyItem(
                                PLAssets.loanJourneyIcon4, "Submit Request"),
                          ]),
                      Column(
                        children: [
                          PLButtonRound(
                            textTitle: strNext,
                            functionToRun: () {
                              AppNavigator.push(const TutorialStep3Widget());
                            },
                          ),
                          PLVSpace(24),
                        ],
                      ),
                    ]),
              )),
        ),
      ),
    );
  }
}
