part of 'package:peerlendly/modules/loan/exports.dart';

class LoanRequestSummaryCard extends StatefulWidget {
  final MarketplaceResponseModelLoanDetail marketplaceLoan;

  const LoanRequestSummaryCard({
    Key? key,
    required this.marketplaceLoan,
  }) : super(key: key);

  @override
  State<LoanRequestSummaryCard> createState() => _LoanRequestSummaryCardState();
}

class _LoanRequestSummaryCardState extends State<LoanRequestSummaryCard> {

  late LoanProvider loanProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loanProvider = Provider.of<LoanProvider>(context, listen: false);
    loanProvider.getBorrowerLoanHistory(widget.marketplaceLoan.borrowerId);
  }

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
                        PLBackIcon(onTap: () => Navigator.pop(context)),
                        PLVSpace(16),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  PLDecorations.borderRadiusGeometryCircular16,
                              color: PLColors.appWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ProfileImageWidget(
                                      imageFile: widget.marketplaceLoan.image,
                                      size: 40),
                                  PLHSpace(12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PLTextWidget(
                                        title: widget.marketplaceLoan.fullName,
                                        textStyle:
                                            PLTypography.textTitleLargeStyle,
                                        textSize: PLTypography.fontTitleMedium,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      PLVSpace(4),

                                      if(!loanWatcher.isLoading && loanWatcher.borrowerLoanHistory.isNotEmpty)
                                      InkWell(
                                        onTap: () {
                                          modalBottomSheet(
                                              context,
                                              LoanHistoryScreen(borrowerLoanHistory: loanWatcher.borrowerLoanHistory),
                                              true,
                                              context.height / 1.5);
                                        },
                                        child: PLTextWidget(
                                          title: "View transaction history",
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor:
                                              PLColors.appPrimaryColorMain500,
                                          textSize: PLTypography.fontLabelSmall,
                                          textDecoration:
                                              TextDecoration.underline,
                                        ),
                                      ),
                                    ],
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
                                    child: Container(
                                      height: 38.h,
                                      width: 38.w,
                                      decoration: BoxDecoration(
                                          borderRadius: PLDecorations
                                              .borderRadiusGeometryCircular8,
                                          color: PLColors.appGreenColor),
                                      child: Center(
                                        child: PLTextWidget(
                                          title: widget.marketplaceLoan.lendlyScore
                                              .toString(),
                                          textColor: PLColors.appWhiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              PLTypography.fontFamilyBold,
                                          textSize:
                                              PLTypography.fontHeadlineSmall,
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
                              borderRadius:
                                  PLDecorations.borderRadiusGeometryCircular8,
                              color: PLColors.appWhiteColor),
                          child: Column(
                            children: [
                              _loanDetailsItem(
                                  'Amount',
                                  PLTextWidget(
                                    title: widget.marketplaceLoan.loanAmount
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
                                  'Duration (Days)',
                                  PLTextWidget(
                                    title: "${widget.marketplaceLoan.duration} Days",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Purpose',
                                  PLTextWidget(
                                    title: "${widget.marketplaceLoan.loanReason}",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Repayment Date',
                                  PLTextWidget(
                                    title: widget.marketplaceLoan.endDate.formatDate(),
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        PLVSpace(24),
                      ],
                    ),
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: "Make Offer",
                          bgColor: PLColors.appPrimaryColorMain500,
                          borderRadius:
                              PLDecorations.borderRadiusGeometryCircular8,
                          functionToRun: () {
                            AppNavigator.push( MakeOfferScreen(marketplaceLoan: widget.marketplaceLoan));
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
