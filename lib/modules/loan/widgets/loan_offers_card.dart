part of 'package:peerlendly/modules/loan/exports.dart';


class LoanOffersCard extends StatelessWidget {
  const LoanOffersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(const AcceptRejectOfferSummaryScreen());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: PLColors.appWhiteColor,
                borderRadius: PLDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: PLColors.appPrimaryColorMain500,
                  radius: 20,
                  child: Text(
                    "JA",
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
                        title: "Interest Rate",
                        textColor: PLColors.appPrimaryText,
                        fontFamily: PLTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: PLTypography.fontBodySmall,
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
                PLHSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PLTextWidget(
                      title: "17%",
                      textStyle: PLTypography.textTitleSmallStyle,
                      textSize: PLTypography.fontBodyMedium,
                      fontFamily: PLTypography.fontFamilyMedium,
                      fontWeight: FontWeight.w500,
                      textColor: PLColors.appPrimaryText,
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
