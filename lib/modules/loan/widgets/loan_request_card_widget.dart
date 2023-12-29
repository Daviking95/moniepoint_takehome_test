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
                Container(
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                      color: PLColors.appGreenColor),
                  child: Center(
                    child: PLTextWidget(
                      title: marketplaceLoan.lendlyScore.toString(),
                      textColor: PLColors.appWhiteColor,
                      // fontWeight: FontWeight.bold,
                      // fontFamily: PLTypography.fontFamilyBold,
                      textSize: PLTypography.fontTitleLarge,
                    ),
                  ),
                ),
                PLHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLTextWidget(
                        title: marketplaceLoan.fullName,
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
}
