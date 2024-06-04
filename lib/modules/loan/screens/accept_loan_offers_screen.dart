part of 'package:nova/modules/loan/exports.dart';

class AcceptLoanOffersScreen extends StatelessWidget {
  final LoogedInUserLoanResponseModel? loanDetails;

  const AcceptLoanOffersScreen({Key? key, this.loanDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoanProvider>(
      vmBuilder: (context) =>
          LoanProvider(context: context, shouldInitialize: true, shouldGetLoanOffers: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoanProvider model) {
    final loanWatcher = context.watch<LoanProvider>();
    final profileWatcher = context.watch<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: SingleChildScrollView(
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
                            extraWidget: GestureDetector(
                              onTap: (){
                                showAlertDialog(
                                    context,
                                    '',
                                    CancelLoanRequestPopup(loanDetail: loanDetails));
                              },
                                child: Icon(Icons.delete_forever, color: NovaColors.appErrorColor,)),

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
                                _loanDetailsItem(
                                    'Bank Account',
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: NovaDecorations
                                              .borderRadiusGeometryCircular8,
                                          color: NovaColors.appGrayText
                                              .withOpacity(.1)),
                                      child: NovaTextWidget(
                                        title:
                                        "${profileWatcher.bankDetails
                                            ?.bankName ?? ""} ${profileWatcher
                                            .bankDetails?.accountNumber
                                            .substring(0, 4) ?? ""}******",
                                        textColor: NovaColors.appPrimaryText,
                                        fontWeight: FontWeight.w300,
                                        textSize: NovaTypography.fontLabelSmall,
                                      ).paddingAll(8),
                                    )),
                                _loanDetailsItem(
                                    'Amount',
                                    NovaTextWidget(
                                      title:
                                      (AppData.loogedInUserLoan?.amount ??
                                          0)
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
                                      title:
                                      "${(AppData.loogedInUserLoan?.duration ??
                                          0)} Days",
                                      textStyle:
                                      NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Purpose',
                                    NovaTextWidget(
                                      title: "School Fees",
                                      textStyle:
                                      NovaTypography.textTitleLargeStyle,
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
                                      title: AppData
                                          .loogedInUserLoan?.repaymentDate
                                          .formatDate(),
                                      textStyle:
                                      NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          NovaVSpace(24),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                NovaDecorations.borderRadiusGeometryCircular8,
                                color: NovaColors.appPrimaryColorMain500
                                    .withOpacity(.05)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const NovaImageSvg(svgPath: NovaAssets.infoIcon),
                                NovaHSpace(8),
                                Expanded(
                                  child: NovaTextWidget(
                                    title:
                                    'You will be charged an extra fee of 1% per day for delayed repayment. Ensure your wallet is funded and make payment on time to avoid this.',
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appGrayText,
                                    textSize: NovaTypography.fontLabelSmall,
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          NovaVSpace(24),
                          NovaTextWidget(
                            title: "Offers",
                            textStyle: NovaTypography.textTitleLargeStyle,
                            textColor: NovaColors.appPrimaryText,
                            fontWeight: FontWeight.w700,
                            textSize: NovaTypography.fontTitleLarge,
                          ),
                          NovaVSpace(16),
                          if(loanWatcher.isLoading &&
                              AppData.loanOffersFromLenders.isEmpty) ...[
                            const Center(
                              child: CircularProgressIndicator(),)
                          ],

                          if (!loanWatcher.isLoading && AppData.loanOffersFromLenders.isEmpty) ...[
                            const Center(
                              child: EmptyLoanScreenWithTextOnly(
                                  text: 'No loan offer yet'),
                            )
                          ] else ...[
                          for (var index = 0;
                          index < AppData.loanOffersFromLenders.length;
                          index++) ...[
                            LoanOffersCard(
                                loanDetail:
                                AppData.loanOffersFromLenders[index]),
                          ]
                          ]
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     PLButtonRound(
                      //       textTitle: strProceed,
                      //       bgColor: PLColors.appPrimaryColorMain500,
                      //       loadingString: loanWatcher.loadingString,
                      //       isLoader: loanWatcher.isLoading,
                      //       borderRadius:
                      //       PLDecorations.borderRadiusGeometryCircular8,
                      //       functionToRun: () {
                      //         loanWatcher.uploadLoanToMarketplace();
                      //       },
                      //     ),
                      //     PLVSpace(24),
                      //   ],
                      // )
                    ],
                  ),
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
