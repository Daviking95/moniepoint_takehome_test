part of 'package:nova/modules/loan/exports.dart';


class LoanOffersCard extends StatelessWidget {
  final LenderOffersResponseModelLoanDetail loanDetail;
  const LoanOffersCard({Key? key, required this.loanDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push( AcceptRejectOfferSummaryScreen(loanDetail: loanDetail));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: NovaColors.appWhiteColor,
                borderRadius: NovaDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: NovaColors.appPrimaryColorMain500,
                  radius: 20,
                  child: Text(
                    loanDetail.name.substring(0, 2).toUpperCase(),
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: NovaColors.appWhiteColor),
                  ),
                ),
                NovaHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaTextWidget(
                        title: "Interest Rate",
                        textColor: NovaColors.appPrimaryText,
                        fontFamily: NovaTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: NovaTypography.fontBodySmall,
                      ),
                      // PLVSpace(8),
                      // PLTextWidget(
                      //   title: DateTime.now().formatDate(),
                      //   textColor: PLColors.appGrayText,
                      //   textSize: PLTypography.fontLabelSmall,
                      // ),
                    ],
                  ),
                ),
                NovaHSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    NovaTextWidget(
                      title: "${loanDetail.loanPercentage}%",
                      textStyle: NovaTypography.textTitleSmallStyle,
                      textSize: NovaTypography.fontBodyMedium,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      fontWeight: FontWeight.w500,
                      textColor: NovaColors.appPrimaryText,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 8, vertical: 16),
          ),
          // Divider(
          //   color: PLColors.appGrayText.withOpacity(.5),
          // ).marginSymmetric(vertical: 3)
        ],
      ).marginOnly(bottom: 10),
    );

  }
}
