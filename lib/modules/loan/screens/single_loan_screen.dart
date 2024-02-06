part of 'package:peerlendly/modules/loan/exports.dart';


class SingleLoanScreen extends StatelessWidget {
  final LoanStatus loanStatus;
  final ActivePendingLoansResponseModelLoanDetail loanDetail;
  const SingleLoanScreen({Key? key, required this.loanStatus, required this.loanDetail})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        PLVSpace(8),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: PLDecorations.borderRadiusGeometryCircular16,
                              color: PLColors.appWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ProfileImageWidget(imageFile: AppData.profilePicture, size: 40),
                                  PLHSpace(12),
                                  PLTextWidget(
                                    title: (loanDetail.borrowerName.toTitleCase ?? ""),
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
                                    textColor: PLColors.appGrayText,
                                    maxLines: 1,
                                  ),
                                  PLVSpace(4),
                                  InkWell(
                                    onTap: () {},
                                    child: LendlyScoreCard(
                                      score: int.parse(loanDetail.lendlyScore),
                                      bgColor: PLColors.appGreenColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 8),
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
                                  'Amount',
                                  PLTextWidget(
                                    title: loanDetail.loanAmount
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
                                    title: "${loanDetail.interestRate}%",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Duration (Days)',
                                  PLTextWidget(
                                    title: "${loanDetail.duration} Days",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Purpose',
                                  PLTextWidget(
                                    title: "${loanDetail.purpose}",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'Amount to Pay',
                                  PLTextWidget(
                                    title: loanDetail.amountToPay
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: PLTypography.textTitleSmallStyle,
                                    textSize: PLTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: PLColors.appPrimaryText,
                                    maxLines: 1,
                                    isCurrency: true,
                                  )),

                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),

                              _loanDetailsItem(
                                  'Interest Value',
                                  PLTextWidget(
                                    title: loanDetail.interestValue
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: PLTypography.textTitleSmallStyle,
                                    textSize: PLTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: PLColors.appPrimaryText,
                                    maxLines: 1,
                                    isCurrency: true,
                                  )),
                              // _loanDetailsItem(
                              //     'Protection Fee',
                              //     PLTextWidget(
                              //       title: 98900
                              //           .toString()
                              //           .formatWithCommasAndDecimals(),
                              //       textStyle: PLTypography.textTitleSmallStyle,
                              //       textSize: PLTypography.fontLabelSmall,
                              //       fontWeight: FontWeight.w600,
                              //       textColor: PLColors.appPrimaryText,
                              //       maxLines: 1,
                              //       isCurrency: true,
                              //     )),
                              _loanDetailsItem(
                                  'Platform Fee',
                                  PLTextWidget(
                                    title: loanDetail.platformFee
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
                                  'Final Repayment Date',
                                  PLTextWidget(
                                    title: loanDetail.repaymentDate.formatDate(),
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Amount to be Received',
                                  PLTextWidget(
                                    title: loanDetail.amountToRecieve
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
                        PLVSpace(32),
                      ],
                    ),
                    if(loanDetail.loanStatus == 5 || loanDetail.loanStatus == 2)
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: loanDetail.loanStatus == 5 ? "Report" : "Cancel Offer",
                          loadingString: loanWatcher.loadingString,
                          isLoader: loanWatcher.isLoading,
                          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                          bgColor: PLColors.appErrorColor,
                          functionToRun: loanDetail.loanStatus == 5 ? null : () => _cancelOffer(context),
                        ),
                        PLVSpace(24),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  _cancelOffer(BuildContext context){
    showAlertDialog(
        context,
        '',
        CancelLoanOfferPopup(loanDetail: loanDetail));
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
