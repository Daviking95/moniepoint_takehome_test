part of 'package:nova/modules/loan/exports.dart';


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
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        NovaVSpace(8),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: NovaDecorations.borderRadiusGeometryCircular16,
                              color: NovaColors.appWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ProfileImageWidget(imageFile: AppData.profilePicture, size: 40),
                                  NovaHSpace(12),
                                  NovaTextWidget(
                                    title: (loanDetail.borrowerName.toTitleCase),
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
                                    textColor: NovaColors.appGrayText,
                                    maxLines: 1,
                                  ),
                                  NovaVSpace(4),
                                  InkWell(
                                    onTap: () {},
                                    child: LendlyScoreCard(
                                      score: int.parse(loanDetail.lendlyScore),
                                      bgColor: NovaColors.appGreenColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 8),
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
                                  'Amount',
                                  NovaTextWidget(
                                    title: loanDetail.loanAmount
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
                                    title: "${loanDetail.interestRate}%",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Duration (Days)',
                                  NovaTextWidget(
                                    title: "${loanDetail.duration} Days",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Purpose',
                                  NovaTextWidget(
                                    title: "${loanDetail.purpose}",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              Divider(
                                color: NovaColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'Amount to Pay',
                                  NovaTextWidget(
                                    title: loanDetail.amountToPay
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: NovaTypography.textTitleSmallStyle,
                                    textSize: NovaTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: NovaColors.appPrimaryText,
                                    maxLines: 1,
                                    isCurrency: true,
                                  )),

                              Divider(
                                color: NovaColors.appGrayText.withOpacity(.6),
                              ),

                              _loanDetailsItem(
                                  'Interest Value',
                                  NovaTextWidget(
                                    title: loanDetail.interestValue
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: NovaTypography.textTitleSmallStyle,
                                    textSize: NovaTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: NovaColors.appPrimaryText,
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
                                  NovaTextWidget(
                                    title: loanDetail.platformFee
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
                                  'Final Repayment Date',
                                  NovaTextWidget(
                                    title: loanDetail.repaymentDate.formatDate(),
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Amount to be Received',
                                  NovaTextWidget(
                                    title: loanDetail.amountToRecieve
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
                        NovaVSpace(32),
                      ],
                    ),
                    if(loanDetail.loanStatus == 5 || loanDetail.loanStatus == 2)
                    Column(
                      children: [
                        NovaButtonRound(
                          textTitle: loanDetail.loanStatus == 5 ? "Report" : "Cancel Offer",
                          loadingString: loanWatcher.loadingString,
                          isLoader: loanWatcher.isLoading,
                          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                          bgColor: NovaColors.appErrorColor,
                          functionToRun: loanDetail.loanStatus == 5 ? null : () => _cancelOffer(context),
                        ),
                        NovaVSpace(24),
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
