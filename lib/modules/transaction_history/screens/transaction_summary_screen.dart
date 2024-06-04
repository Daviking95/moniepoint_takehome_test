part of 'package:nova/modules/transaction_history/exports.dart';

class TransactionSummaryScreen extends StatelessWidget {
  const TransactionSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                          ),
                          NovaVSpace(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NovaTextWidget(
                                title: "Loan Transaction",
                                textStyle: NovaTypography.textTitleLargeStyle,
                                textColor: NovaColors.appPrimaryText,
                                fontWeight: FontWeight.w700,
                                textSize: NovaTypography.fontTitleLarge,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: NovaDecorations
                                          .borderRadiusGeometryCircular16,
                                      color: NovaColors.appPrimaryColorMain500),
                                  child: NovaTextWidget(
                                    title: "Share",
                                    textColor: NovaColors.appWhiteColor,
                                    textSize: NovaTypography.fontLabelSmall,
                                  ).paddingSymmetric(horizontal: 12, vertical: 8),
                                ),
                              )
                            ],
                          ),
                          NovaVSpace(8),
                          NovaTextWidget(
                            title: DateTime.now().formatDate(),
                            textStyle: NovaTypography.textLabelSmallStyle,
                            textSize: NovaTypography.fontLabelSmall,
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
                                      title: 98900
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
                                    'Interest Rate',
                                    NovaTextWidget(
                                      title: "15%",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Duration (Days)',
                                    NovaTextWidget(
                                      title: "30 Days",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Purpose',
                                    NovaTextWidget(
                                      title: "School Fees",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),

                                // todo : This is for other transactions like bill payment, funding and withdraw

                                _loanDetailsItem(
                                    'Name',
                                    NovaTextWidget(
                                      title: "MTN NG VTU 81739821732",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Description',
                                    NovaTextWidget(
                                      title: "Airtime Purchase 8072193",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                                // todo: end

                                Divider(
                                  color: NovaColors.appGrayText.withOpacity(.6),
                                ),

                                // todo : This is for other transactions like bill payment, funding and withdraw
                                _loanDetailsItem(
                                    'Payment Method',
                                    NovaTextWidget(
                                      title: "Airtime",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),

                                _loanDetailsItem(
                                    'Transaction Reference',
                                    NovaTextWidget(
                                      title: "eljkljekj232323",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                                // todo: end

                                _loanDetailsItem(
                                    'Interest Value',
                                    NovaTextWidget(
                                      title: 98900
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
                                    'Protection Fee',
                                    NovaTextWidget(
                                      title: 98900
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
                                    'Platform Fee',
                                    NovaTextWidget(
                                      title: 98900
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
                                    'Final Repayment Date',
                                    NovaTextWidget(
                                      title: DateTime.now().formatDate(),
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      fontWeight: FontWeight.w600,
                                      textSize: NovaTypography.fontLabelSmall,
                                    )),
                                _loanDetailsItem(
                                    'Total Payable',
                                    NovaTextWidget(
                                      title: 98900
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
                                    'Status',
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          maxRadius: 4,
                                          backgroundColor: NovaColors.appSuccessColor,
                                        ),
                                        NovaHSpace(4),
                                        NovaTextWidget(
                                          title: "Successful",
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appPrimaryText,
                                          fontWeight: FontWeight.w600,
                                          textSize: NovaTypography.fontLabelSmall,
                                        ),
                                      ],
                                    )),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          NovaVSpace(32),
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
                                  NovaDecorations.borderRadiusGeometryCircular8,
                                  color: NovaColors.appWhiteColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      NovaImageSvg(
                                          svgPath: NovaAssets.infoIconRed, width: 40.w, height: 40.h,),
                                      NovaHSpace(16),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          NovaTextWidget(
                                            title: 'Report Transaction',
                                            textStyle: NovaTypography.textTitleLargeStyle,
                                            textColor: NovaColors.appErrorColor,
                                            fontWeight: FontWeight.w700,
                                            textSize: NovaTypography.fontBodyMedium,
                                          ),
                                          NovaVSpace(4),
                                          NovaTextWidget(
                                            title: 'Report an issue with this transaction',
                                            textStyle: NovaTypography.textTitleLargeStyle,
                                            textColor: NovaColors.appGrayText,
                                            textSize: NovaTypography.fontLabelSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: NovaColors.appPrimaryText,
                                    size: 18,
                                  )
                                ],
                              ).paddingSymmetric(horizontal: 16, vertical: 16),
                            ),
                          ),
                          NovaVSpace(24),
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
