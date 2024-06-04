part of 'package:nova/modules/loan/exports.dart';

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
                color: NovaColors.appWhiteColor,
                borderRadius: NovaDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LendlyScoreCard(
                  score:
                  marketplaceLoan.lendlyScore,
                  bgColor: NovaColors.appGreenColor,
                ),
                NovaHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaTextWidget(
                        title: marketplaceLoan.fullName.toTitleCase,
                        textColor: NovaColors.appPrimaryText,
                        fontFamily: NovaTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: NovaTypography.fontBodySmall,
                      ),
                      NovaVSpace(8),
                      NovaTextWidget(
                        title: "Payback Period - ${marketplaceLoan.duration} Days",
                        textColor: NovaColors.appGrayText,
                        textSize: NovaTypography.fontLabelSmall,
                      ),
                    ],
                  ),
                ),
                NovaHSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    NovaTextWidget(
                      title: marketplaceLoan.loanAmount.toString().formatWithCommasAndDecimals(),
                      textStyle: NovaTypography.textTitleSmallStyle,
                      textSize: NovaTypography.fontBodyMedium,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      fontWeight: FontWeight.w500,
                      textColor: NovaColors.appPrimaryText,
                      maxLines: 1,
                      isCurrency: true,
                    ),
                  ],
                ),
                NovaHSpace(5),
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
