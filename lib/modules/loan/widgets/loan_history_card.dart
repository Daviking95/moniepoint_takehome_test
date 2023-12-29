part of 'package:peerlendly/modules/loan/exports.dart';

class LoanHistoryCard extends StatelessWidget {
  final MarketplaceResponseModelLoanDetail loanDetail;
  const LoanHistoryCard({Key? key, required this.loanDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: PLColors.appBackgroundColor,
                borderRadius: PLDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: PLColors.appPrimaryColorMain500,
                  radius: 20,
                  child: Text(
                    loanDetail.fullName.substring(0,2),
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: PLColors.appWhiteColor),
                  ),
                ),
                PLHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLTextWidget(
                        title: "${loanDetail.duration} Days",
                        textColor: PLColors.appPrimaryText,
                        fontFamily: PLTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: PLTypography.fontBodySmall,
                      ),
                      PLVSpace(8),
                      PLTextWidget(
                        title: loanDetail.endDate.formatDate(),
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
                      title: loanDetail.loanAmount.toString().formatWithCommasAndDecimals(),
                      textStyle: PLTypography.textTitleSmallStyle,
                      textSize: PLTypography.fontBodyMedium,
                      fontFamily: PLTypography.fontFamilyMedium,
                      fontWeight: FontWeight.w500,
                      textColor: PLColors.appPrimaryText,
                      maxLines: 1,
                      isCurrency: true,
                    ),
                    PLVSpace(8),
                    PLTextWidget(
                      title: getLoanStatus(loanDetail.loanStatus),
                      textColor: PLColors.appPrimaryColorMain500,
                      textSize: PLTypography.fontLabelSmall,
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
