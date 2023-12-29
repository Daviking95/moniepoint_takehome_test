part of 'package:peerlendly/modules/home/exports.dart';
class LoanCardWidget extends StatelessWidget {
  const LoanCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletWatcher = context.watch<WalletProvider>();

    return Container(
      decoration: BoxDecoration(
        color: PLColors.appPrimaryColorMain500,
        image: const DecorationImage(
            image: AssetImage(PLAssets.walletCardBg),
            alignment: Alignment.topLeft,
            fit: BoxFit.contain),
        borderRadius: PLDecorations.borderRadiusGeometryCircular20,
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
                  PLTextWidget(
                    title: "Loan Amount",
                    textStyle: PLTypography.textBodySmallStyle,
                    textSize: PLTypography.fontBodySmall,
                    textColor: PLColors.appWhiteColor,
                    maxLines: 1,
                  ),

                  if(UserData.loogedInUserLoan?.loanStatus == 1 || UserData.loogedInUserLoan?.loanStatus == 5)
                  InkWell(
                    onTap: () {
                      AppNavigator.push(RepayLoanScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: PLDecorations.borderRadiusGeometryCircular20,
                          color: PLColors.appWhiteColor),
                      child: PLTextWidget(
                        title: "Pay Now",
                        textColor: PLColors.appPrimaryColorMain500,
                        textSize: PLTypography.fontLabelSmall,
                      ).paddingSymmetric(horizontal: 12, vertical: 6),
                    ),
                  )
                ],
              ),
              PLVSpace(4),
              Row(
                children: [
                  PLTextWidget(
                    title: (UserData.loogedInUserLoan?.amount ?? 0)
                        .toString()
                        .formatWithCommasAndDecimals(),
                    textStyle: PLTypography.textTitleSmallStyle,
                    textSize: PLTypography.fontHeadlineSmall,
                    fontFamily: PLTypography.fontFamilyMedium,
                    fontWeight: FontWeight.w700,
                    textColor: PLColors.appWhiteColor,
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
                  PLTextWidget(
                    title: "Loan Duration",
                    textStyle: PLTypography.textTitleSmallStyle,
                    textSize: PLTypography.fontLabelSmall,
                    textColor: PLColors.appWhiteColor,
                    maxLines: 1,
                  ),
                  PLVSpace(2),
                  PLTextWidget(
                    title: "${(UserData.loogedInUserLoan?.duration ?? 0)} Days",
                    textStyle: PLTypography.textTitleSmallStyle,
                    textSize: PLTypography.fontBodySmall,
                    textColor: PLColors.appWhiteColor,
                    maxLines: 1,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PLTextWidget(
                    title: "Payment Date",
                    textStyle: PLTypography.textTitleSmallStyle,
                    textSize: PLTypography.fontLabelSmall,
                    textColor: PLColors.appWhiteColor,
                    maxLines: 1,
                  ),
                  PLVSpace(2),
                  PLTextWidget(
                    title: UserData.loogedInUserLoan?.repaymentDate.formatDate(),
                    textStyle: PLTypography.textTitleSmallStyle,
                    textSize: PLTypography.fontBodySmall,
                    textColor: PLColors.appWhiteColor,
                    maxLines: 1,
                  ),
                ],
              ),

              if(UserData.loogedInUserLoan?.loanStatus == 1 || UserData.loogedInUserLoan?.loanStatus == 5)
              ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLTextWidget(
                      title: "Interest Rate",
                      textStyle: PLTypography.textTitleSmallStyle,
                      textSize: PLTypography.fontLabelSmall,
                      textColor: PLColors.appWhiteColor,
                      maxLines: 1,
                    ),
                    PLVSpace(2),
                    PLTextWidget(
                      title: "${(UserData.loogedInUserLoan?.interestRate ?? 0)}%",
                      textStyle: PLTypography.textTitleSmallStyle,
                      textSize: PLTypography.fontBodySmall,
                      textColor: PLColors.appWhiteColor,
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
