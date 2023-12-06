part of 'package:peerlendly/modules/app_tutorial/exports.dart';


class TutorialStep4Widget extends StatelessWidget {
  const TutorialStep4Widget({Key? key}) : super(key: key);

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
                              title: "Fund a Loan",
                              isTitle: true,
                              textStyle: PLTypography.textHeadlineMediumStyle,
                              textSize: PLTypography.fontHeadlineSmall,
                            ),
                            PLVSpace(5),
                            PLTextWidget(
                              title:
                              "Set your terms and make an offer to a Borrower",
                              textColor: PLColors.appGrayText,
                              textSize: PLTypography.fontLabelMedium,
                            ),
                            PLVSpace(28),
                            const LoanJourneyItem(
                                PLAssets.loanJourneyIcon5, "View Marketplace"),
                            const DownArrow(),
                            const LoanJourneyItem(PLAssets.loanJourneyIcon6,
                                "Select a Loan"),
                            const DownArrow(),
                            const LoanJourneyItem(
                                PLAssets.loanJourneyIcon2, "Submit Offer"),
                            const DownArrow(),
                            const LoanJourneyItem(
                                PLAssets.loanJourneyIcon4, "Fund a loan"),
                          ]),
                      Column(
                        children: [
                          PLButtonRound(
                            textTitle: strNext,
                            functionToRun: () {
                              AppNavigator.pushAndRemoveUtil(const PersistentTab());
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
