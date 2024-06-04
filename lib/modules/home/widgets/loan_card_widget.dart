part of 'package:nova/modules/home/exports.dart';
class LoanCardWidget extends StatelessWidget {
  const LoanCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: NovaColors.appPrimaryColorMain500,
        image: const DecorationImage(
            image: AssetImage(NovaAssets.walletCardBg),
            alignment: Alignment.topLeft,
            fit: BoxFit.contain),
        borderRadius: NovaDecorations.borderRadiusGeometryCircular20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NovaTextWidget(
                    title: "Loan Amount",
                    textStyle: NovaTypography.textBodySmallStyle,
                    textSize: NovaTypography.fontBodySmall,
                    textColor: NovaColors.appWhiteColor,
                    maxLines: 1,
                  ),

                  if(AppData.loogedInUserLoan?.loanStatus == 1 || AppData.loogedInUserLoan?.loanStatus == 5)
                  InkWell(
                    onTap: () {
                      AppNavigator.push(RepayLoanScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: NovaDecorations.borderRadiusGeometryCircular20,
                          color: NovaColors.appWhiteColor),
                      child: NovaTextWidget(
                        title: "Pay Now",
                        textColor: NovaColors.appPrimaryColorMain500,
                        textSize: NovaTypography.fontLabelSmall,
                      ).paddingSymmetric(horizontal: 12, vertical: 6),
                    ),
                  )
                ],
              ),
              NovaVSpace(4),
              Row(
                children: [
                  NovaTextWidget(
                    title: (AppData.loogedInUserLoan?.amount ?? 0)
                        .toString()
                        .formatWithCommasAndDecimals(),
                    textStyle: NovaTypography.textTitleSmallStyle,
                    textSize: NovaTypography.fontHeadlineSmall,
                    fontFamily: NovaTypography.fontFamilyMedium,
                    fontWeight: FontWeight.w700,
                    textColor: NovaColors.appWhiteColor,
                    maxLines: 1,
                    isCurrency: true,
                  ),
                  // PLHSpace(10),
                  // GestureDetector(
                  //     onTap: () async {
                  //       walletWatcher.toggleShowBalance();
                  //     },
                  //     child: const PLImageSvg(svgPath: PLAssets.showBalance)),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NovaTextWidget(
                    title: "Loan Duration",
                    textStyle: NovaTypography.textTitleSmallStyle,
                    textSize: NovaTypography.fontLabelSmall,
                    textColor: NovaColors.appWhiteColor,
                    maxLines: 1,
                  ),
                  NovaVSpace(2),
                  NovaTextWidget(
                    title: "${(AppData.loogedInUserLoan?.duration ?? 0)} Days",
                    textStyle: NovaTypography.textTitleSmallStyle,
                    textSize: NovaTypography.fontBodySmall,
                    textColor: NovaColors.appWhiteColor,
                    maxLines: 1,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NovaTextWidget(
                    title: "Payment Date",
                    textStyle: NovaTypography.textTitleSmallStyle,
                    textSize: NovaTypography.fontLabelSmall,
                    textColor: NovaColors.appWhiteColor,
                    maxLines: 1,
                  ),
                  NovaVSpace(2),
                  NovaTextWidget(
                    title: AppData.loogedInUserLoan?.repaymentDate.formatDate(),
                    textStyle: NovaTypography.textTitleSmallStyle,
                    textSize: NovaTypography.fontBodySmall,
                    textColor: NovaColors.appWhiteColor,
                    maxLines: 1,
                  ),
                ],
              ),

              if(AppData.loogedInUserLoan?.loanStatus == 1 || AppData.loogedInUserLoan?.loanStatus == 5)
              ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaTextWidget(
                      title: "Interest Rate",
                      textStyle: NovaTypography.textTitleSmallStyle,
                      textSize: NovaTypography.fontLabelSmall,
                      textColor: NovaColors.appWhiteColor,
                      maxLines: 1,
                    ),
                    NovaVSpace(2),
                    NovaTextWidget(
                      title: "${(AppData.loogedInUserLoan?.interestRate ?? 0)}%",
                      textStyle: NovaTypography.textTitleSmallStyle,
                      textSize: NovaTypography.fontBodySmall,
                      textColor: NovaColors.appWhiteColor,
                      maxLines: 1,
                    ),
                  ],
                ),
              ]
              else
                Container()
            ],
          )
        ],
      ).paddingSymmetric(vertical: 16, horizontal: 16),
    );
  }
}
