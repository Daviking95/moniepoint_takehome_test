part of 'package:peerlendly/modules/loan/exports.dart';

class LoanSummaryScreen extends StatelessWidget {
  const LoanSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();
    final loanReader = context.read<LoanProvider>();
    final profileWatcher = context.watch<ProfileProvider>();

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
                        PLVSpace(16),
                        PLTextWidget(
                          title: "Loan details",
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
                          child: Column(
                            children: [
                              if (!profileWatcher.isLoading &&
                                  profileWatcher.nigeriaBanks.isNotEmpty &&
                                  (profileWatcher.bankDetails?.bankName ?? "")
                                      .isNotEmpty) ...[
                                _loanDetailsItem(
                                    'Bank Account',
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: PLDecorations
                                              .borderRadiusGeometryCircular8,
                                          color: PLColors.appGrayText
                                              .withOpacity(.1)),
                                      child: PLTextWidget(
                                        title: "${profileWatcher
                                            .bankDetails?.bankName ??
                                            ""} ${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                        textColor: PLColors.appPrimaryText,
                                        fontWeight: FontWeight.w300,
                                        textSize: PLTypography.fontLabelSmall,
                                      ).paddingAll(8),
                                    )),
                              ],
                              _loanDetailsItem(
                                  'Amount',
                                  PLTextWidget(
                                    title: 98900
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
                                    title: loanWatcher.tenor.text,
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Purpose',
                                  PLTextWidget(
                                    title: loanWatcher.loanPurpose.text,
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'Repayment Date',
                                  PLTextWidget(
                                    title: loanWatcher.repaymentDate.text,
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        PLVSpace(32),
                      ],
                    ),
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: strProceed,
                          bgColor: PLColors.appPrimaryColorMain500,
                          loadingString: loanWatcher.loadingString,
                          isLoader: loanWatcher.isLoading,
                          borderRadius:
                              PLDecorations.borderRadiusGeometryCircular8,
                          functionToRun: () {
                            loanWatcher.uploadLoanToMarketplace();
                          },
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
