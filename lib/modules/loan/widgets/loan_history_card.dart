part of 'package:nova/modules/loan/exports.dart';

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
                color: NovaColors.appBackgroundColor,
                borderRadius: NovaDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: NovaColors.appPrimaryColorMain500,
                  radius: 20,
                  child: Text(
                    loanDetail.fullName.substring(0,2),
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
                        title: "${loanDetail.duration} Days",
                        textColor: NovaColors.appPrimaryText,
                        fontFamily: NovaTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: NovaTypography.fontBodySmall,
                      ),
                      NovaVSpace(8),
                      NovaTextWidget(
                        title: loanDetail.endDate.formatDate(),
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
                      title: loanDetail.loanAmount.toString().formatWithCommasAndDecimals(),
                      textStyle: NovaTypography.textTitleSmallStyle,
                      textSize: NovaTypography.fontBodyMedium,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      fontWeight: FontWeight.w500,
                      textColor: NovaColors.appPrimaryText,
                      maxLines: 1,
                      isCurrency: true,
                    ),
                    NovaVSpace(8),
                    NovaTextWidget(
                      title: getLoanStatus(loanDetail.loanStatus),
                      textColor: NovaColors.appPrimaryColorMain500,
                      textSize: NovaTypography.fontLabelSmall,
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
