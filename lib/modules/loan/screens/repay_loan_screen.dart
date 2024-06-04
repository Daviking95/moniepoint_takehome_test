part of 'package:nova/modules/loan/exports.dart';

class RepayLoanScreen extends StatelessWidget {
  final LoanStatus loanStatus;
  final LoogedInUserLoanResponseModel? loanDetails;

  const RepayLoanScreen(
      {Key? key, this.loanStatus = LoanStatus.active, this.loanDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: NovaPaddedWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaVSpace(48),
                      NovaBackIcon(
                        onTap: () => Navigator.pop(context),
                      ),
                      NovaVSpace(16),
                      NovaTextWidget(
                        title: "Offer details",
                        textStyle: NovaTypography.textTitleLargeStyle,
                        textColor: NovaColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: NovaTypography.fontTitleLarge,
                      ),
                      NovaVSpace(24),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                NovaDecorations.borderRadiusGeometryCircular8,
                            color: NovaColors.appWhiteColor),
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
                                  NovaHSpace(12),
                                ],
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NovaTextWidget(
                                      title: loanDetails?.lenderName.toTitleCase ?? "",
                                      textStyle:
                                          NovaTypography.textTitleLargeStyle,
                                      textColor:
                                          NovaColors.appPrimaryColorMain500,
                                      textSize: NovaTypography.fontTitleMedium,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    NovaTextWidget(
                                      title: "Lender",
                                      textStyle:
                                          NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appGrayText,
                                      textSize: NovaTypography.fontLabelSmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 16, vertical: 16),
                      ),
                      NovaVSpace(24),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                NovaDecorations.borderRadiusGeometryCircular8,
                            color: NovaColors.appWhiteColor),
                        child: Column(
                          children: [
                            _loanDetailsItem(
                                'Amount Received',
                                NovaTextWidget(
                                  title: (loanDetails?.amountToRecieve ?? 0)
                                      .toString()
                                      .formatWithCommasAndDecimals(),
                                  textStyle: NovaTypography.textTitleSmallStyle,
                                  textSize: NovaTypography.fontLabelSmall,
                                  fontWeight: FontWeight.w600,
                                  textColor: NovaColors.appPrimaryText,
                                  maxLines: 1,
                                  isCurrency: true,
                                )),
                            _loanDetailsItem(
                                'Interest Rate',
                                NovaTextWidget(
                                  title: "${(loanDetails?.interestRate ?? 0)}%",
                                  textStyle: NovaTypography.textTitleLargeStyle,
                                  textColor: NovaColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: NovaTypography.fontLabelSmall,
                                )),
                            _loanDetailsItem(
                                'Duration (Days)',
                                NovaTextWidget(
                                  title: "${(loanDetails?.duration ?? 0)} Days",
                                  textStyle: NovaTypography.textTitleLargeStyle,
                                  textColor: NovaColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: NovaTypography.fontLabelSmall,
                                )),
                            _loanDetailsItem(
                                'Purpose',
                                NovaTextWidget(
                                  title: "${(loanDetails?.purpose ?? "")}",
                                  textStyle: NovaTypography.textTitleLargeStyle,
                                  textColor: NovaColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: NovaTypography.fontLabelSmall,
                                )),
                            Divider(
                              color: NovaColors.appGrayText.withOpacity(.6),
                            ),
                            _loanDetailsItem(
                                'Interest Value',
                                NovaTextWidget(
                                  title: (loanDetails?.interestValue ?? 0)
                                      .toString()
                                      .formatWithCommasAndDecimals(),
                                  textStyle: NovaTypography.textTitleSmallStyle,
                                  textSize: NovaTypography.fontLabelSmall,
                                  fontWeight: FontWeight.w600,
                                  textColor: NovaColors.appPrimaryText,
                                  maxLines: 1,
                                  isCurrency: true,
                                )),
                            _loanDetailsItem(
                                'Repayment Date',
                                NovaTextWidget(
                                  title: (loanDetails?.repaymentDate ??
                                          DateTime.now())
                                      .formatDate(),
                                  textStyle: NovaTypography.textTitleLargeStyle,
                                  textColor: NovaColors.appPrimaryText,
                                  fontWeight: FontWeight.w600,
                                  textSize: NovaTypography.fontLabelSmall,
                                )),
                            if (AppData.loogedInUserLoan?.loanStatus == 6) ...[
                              Divider(
                                color: NovaColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'No of Delayed Days',
                                  NovaTextWidget(
                                    title:
                                        "${(loanDetails?.numberOfDaysDelayed ?? 0)} Days",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appErrorColor,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Amount to Repay',
                                  NovaTextWidget(
                                    title: ((loanDetails?.amountToPay)! + (loanDetails!.interestValue))
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: NovaTypography.textTitleSmallStyle,
                                    textSize: NovaTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: NovaColors.appErrorColor,
                                    maxLines: 1,
                                    isCurrency: true,
                                  )),
                            ],
                            _loanDetailsItem(
                                'Amount to Repay',
                                NovaTextWidget(
                                  title: ((loanDetails?.amountToPay)! + (loanDetails!.interestValue))
                                      .toString()
                                      .formatWithCommasAndDecimals(),
                                  textStyle: NovaTypography.textTitleSmallStyle,
                                  textSize: NovaTypography.fontLabelSmall,
                                  fontWeight: FontWeight.w600,
                                  textColor: NovaColors.appPrimaryText,
                                  maxLines: 1,
                                  isCurrency: true,
                                )),
                          ],
                        ).paddingSymmetric(horizontal: 16, vertical: 16),
                      ),
                      NovaVSpace(24),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                NovaDecorations.borderRadiusGeometryCircular8,
                            color: NovaColors.appPrimaryColorMain500
                                .withOpacity(.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NovaImageSvg(
                              svgPath: AppData.loogedInUserLoan?.loanStatus == 6
                                  ? NovaAssets.infoIconRed
                                  : NovaAssets.infoIcon,
                              width: 40.w,
                              height: 40.h,
                            ),
                            NovaHSpace(16),
                            Expanded(
                              child: NovaTextWidget(
                                title: AppData.loogedInUserLoan?.loanStatus == 6
                                    ? 'You are being charged an extra fee 1% per day for delayed repayment. Kindly make payment on time to avoid incurring more charges'
                                    : 'You will be charged an extra fee of 1% per day for delayed repayment. Ensure your wallet is funded and make payment on time to avoid this.',
                                textStyle: NovaTypography.textTitleLargeStyle,
                                textColor: NovaColors.appGrayText,
                                textSize: NovaTypography.fontLabelSmall,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 16, vertical: 16),
                      ),
                      NovaVSpace(32),
                      NovaButtonRound(
                        loadingString: loanWatcher.loadingString,
                        isLoader: loanWatcher.isLoading,
                        textTitle: AppData.loogedInUserLoan?.loanStatus == 6
                            ? "Pay Now"
                            : "Repay Loan Now",
                        bgColor: AppData.loogedInUserLoan?.loanStatus == 6
                            ? NovaColors.appErrorColor
                            : NovaColors.appPrimaryColorMain500,
                        borderRadius:
                            NovaDecorations.borderRadiusGeometryCircular8,
                        functionToRun: () {
                          AppNavigator.push( PayLoanOptionsScreen(amountToPay: ((loanDetails?.amountToPay) ?? 0 + (loanDetails!.interestValue)).toDouble(), loanDetails: loanDetails));
                        },
                      ),
                      NovaVSpace(24),
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
        NovaTextWidget(
          title: title,
          textStyle: NovaTypography.textTitleLargeStyle,
          textColor: NovaColors.appGrayText,
          textSize: NovaTypography.fontLabelSmall,
        ),
        child
      ],
    ).marginSymmetric(vertical: 8);
  }
}
