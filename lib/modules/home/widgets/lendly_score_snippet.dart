part of 'package:nova/modules/home/exports.dart';

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
          NovaVSpace(24),
          Container(
            decoration: BoxDecoration(
                borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                color: NovaColors.appWhiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ProfileImageWidget(
                        imageFile: AppData.profilePicture, size: 40),
                    NovaHSpace(12),
                    NovaTextWidget(
                      title: (AppData.getUserProfileResponseModel?.fullName
                              .toTitleCase ??
                          ""),
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryColorMain500,
                      textSize: NovaTypography.fontTitleMedium,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    NovaTextWidget(
                      title: "Lendly Score",
                      textStyle: NovaTypography.textBodySmallStyle,
                      textSize: NovaTypography.fontLabelSmall,
                      textColor: NovaColors.appWhiteColor,
                      maxLines: 1,
                    ),
                    NovaVSpace(4),
                    InkWell(
                      onTap: () {},
                      child: LendlyScoreCard(
                        score:
                            AppData.lendlyScoreResponseModel?.lendlyScore ?? 0,
                        bgColor: NovaColors.appGreenColor,
                      ),
                    )
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 8),
          ),
          NovaVSpace(24),
          NovaTextWidget(
            title: 750000.toString().formatWithCommasAndDecimals(),
            textStyle: NovaTypography.textTitleSmallStyle,
            textSize: NovaTypography.fontTitleLarge,
            fontFamily: NovaTypography.fontFamilyMedium,
            fontWeight: FontWeight.w700,
            textColor: NovaColors.appPrimaryText,
            maxLines: 1,
            isCurrency: true,
          ),
          NovaVSpace(4),
          NovaTextWidget(
            title: "Borrowing Limit",
            textStyle: NovaTypography.textTitleLargeStyle,
            textColor: NovaColors.appPrimaryText,
            fontWeight: FontWeight.w700,
            textSize: NovaTypography.fontLabelSmall,
          ),
          NovaVSpace(24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NovaTextWidget(
                title: "Lendly Score",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appPrimaryText,
                fontWeight: FontWeight.w600,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaVSpace(8),
              NovaTextWidget(
                title:
                    "Your Lendly Score is our proprietary metric that represents the probability of your ability to repay a loan. ",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaVSpace(16),
              NovaTextWidget(
                title: "How to improve your Lendly Score:",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                fontWeight: FontWeight.w700,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaVSpace(6),
              NovaTextWidget(
                title: "* Complete your profile information.",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaTextWidget(
                title: "* Keep repaying your loans on time.",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaVSpace(16),
              NovaTextWidget(
                title: "How the Lendly Score Helps Borrowers and Lenders",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                fontWeight: FontWeight.w700,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaVSpace(4),
              NovaTextWidget(
                title:
                    "Lendly Score benefits everyone, so every transaction is a win-win. A Lender needs to assess the risk involved before fulfilling your request. The Lendly Score helps do just that, faster and easier. ",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaVSpace(6),
              NovaTextWidget(
                title: "* For Borrowers, you get access to cheap loans.",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaTextWidget(
                title:
                    "* For Lenders, it helps to assess the Borrower’s repayment capability.",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appGrayText,
                textSize: NovaTypography.fontLabelMedium,
              ),
              NovaVSpace(16),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
