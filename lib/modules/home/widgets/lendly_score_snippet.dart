part of 'package:peerlendly/modules/home/exports.dart';

class LendlyScoreSnippet extends StatelessWidget {
  const LendlyScoreSnippet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.cancel_rounded,
                size: 25,
              ),
            ),
          ),
          PLVSpace(24),
          Container(
            decoration: BoxDecoration(
                borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                color: PLColors.appWhiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ProfileImageWidget(imageFile: UserData.profilePicture, size: 40),
                    PLHSpace(12),
                    PLTextWidget(
                      title: (UserData.getUserProfileResponseModel?.fullName ?? ""),
                      textStyle: PLTypography.textTitleLargeStyle,
                      textColor: PLColors.appPrimaryColorMain500,
                      textSize: PLTypography.fontTitleMedium,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PLTextWidget(
                      title: "Lendly Score",
                      textStyle: PLTypography.textBodySmallStyle,
                      textSize: PLTypography.fontLabelSmall,
                      textColor: PLColors.appWhiteColor,
                      maxLines: 1,
                    ),
                    PLVSpace(4),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                PLDecorations.borderRadiusGeometryCircular8,
                            color: PLColors.appGreenColor),
                        child: Center(
                          child: PLTextWidget(
                            title: (UserData.lendlyScoreResponseModel?.lendlyScore ?? 0).toString(),
                            textColor: PLColors.appWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: PLTypography.fontFamilyBold,
                            textSize: PLTypography.fontHeadlineSmall,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 8),
          ),
          PLVSpace(24),
          PLTextWidget(
            title: 750000
                .toString()
                .formatWithCommasAndDecimals(),
            textStyle: PLTypography.textTitleSmallStyle,
            textSize: PLTypography.fontTitleLarge,
            fontFamily: PLTypography.fontFamilyMedium,
            fontWeight: FontWeight.w700,
            textColor: PLColors.appPrimaryText,
            maxLines: 1,
            isCurrency: true,
          ),
          PLVSpace(4),
          PLTextWidget(
            title: "Borrowing Limit",
            textStyle: PLTypography.textTitleLargeStyle,
            textColor: PLColors.appPrimaryText,
            fontWeight: FontWeight.w700,
            textSize: PLTypography.fontLabelSmall,
          ),
          PLVSpace(24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PLTextWidget(
                title: "Lendly Score",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appPrimaryText,
                fontWeight: FontWeight.w600,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLVSpace(8),
              PLTextWidget(
                title: "Your Lendly Score is our proprietary metric that represents the probability of your ability to repay a loan. ",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLVSpace(16),
              PLTextWidget(
                title: "How to improve your Lendly Score:",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                fontWeight: FontWeight.w700,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLVSpace(6),
              PLTextWidget(
                title: "* Complete your profile information.",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLTextWidget(
                title: "* Keep repaying your loans on time.",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLVSpace(16),
              PLTextWidget(
                title: "How the Lendly Score Helps Borrowers and Lenders",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                fontWeight: FontWeight.w700,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLVSpace(4),
              PLTextWidget(
                title: "Lendly Score benefits everyone, so every transaction is a win-win. A Lender needs to assess the risk involved before fulfilling your request. The Lendly Score helps do just that, faster and easier. ",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLVSpace(6),
              PLTextWidget(
                title: "* For Borrowers, you get access to cheap loans.",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLTextWidget(
                title: "* For Lenders, it helps to assess the Borrower’s repayment capability.",
                textStyle: PLTypography.textTitleLargeStyle,
                textColor: PLColors.appGrayText,
                textSize: PLTypography.fontLabelMedium,
              ),
              PLVSpace(16),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
