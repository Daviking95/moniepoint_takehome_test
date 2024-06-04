part of 'package:nova/modules/loan/exports.dart';

class LoanRequestSummaryCard extends StatelessWidget {
  final MarketplaceResponseModelLoanDetail marketplaceLoan;

  const LoanRequestSummaryCard({
    Key? key,
    required this.marketplaceLoan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoanProvider>(
      vmBuilder: (context) => LoanProvider(
          context: context,
          shouldInitialize: true,
          shouldGetBorrowerHistory: true,
          borrowerId: marketplaceLoan.borrowerId),
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
                        NovaBackIcon(onTap: () => Navigator.pop(context)),
                        NovaVSpace(16),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  NovaDecorations.borderRadiusGeometryCircular16,
                              color: NovaColors.appWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (loanWatcher
                                      .borrowerLoanHistory.isNotEmpty) {
                                    modalBottomSheet(
                                        context,
                                        LoanHistoryScreen(
                                            borrowerLoanHistory: loanWatcher
                                                .borrowerLoanHistory),
                                        true,
                                        context.height / 1.5);
                                  }
                                },
                                child: Row(
                                  children: [
                                    ProfileImageWidget(
                                        imageFile: marketplaceLoan.image,
                                        size: 40),
                                    NovaHSpace(12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        NovaTextWidget(
                                          title: marketplaceLoan.fullName
                                              .toTitleCase,
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textSize:
                                              NovaTypography.fontTitleMedium,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        NovaVSpace(4),
                                        if (!loanWatcher.isLoading &&
                                            loanWatcher
                                                .borrowerLoanHistory.isNotEmpty)
                                          InkWell(
                                            onTap: () {},
                                            child: NovaTextWidget(
                                              title: "View transaction history",
                                              textStyle: NovaTypography
                                                  .textTitleLargeStyle,
                                              textColor: NovaColors
                                                  .appPrimaryColorMain500,
                                              textSize:
                                                  NovaTypography.fontLabelSmall,
                                              textDecoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.center,
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
                                      score: marketplaceLoan.lendlyScore,
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
                                    title: marketplaceLoan.loanAmount
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
                                  'Duration (Days)',
                                  NovaTextWidget(
                                    title:
                                        "${marketplaceLoan.duration} Days",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Purpose',
                                  NovaTextWidget(
                                    title:
                                        "${marketplaceLoan.loanReason}",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Repayment Date',
                                  NovaTextWidget(
                                    title: marketplaceLoan.endDate
                                        .formatDate(),
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        NovaVSpace(24),
                      ],
                    ),
                    Column(
                      children: [
                        NovaButtonRound(
                          textTitle: "Make Offer",
                          bgColor: NovaColors.appPrimaryColorMain500,
                          borderRadius:
                              NovaDecorations.borderRadiusGeometryCircular8,
                          functionToRun: () {
                            AppNavigator.push(MakeOfferScreen(
                                marketplaceLoan: marketplaceLoan));
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
