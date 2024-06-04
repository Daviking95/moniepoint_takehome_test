part of 'package:nova/modules/loan/exports.dart';

class AcceptRejectOfferSummaryScreen extends StatelessWidget {
  final LenderOffersResponseModelLoanDetail loanDetail;

  const AcceptRejectOfferSummaryScreen({Key? key, required this.loanDetail})
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
              child: Container(
                color: context.theme.scaffoldBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                                        if(loanDetail.image.isNotEmpty && loanDetail.image != 'N/A') ...[
                                          ProfileImageWidget(
                                              imageFile: loanDetail.image,
                                              size: 40),
                                          NovaHSpace(12),
                                        ],
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            NovaTextWidget(
                                              title: loanDetail.name.toTitleCase,
                                              textStyle: NovaTypography
                                                  .textTitleLargeStyle,
                                              textSize:
                                                  NovaTypography.fontTitleMedium,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            NovaVSpace(4),
                                            NovaTextWidget(
                                              title: "Lender",
                                              textStyle: NovaTypography
                                                  .textTitleLargeStyle,
                                              textColor: NovaColors.appGrayText,
                                              textSize:
                                                  NovaTypography.fontLabelSmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                        'Amount to receive',
                                        NovaTextWidget(
                                          title: (loanDetail.amountToRecieve)
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
                                        'Interest Rate',
                                        NovaTextWidget(
                                          title:
                                              "${loanDetail.loanPercentage}%",
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Duration (Days)',
                                        NovaTextWidget(
                                          title:
                                              "${(AppData.loogedInUserLoan?.duration ?? 0)} Days",
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Interest Value',
                                        NovaTextWidget(
                                          title: (loanDetail.interestValue)
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
                                        'Repayment Date',
                                        NovaTextWidget(
                                          title: AppData
                                              .loogedInUserLoan?.repaymentDate
                                              .formatDate(),
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Amount to Repay',
                                        NovaTextWidget(
                                          title: (loanDetail.repaymentAmount)
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
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Checkbox(
                                        value: loanWatcher.agreeToAcceptOffer,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        activeColor:
                                            NovaColors.appPrimaryColorMain500,
                                        onChanged: (bool? value) {
                                          loanWatcher.agreeToAcceptOffer =
                                              value!;
                                        },
                                      ),
                                    ),
                                    NovaHSpace(16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          NovaTextWidget(
                                            title:
                                                "You are agreeing to borrow the amount above from ${loanDetail.name}. Funds will be credited to your account",
                                            textColor: NovaColors.appPrimaryText,
                                            fontWeight: FontWeight.w600,
                                            textSize:
                                                NovaTypography.fontLabelSmall,
                                          ),
                                          // PLVSpace(8),
                                          // PLTextWidget(
                                          //   title:
                                          //       "I authorize nova to debit my account for the amount noted on today’s date and will not dispute nova debiting my account as the transaction corresponds to the terms in this online form and my agreement with nova. I understand that the payback date may be later than 15 Oct, 2023 if the borrower does not pay on time.",
                                          //   textColor: PLColors.appPrimaryText,
                                          //   textSize:
                                          //       PLTypography.fontLabelSmall,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 16, vertical: 16),
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
                          textTitle: "Accept Offer",
                          bgColor: NovaColors.appPrimaryColorMain500,
                          borderRadius:
                              NovaDecorations.borderRadiusGeometryCircular8,
                          isFormValidated: loanWatcher.agreeToAcceptOffer,
                          isLoader: loanWatcher.isLoading,
                          loadingString: loanWatcher.loadingString,
                          functionToRun: () {
                            showAlertDialog(
                                context,
                                "",
                                MakeOfferAmountExchangeWidget(
                                    amountToPay: (loanDetail.repaymentAmount)
                                        .toDouble(),
                                    amountToReceive: (loanDetail.amountToRecieve)
                                        .toDouble(),
                                    callBack: () {
                                      loanWatcher.acceptLoanOffer(loanDetail.offerId);
                                    },
                                  isBorrower: true
                                ));
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
