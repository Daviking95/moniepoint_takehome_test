part of 'package:peerlendly/modules/loan/exports.dart';

class LoanRequestCardWidget extends StatelessWidget {
  final String dateCreated;
  final MarketplaceResponseModelLoanDetail marketplaceLoan;
  const LoanRequestCardWidget({
    Key? key,
    required this.dateCreated, required this.marketplaceLoan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!_isUserBVNValidated(context)) return;

        AppNavigator.navigateRoute(
            context: context,
            routeType: 7,
            route: LoanRequestSummaryCard(marketplaceLoan: marketplaceLoan));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: PLColors.appWhiteColor,
                borderRadius: PLDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LendlyScoreCard(
                  score:
                  marketplaceLoan.lendlyScore ?? 0,
                  bgColor: PLColors.appGreenColor,
                ),
                PLHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLTextWidget(
                        title: marketplaceLoan.fullName.toTitleCase,
                        textColor: PLColors.appPrimaryText,
                        fontFamily: PLTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: PLTypography.fontBodySmall,
                      ),
                      PLVSpace(8),
                      PLTextWidget(
                        title: "Payback Period - ${marketplaceLoan.duration} Days",
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelSmall,
                      ),
                    ],
                  ),
                ),
                PLHSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PLTextWidget(
                      title: marketplaceLoan.loanAmount.toString().formatWithCommasAndDecimals(),
                      textStyle: PLTypography.textTitleSmallStyle,
                      textSize: PLTypography.fontBodyMedium,
                      fontFamily: PLTypography.fontFamilyMedium,
                      fontWeight: FontWeight.w500,
                      textColor: PLColors.appPrimaryText,
                      maxLines: 1,
                      isCurrency: true,
                    ),
                  ],
                ),
                PLHSpace(5),
                PLForwardIcon(onTap: () {}),

              ],
            ).paddingSymmetric(horizontal: 8, vertical: 16),
          ),
        ],
      ).marginOnly(bottom: 10),
    );
  }

  bool _isUserBVNValidated(BuildContext context) {
    if (!(AppData.getUserProfileResponseModel?.bvnVerified ?? false)) {
      showAlertDialog(context, '', const VerifyAccountPopUp());
      return false;
    } else if ((AppData.getUserProfileResponseModel?.fullName ?? "").isEmpty ||
        (AppData.getUserProfileResponseModel?.fullName ?? "")
            .contains("N/A")) {
      showAlertDialog(context, '', const UpdateProfilePopUp());
      return false;
    } else {
      return true;
    }
  }
}
