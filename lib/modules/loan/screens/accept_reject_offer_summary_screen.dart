part of 'package:peerlendly/modules/loan/exports.dart';

class AcceptRejectOfferSummaryScreen extends StatelessWidget {
  final LenderOffersResponseModelLoanDetail loanDetail;

  const AcceptRejectOfferSummaryScreen({Key? key, required this.loanDetail})
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
                                        if(loanDetail.image.isNotEmpty && loanDetail.image != 'N/A') ...[
                                          ProfileImageWidget(
                                              imageFile: loanDetail.image,
                                              size: 40),
                                          PLHSpace(12),
                                        ],
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PLTextWidget(
                                              title: loanDetail.name,
                                              textStyle: PLTypography
                                                  .textTitleLargeStyle,
                                              textSize:
                                                  PLTypography.fontTitleMedium,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            PLVSpace(4),
                                            PLTextWidget(
                                              title: "Lender",
                                              textStyle: PLTypography
                                                  .textTitleLargeStyle,
                                              textColor: PLColors.appGrayText,
                                              textSize:
                                                  PLTypography.fontLabelSmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                        'Amount to receive',
                                        PLTextWidget(
                                          title: (UserData.loogedInUserLoan
                                                      ?.amount ??
                                                  0)
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
                                        'Interest Rate',
                                        PLTextWidget(
                                          title:
                                              "${loanDetail.loanPercentage}%",
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Duration (Days)',
                                        PLTextWidget(
                                          title:
                                              "${(UserData.loogedInUserLoan?.duration ?? 0)} Days",
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Interest Value',
                                        PLTextWidget(
                                          title: (UserData.loogedInUserLoan
                                                      ?.interestValue ??
                                                  0)
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
                                        'Repayment Date',
                                        PLTextWidget(
                                          title: UserData
                                              .loogedInUserLoan?.repaymentDate
                                              .formatDate(),
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        )),
                                    _loanDetailsItem(
                                        'Amount to Repay',
                                        PLTextWidget(
                                          title: (UserData.loogedInUserLoan
                                                      ?.amountToPay ??
                                                  0)
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
                                        value: loanWatcher.agreeToAcceptOffer,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        activeColor:
                                            PLColors.appPrimaryColorMain500,
                                        onChanged: (bool? value) {
                                          loanWatcher.agreeToAcceptOffer =
                                              value!;
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
                          textTitle: "Accept Offer",
                          bgColor: PLColors.appPrimaryColorMain500,
                          borderRadius:
                              PLDecorations.borderRadiusGeometryCircular8,
                          isFormValidated: loanWatcher.agreeToAcceptOffer,
                          isLoader: loanWatcher.isLoading,
                          loadingString: loanWatcher.loadingString,
                          functionToRun: () {
                            showAlertDialog(
                                context,
                                "",
                                MakeOfferAmountExchangeWidget(
                                    amountToPay: (UserData.loogedInUserLoan
                                                ?.amountToPay ??
                                            0)
                                        .toDouble(),
                                    amountToReceive: (UserData.loogedInUserLoan
                                                ?.amountToRecieve ??
                                            0)
                                        .toDouble(),
                                    callBack: () {
                                      loanWatcher.acceptLoanOffer(loanDetail.offerId);
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
