part of 'package:peerlendly/modules/loan/exports.dart';

class RepayLoanScreen extends StatelessWidget {
  final LoanStatus loanStatus;
  final LoogedInUserLoanResponseModel? loanDetails;

  const RepayLoanScreen(
      {Key? key, this.loanStatus = LoanStatus.active, this.loanDetails})
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
                                if (loanDetails!.lenderImage.isNotEmpty &&
                                    loanDetails!.lenderImage != 'N/A') ...[
                                  ProfileImageWidget(
                                      imageFile: loanDetails!.lenderImage,
                                      size: 40),
                                  PLHSpace(12),
                                ],
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PLTextWidget(
                                      title: loanDetails?.lenderName.toTitleCase ?? "",
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
                                  title: (loanDetails?.amountToRecieve ?? 0)
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
                                  title: "${(loanDetails?.interestRate ?? 0)}%",
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: PLTypography.fontLabelSmall,
                                )),
                            _loanDetailsItem(
                                'Duration (Days)',
                                PLTextWidget(
                                  title: "${(loanDetails?.duration ?? 0)} Days",
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: PLTypography.fontLabelSmall,
                                )),
                            _loanDetailsItem(
                                'Purpose',
                                PLTextWidget(
                                  title: "${(loanDetails?.purpose ?? "")}",
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
                                  title: (loanDetails?.interestValue ?? 0)
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
                                  title: (loanDetails?.repaymentDate ??
                                          DateTime.now())
                                      .formatDate(),
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: PLTypography.fontLabelSmall,
                                )),
                            if (AppData.loogedInUserLoan?.loanStatus == 6) ...[
                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'No of Delayed Days',
                                  PLTextWidget(
                                    title:
                                        "${(loanDetails?.numberOfDaysDelayed ?? 0)} Days",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appErrorColor,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Amount to Repay',
                                  PLTextWidget(
                                    title: ((loanDetails?.amountToPay)! + (loanDetails!.interestValue))
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
                                  title: ((loanDetails?.amountToPay)! + (loanDetails!.interestValue))
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
                              svgPath: AppData.loogedInUserLoan?.loanStatus == 6
                                  ? PLAssets.infoIconRed
                                  : PLAssets.infoIcon,
                              width: 40.w,
                              height: 40.h,
                            ),
                            PLHSpace(16),
                            Expanded(
                              child: PLTextWidget(
                                title: AppData.loogedInUserLoan?.loanStatus == 6
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
                        loadingString: loanWatcher.loadingString,
                        isLoader: loanWatcher.isLoading,
                        textTitle: AppData.loogedInUserLoan?.loanStatus == 6
                            ? "Pay Now"
                            : "Repay Loan Now",
                        bgColor: AppData.loogedInUserLoan?.loanStatus == 6
                            ? PLColors.appErrorColor
                            : PLColors.appPrimaryColorMain500,
                        borderRadius:
                            PLDecorations.borderRadiusGeometryCircular8,
                        functionToRun: () {
                          AppNavigator.push( PayLoanOptionsScreen(amountToPay: ((loanDetails?.amountToPay) ?? 0 + (loanDetails!.interestValue)).toDouble(), loanDetails: loanDetails));
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
