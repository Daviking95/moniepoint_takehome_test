part of 'package:nova/modules/loan/exports.dart';

class MakeOfferSummaryScreen extends StatelessWidget {
  final MarketplaceResponseModelLoanDetail loanDetail;
  final LoogedInUserLoanResponseModel calculatedResult;

  const MakeOfferSummaryScreen(
      {Key? key, required this.loanDetail, required this.calculatedResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoanProvider>(
      vmBuilder: (context) =>
          LoanProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoanProvider model) {
    final loanWatcher = context.watch<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: NovaPaddedWidget(
              child: Container(
                color: context.theme.scaffoldBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        NovaVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                          extraWidget: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: NovaDecorations
                                      .borderRadiusGeometryCircular16,
                                  color: NovaColors.appPrimaryColorMain500),
                              child: NovaTextWidget(
                                title: "Edit Rate",
                                textColor: NovaColors.appWhiteColor,
                                textSize: NovaTypography.fontLabelSmall,
                              ).paddingSymmetric(horizontal: 12, vertical: 8),
                            ),
                          ),
                        ),
                        NovaVSpace(16),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: NovaDecorations
                                        .borderRadiusGeometryCircular16,
                                    color: NovaColors.appWhiteColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ProfileImageWidget(
                                            imageFile: loanDetail.image,
                                            size: 40),
                                        NovaHSpace(12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            NovaTextWidget(
                                              title:
                                                  (loanDetail.fullName.toTitleCase),
                                              textStyle: NovaTypography
                                                  .textTitleLargeStyle,
                                              textSize:
                                                  NovaTypography.fontTitleMedium,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            NovaVSpace(4),
                                            if (!loanWatcher.isLoading &&
                                                loanWatcher.borrowerLoanHistory
                                                    .isNotEmpty)
                                              InkWell(
                                                onTap: () {
                                                  modalBottomSheet(
                                                      context,
                                                      LoanHistoryScreen(
                                                          borrowerLoanHistory:
                                                              loanWatcher
                                                                  .borrowerLoanHistory),
                                                      true,
                                                      context.height / 1.5);
                                                },
                                                child: NovaTextWidget(
                                                  title:
                                                      "View transaction history",
                                                  textStyle: NovaTypography
                                                      .textTitleLargeStyle,
                                                  textColor: NovaColors
                                                      .appPrimaryColorMain500,
                                                  textSize: NovaTypography
                                                      .fontLabelSmall,
                                                  textDecoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        NovaTextWidget(
                                          title: "Lendly Score",
                                          textStyle:
                                              NovaTypography.textBodySmallStyle,
                                          textSize: NovaTypography.fontLabelSmall,
                                          textColor: NovaColors.appGrayText,
                                          maxLines: 1,
                                        ),
                                        NovaVSpace(4),
                                        InkWell(
                                          onTap: () {},
                                          child: LendlyScoreCard(
                                            score: loanDetail.lendlyScore,
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
                                    borderRadius: NovaDecorations
                                        .borderRadiusGeometryCircular8,
                                    color: NovaColors.appWhiteColor),
                                child: Column(
                                  children: [
                                    _loanDetailsItem(
                                        'Amount',
                                        NovaTextWidget(
                                          title: loanDetail.loanAmount
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              NovaTypography.textTitleSmallStyle,
                                          textSize: NovaTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: NovaColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),
                                    _loanDetailsItem(
                                        'Duration (Days)',
                                        NovaTextWidget(
                                          title: "${loanDetail.duration} Days",
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Purpose',
                                        NovaTextWidget(
                                          title: loanDetail.loanReason,
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Repayment Date',
                                        NovaTextWidget(
                                          title:
                                              loanDetail.endDate.formatDate(),
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        )),

                                    Divider(
                                      color:
                                          NovaColors.appGrayText.withOpacity(.6),
                                    ),
                                    _loanDetailsItem(
                                        'Amount to Pay',
                                        NovaTextWidget(
                                          title: calculatedResult.amount
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              NovaTypography.textTitleSmallStyle,
                                          textSize: NovaTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: NovaColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),

                                    Divider(
                                      color:
                                          NovaColors.appGrayText.withOpacity(.6),
                                    ),

                                    _loanDetailsItem(
                                        'Interest Value',
                                        NovaTextWidget(
                                          title: calculatedResult.interestValue
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              NovaTypography.textTitleSmallStyle,
                                          textSize: NovaTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: NovaColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),
                                    // _loanDetailsItem(
                                    //     'Protection Fee',
                                    //     PLTextWidget(
                                    //       title: calculatedResult.pro
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
                                          title: calculatedResult.platformFee
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              NovaTypography.textTitleSmallStyle,
                                          textSize: NovaTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: NovaColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),
                                    _loanDetailsItem(
                                        'Final Repayment Date',
                                        NovaTextWidget(
                                          title: calculatedResult.repaymentDate
                                              .formatDate(),
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Amount to be Received',
                                        NovaTextWidget(
                                          title: calculatedResult
                                              .amountToRecieve
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              NovaTypography.textTitleSmallStyle,
                                          textSize: NovaTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: NovaColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 16, vertical: 16),
                              ),
                              NovaVSpace(24),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: NovaDecorations
                                        .borderRadiusGeometryCircular8,
                                    color: NovaColors.appWhiteColor),
                                child: InkWell(
                                  onTap: (){
                                    loanWatcher.agreeToMakeOffer = !loanWatcher.agreeToMakeOffer;
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          value: loanWatcher.agreeToMakeOffer,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          activeColor:
                                              NovaColors.appPrimaryColorMain500,
                                          onChanged: (bool? value) {
                                            // setState(() {
                                            //   loanWatcher.agreeToMakeOffer = value!;
                                            // });
                                          },
                                        ).paddingAll(5),
                                      ),
                                      NovaHSpace(16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            NovaTextWidget(
                                              title:
                                                  "You are agreeing to lend the amount above to ${loanDetail.fullName}. Funds will be debited from your account",
                                              textColor: NovaColors.appPrimaryText,
                                              fontWeight: FontWeight.w600,
                                              textSize:
                                                  NovaTypography.fontLabelSmall,
                                            ),
                                            NovaVSpace(8),
                                            NovaTextWidget(
                                              title:
                                                  "I authorize nova to debit my account for the amount noted on today’s date and will not dispute nova debiting my account as the transaction corresponds to the terms in this online form and my agreement with nova. I understand that the payback date may be later than ${loanDetail.endDate.formatDate()}, if the borrower does not pay on time.",
                                              textColor: NovaColors.appPrimaryText,
                                              textSize:
                                                  NovaTypography.fontLabelSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: 16, vertical: 16),
                                ),
                              ),
                              NovaVSpace(24),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        NovaButtonRound(
                          textTitle: "Submit Offer",
                          bgColor: NovaColors.appPrimaryColorMain500,
                          borderRadius:
                              NovaDecorations.borderRadiusGeometryCircular8,
                          isFormValidated: loanWatcher.agreeToMakeOffer,
                          isLoader: loanWatcher.isLoading,
                          loadingString: loanWatcher.loadingString,
                          functionToRun: () {
                            showAlertDialog(
                                context,
                                "",
                                MakeOfferAmountExchangeWidget(
                                    amountToPay:
                                        loanDetail.loanAmount.toDouble(),
                                    amountToReceive: calculatedResult
                                        .amountToRecieve
                                        .toDouble(),
                                    callBack: () {
                                      loanWatcher.makeLoanOffer(
                                          loanDetail, calculatedResult);
                                    }));
                          },
                        ),
                        NovaVSpace(24),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
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
