part of 'package:peerlendly/modules/transaction_history/exports.dart';

class TransactionSummaryScreen extends StatelessWidget {
  const TransactionSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionWatcher = context.watch<TransactionProvider>();
    final transactionReader = context.read<TransactionProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: SingleChildScrollView(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PLTextWidget(
                                title: "Loan Transaction",
                                textStyle: PLTypography.textTitleLargeStyle,
                                textColor: PLColors.appPrimaryText,
                                fontWeight: FontWeight.w700,
                                textSize: PLTypography.fontTitleLarge,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: PLDecorations
                                          .borderRadiusGeometryCircular16,
                                      color: PLColors.appPrimaryColorMain500),
                                  child: PLTextWidget(
                                    title: "Share",
                                    textColor: PLColors.appWhiteColor,
                                    textSize: PLTypography.fontLabelSmall,
                                  ).paddingSymmetric(horizontal: 12, vertical: 8),
                                ),
                              )
                            ],
                          ),
                          PLVSpace(8),
                          PLTextWidget(
                            title: DateTime.now().formatDate(),
                            textStyle: PLTypography.textLabelSmallStyle,
                            textSize: PLTypography.fontLabelSmall,
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
                                    'Interest Rate',
                                    PLTextWidget(
                                      title: "15%",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Duration (Days)',
                                    PLTextWidget(
                                      title: "30 Days",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Purpose',
                                    PLTextWidget(
                                      title: "School Fees",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),

                                // todo : This is for other transactions like bill payment, funding and withdraw

                                _loanDetailsItem(
                                    'Name',
                                    PLTextWidget(
                                      title: "MTN NG VTU 81739821732",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Description',
                                    PLTextWidget(
                                      title: "Airtime Purchase 8072193",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),
                                // todo: end

                                Divider(
                                  color: PLColors.appGrayText.withOpacity(.6),
                                ),

                                // todo : This is for other transactions like bill payment, funding and withdraw
                                _loanDetailsItem(
                                    'Payment Method',
                                    PLTextWidget(
                                      title: "Airtime",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),

                                _loanDetailsItem(
                                    'Transaction Reference',
                                    PLTextWidget(
                                      title: "eljkljekj232323",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),
                                // todo: end

                                _loanDetailsItem(
                                    'Interest Value',
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
                                    'Protection Fee',
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
                                    'Platform Fee',
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
                                    'Final Repayment Date',
                                    PLTextWidget(
                                      title: DateTime.now().formatDate(),
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: PLTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Total Payable',
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
                                    'Status',
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          maxRadius: 4,
                                          backgroundColor: PLColors.appSuccessColor,
                                        ),
                                        PLHSpace(4),
                                        PLTextWidget(
                                          title: "Successful",
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: PLTypography.fontLabelSmall,
                                        ),
                                      ],
                                    )),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          PLVSpace(32),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showAlertDialog(
                                  context,
                                  '',const ReportTransactionPopup());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  PLDecorations.borderRadiusGeometryCircular8,
                                  color: PLColors.appWhiteColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      PLImageSvg(
                                          svgPath: PLAssets.infoIconRed, width: 40.w, height: 40.h,),
                                      PLHSpace(16),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          PLTextWidget(
                                            title: 'Report Transaction',
                                            textStyle: PLTypography.textTitleLargeStyle,
                                            textColor: PLColors.appErrorColor,
                                            fontWeight: FontWeight.w700,
                                            textSize: PLTypography.fontBodyMedium,
                                          ),
                                          PLVSpace(4),
                                          PLTextWidget(
                                            title: 'Report an issue with this transaction',
                                            textStyle: PLTypography.textTitleLargeStyle,
                                            textColor: PLColors.appGrayText,
                                            textSize: PLTypography.fontLabelSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: PLColors.appPrimaryText,
                                    size: 18,
                                  )
                                ],
                              ).paddingSymmetric(horizontal: 16, vertical: 16),
                            ),
                          ),
                          PLVSpace(24),
                        ],
                      )
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
