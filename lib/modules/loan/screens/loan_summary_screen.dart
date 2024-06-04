part of 'package:nova/modules/loan/exports.dart';

class LoanSummaryScreen extends StatelessWidget {
  final BuildContext parentContext;
  const LoanSummaryScreen({Key? key, required this.parentContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = parentContext.watch<LoanProvider>();
    final loanReader = context.watch<LoanProvider>();
    final profileWatcher = context.watch<ProfileProvider>();

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
                        NovaVSpace(16),
                        NovaTextWidget(
                          title: "Loan details",
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
                                          borderRadius: NovaDecorations
                                              .borderRadiusGeometryCircular8,
                                          color: NovaColors.appGrayText
                                              .withOpacity(.1)),
                                      child: NovaTextWidget(
                                        title: "${profileWatcher
                                            .bankDetails?.bankName ??
                                            ""} ${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                        textColor: NovaColors.appPrimaryText,
                                        fontWeight: FontWeight.w300,
                                        textSize: NovaTypography.fontLabelSmall,
                                      ).paddingAll(8),
                                    )),
                              ],
                              _loanDetailsItem(
                                  'Amount',
                                  NovaTextWidget(
                                    title: loanWatcher.amount.text
                                        .toString()
                                        .removeCommaAndCurrency()
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
                                    title: "${loanWatcher.tenor.text} Days",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Purpose',
                                  NovaTextWidget(
                                    title: loanWatcher.loanPurpose.text,
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              Divider(
                                color: NovaColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'Repayment Date',
                                  NovaTextWidget(
                                    title: DateTime.now().add(Duration(days: int.parse(loanWatcher.tenor.text))).formatDate(), // loanWatcher.repaymentDate.text,
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        NovaVSpace(32),
                      ],
                    ),
                    Column(
                      children: [
                        NovaButtonRound(
                          textTitle: strProceed,
                          bgColor: NovaColors.appPrimaryColorMain500,
                          loadingString: loanReader.loadingString,
                          isLoader: loanReader.isLoading,
                          borderRadius:
                              NovaDecorations.borderRadiusGeometryCircular8,
                          functionToRun: () {
                            loanReader.uploadLoanToMarketplace(loanWatcher);
                          },
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
