part of 'package:peerlendly/modules/loan/exports.dart';

class MakeOfferSummaryScreen extends StatelessWidget {
  final MarketplaceResponseModelLoanDetail loanDetail;
  final LoogedInUserLoanResponseModel calculatedResult;

  const MakeOfferSummaryScreen(
      {Key? key, required this.loanDetail, required this.calculatedResult})
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
            child: PLPaddedWidget(
              child: Container(
                color: context.theme.scaffoldBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                          extraWidget: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: PLDecorations
                                      .borderRadiusGeometryCircular16,
                                  color: PLColors.appPrimaryColorMain500),
                              child: PLTextWidget(
                                title: "Edit Rate",
                                textColor: PLColors.appWhiteColor,
                                textSize: PLTypography.fontLabelSmall,
                              ).paddingSymmetric(horizontal: 12, vertical: 8),
                            ),
                          ),
                        ),
                        PLVSpace(16),
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
                                    borderRadius: PLDecorations
                                        .borderRadiusGeometryCircular16,
                                    color: PLColors.appWhiteColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ProfileImageWidget(
                                            imageFile: loanDetail.image,
                                            size: 40),
                                        PLHSpace(12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PLTextWidget(
                                              title:
                                                  (loanDetail.fullName ?? ""),
                                              textStyle: PLTypography
                                                  .textTitleLargeStyle,
                                              textSize:
                                                  PLTypography.fontTitleMedium,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            PLVSpace(4),
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
                                                child: PLTextWidget(
                                                  title:
                                                      "View transaction history",
                                                  textStyle: PLTypography
                                                      .textTitleLargeStyle,
                                                  textColor: PLColors
                                                      .appPrimaryColorMain500,
                                                  textSize: PLTypography
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
                                        PLTextWidget(
                                          title: "Lendly Score",
                                          textStyle:
                                              PLTypography.textBodySmallStyle,
                                          textSize: PLTypography.fontLabelSmall,
                                          textColor: PLColors.appGrayText,
                                          maxLines: 1,
                                        ),
                                        PLVSpace(4),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 38.h,
                                            width: 38.w,
                                            decoration: BoxDecoration(
                                                borderRadius: PLDecorations
                                                    .borderRadiusGeometryCircular8,
                                                color: PLColors.appGreenColor),
                                            child: Center(
                                              child: PLTextWidget(
                                                title: (loanDetail.lendlyScore)
                                                    .toString(),
                                                textColor:
                                                    PLColors.appWhiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    PLTypography.fontFamilyBold,
                                                textSize: PLTypography
                                                    .fontHeadlineSmall,
                                              ),
                                            ),
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
                                    borderRadius: PLDecorations
                                        .borderRadiusGeometryCircular8,
                                    color: PLColors.appWhiteColor),
                                child: Column(
                                  children: [
                                    _loanDetailsItem(
                                        'Amount',
                                        PLTextWidget(
                                          title: loanDetail.loanAmount
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              PLTypography.textTitleSmallStyle,
                                          textSize: PLTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: PLColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),
                                    _loanDetailsItem(
                                        'Duration (Days)',
                                        PLTextWidget(
                                          title: "${loanDetail.duration} Days",
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Purpose',
                                        PLTextWidget(
                                          title: loanDetail.loanReason,
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Repayment Date',
                                        PLTextWidget(
                                          title:
                                              loanDetail.endDate.formatDate(),
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        )),

                                    Divider(
                                      color:
                                          PLColors.appGrayText.withOpacity(.6),
                                    ),
                                    _loanDetailsItem(
                                        'Amount to Pay',
                                        PLTextWidget(
                                          title: calculatedResult.amountToPay
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              PLTypography.textTitleSmallStyle,
                                          textSize: PLTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: PLColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),

                                    Divider(
                                      color:
                                          PLColors.appGrayText.withOpacity(.6),
                                    ),

                                    _loanDetailsItem(
                                        'Interest Value',
                                        PLTextWidget(
                                          title: calculatedResult.interestValue
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              PLTypography.textTitleSmallStyle,
                                          textSize: PLTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: PLColors.appPrimaryText,
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
                                        PLTextWidget(
                                          title: calculatedResult.platformFee
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              PLTypography.textTitleSmallStyle,
                                          textSize: PLTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: PLColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),
                                    _loanDetailsItem(
                                        'Final Repayment Date',
                                        PLTextWidget(
                                          title: calculatedResult.repaymentDate
                                              .formatDate(),
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Amount to be Received',
                                        PLTextWidget(
                                          title: calculatedResult
                                              .amountToRecieve
                                              .toString()
                                              .formatWithCommasAndDecimals(),
                                          textStyle:
                                              PLTypography.textTitleSmallStyle,
                                          textSize: PLTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w600,
                                          textColor: PLColors.appPrimaryText,
                                          maxLines: 1,
                                          isCurrency: true,
                                        )),
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 16, vertical: 16),
                              ),
                              PLVSpace(24),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: PLDecorations
                                        .borderRadiusGeometryCircular8,
                                    color: PLColors.appWhiteColor),
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
                                            PLColors.appPrimaryColorMain500,
                                        onChanged: (bool? value) {
                                          loanWatcher.agreeToMakeOffer = value!;
                                        },
                                      ),
                                    ),
                                    PLHSpace(16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PLTextWidget(
                                            title:
                                                "You are agreeing to lend the amount above to Jide. Funds will be debited from your account",
                                            textColor: PLColors.appPrimaryText,
                                            fontWeight: FontWeight.w600,
                                            textSize:
                                                PLTypography.fontLabelSmall,
                                          ),
                                          PLVSpace(8),
                                          PLTextWidget(
                                            title:
                                                "I authorize PeerLendly to debit my account for the amount noted on today’s date and will not dispute PeerLendly debiting my account as the transaction corresponds to the terms in this online form and my agreement with PeerLendly. I understand that the payback date may be later than 15 Oct, 2023 if the borrower does not pay on time.",
                                            textColor: PLColors.appPrimaryText,
                                            textSize:
                                                PLTypography.fontLabelSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 16, vertical: 16),
                              ),
                              PLVSpace(24),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: "Submit Offer",
                          bgColor: PLColors.appPrimaryColorMain500,
                          borderRadius:
                              PLDecorations.borderRadiusGeometryCircular8,
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
                        PLVSpace(24),
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
