part of 'package:peerlendly/modules/loan/exports.dart';

class RepayLoanScreen extends StatelessWidget {
  final LoanStatus loanStatus;

  const RepayLoanScreen({Key? key, this.loanStatus = LoanStatus.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();
    final loanReader = context.read<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: PLPaddedWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(48),
                      PLBackIcon(
                        onTap: () => Navigator.pop(context),
                      ),
                      PLVSpace(16),
                      PLTextWidget(
                        title: "Offer details",
                        textStyle: PLTypography.textTitleLargeStyle,
                        textColor: PLColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: PLTypography.fontTitleLarge,
                      ),
                      PLVSpace(24),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                PLDecorations.borderRadiusGeometryCircular8,
                            color: PLColors.appWhiteColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: PLDecorations
                                        .borderRadiusGeometryCircular16,
                                  ),
                                  child: PLImagePng(
                                    imgPath: PLAssets.loanDefaultProfile,
                                    width: 48.w,
                                    height: 48.h,
                                  ),
                                ),
                                PLHSpace(12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PLTextWidget(
                                      title: "Jide Ayo",
                                      textStyle:
                                          PLTypography.textTitleLargeStyle,
                                      textColor:
                                          PLColors.appPrimaryColorMain500,
                                      textSize: PLTypography.fontTitleMedium,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    PLTextWidget(
                                      title: "Lender",
                                      textStyle:
                                          PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appGrayText,
                                      textSize: PLTypography.fontLabelSmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 16, vertical: 16),
                      ),
                      PLVSpace(24),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                PLDecorations.borderRadiusGeometryCircular8,
                            color: PLColors.appWhiteColor),
                        child: Column(
                          children: [
                            _loanDetailsItem(
                                'Amount Received',
                                PLTextWidget(
                                  title: 98900
                                      .toString()
                                      .formatWithCommasAndDecimals(),
                                  textStyle: PLTypography.textTitleSmallStyle,
                                  textSize: PLTypography.fontLabelSmall,
                                  fontWeight: FontWeight.w600,
                                  textColor: PLColors.appPrimaryText,
                                  maxLines: 1,
                                  isCurrency: true,
                                )),
                            _loanDetailsItem(
                                'Interest Rate',
                                PLTextWidget(
                                  title: "15%",
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: PLTypography.fontLabelSmall,
                                )),
                            _loanDetailsItem(
                                'Duration (Days)',
                                PLTextWidget(
                                  title: "30 Days",
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: PLTypography.fontLabelSmall,
                                )),
                            _loanDetailsItem(
                                'Purpose',
                                PLTextWidget(
                                  title: "School Fees",
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: PLTypography.fontLabelSmall,
                                )),
                            Divider(
                              color: PLColors.appGrayText.withOpacity(.6),
                            ),
                            _loanDetailsItem(
                                'Interest Value',
                                PLTextWidget(
                                  title: 15000
                                      .toString()
                                      .formatWithCommasAndDecimals(),
                                  textStyle: PLTypography.textTitleSmallStyle,
                                  textSize: PLTypography.fontLabelSmall,
                                  fontWeight: FontWeight.w600,
                                  textColor: PLColors.appPrimaryText,
                                  maxLines: 1,
                                  isCurrency: true,
                                )),
                            _loanDetailsItem(
                                'Repayment Date',
                                PLTextWidget(
                                  title: DateTime.now().formatDate(),
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: PLTypography.fontLabelSmall,
                                )),
                            if (loanStatus == LoanStatus.delayed) ...[
                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'No of Delayed Days',
                                  PLTextWidget(
                                    title: "12 Days",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appErrorColor,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Amount to Repay',
                                  PLTextWidget(
                                    title: 15000
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: PLTypography.textTitleSmallStyle,
                                    textSize: PLTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: PLColors.appErrorColor,
                                    maxLines: 1,
                                    isCurrency: true,
                                  )),
                            ],
                            _loanDetailsItem(
                                'Amount to Repay',
                                PLTextWidget(
                                  title: 115000
                                      .toString()
                                      .formatWithCommasAndDecimals(),
                                  textStyle: PLTypography.textTitleSmallStyle,
                                  textSize: PLTypography.fontLabelSmall,
                                  fontWeight: FontWeight.w600,
                                  textColor: PLColors.appPrimaryText,
                                  maxLines: 1,
                                  isCurrency: true,
                                )),
                          ],
                        ).paddingSymmetric(horizontal: 16, vertical: 16),
                      ),
                      PLVSpace(24),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                PLDecorations.borderRadiusGeometryCircular8,
                            color: PLColors.appPrimaryColorMain500
                                .withOpacity(.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PLImageSvg(
                                svgPath: loanStatus == LoanStatus.delayed
                                    ? PLAssets.infoIconRed
                                    : PLAssets.infoIcon, width: 40.w, height: 40.h,),
                            PLHSpace(16),
                            Expanded(
                              child: PLTextWidget(
                                title: loanStatus == LoanStatus.delayed
                                    ? 'You are being charged an extra fee 1% per day for delayed repayment. Kindly make payment on time to avoid incurring more charges'
                                    : 'You will be charged an extra fee of 1% per day for delayed repayment. Ensure your wallet is funded and make payment on time to avoid this.',
                                textStyle: PLTypography.textTitleLargeStyle,
                                textColor: PLColors.appGrayText,
                                textSize: PLTypography.fontLabelSmall,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 16, vertical: 16),
                      ),
                      PLVSpace(32),
                      PLButtonRound(
                        textTitle: loanStatus == LoanStatus.delayed
                            ? "Pay Now"
                            : "Repay Loan Now",
                        bgColor: loanStatus == LoanStatus.delayed
                            ? PLColors.appErrorColor
                            : PLColors.appPrimaryColorMain500,
                        borderRadius:
                            PLDecorations.borderRadiusGeometryCircular8,
                        functionToRun: () {
                          AppNavigator.push(const PayLoanOptionsScreen());
                        },
                      ),
                      PLVSpace(24),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  _loanDetailsItem(String title, Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PLTextWidget(
          title: title,
          textStyle: PLTypography.textTitleLargeStyle,
          textColor: PLColors.appGrayText,
          textSize: PLTypography.fontLabelSmall,
        ),
        child
      ],
    ).marginSymmetric(vertical: 8);
  }
}
