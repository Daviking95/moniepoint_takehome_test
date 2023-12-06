part of 'package:peerlendly/modules/loan/exports.dart';


class SingleLoanScreen extends StatelessWidget {
  final LoanStatus loanStatus;

  const SingleLoanScreen({Key? key, required this.loanStatus})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
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
                        PLVSpace(8),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: PLDecorations.borderRadiusGeometryCircular16,
                              color: PLColors.appWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ProfileImageWidget(imageFile: UserData.profilePicture, size: 40),
                                  PLHSpace(12),
                                  PLTextWidget(
                                    title: (UserData.getUserProfileResponseModel?.fullName ?? ""),
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryColorMain500,
                                    textSize: PLTypography.fontTitleMedium,
                                    fontWeight: FontWeight.w700,
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
                                          borderRadius:
                                          PLDecorations.borderRadiusGeometryCircular8,
                                          color: PLColors.appGreenColor),
                                      child: Center(
                                        child: PLTextWidget(
                                          title: (UserData.lendlyScoreResponseModel?.lendlyScore ?? 0).toString(),
                                          textColor: PLColors.appWhiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: PLTypography.fontFamilyBold,
                                          textSize: PLTypography.fontHeadlineSmall,
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

                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),
                              _loanDetailsItem(
                                  'Amount to Pay',
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

                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),

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
                                  'Amount to be Received',
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
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        PLVSpace(32),
                      ],
                    ),
                    if(loanStatus == LoanStatus.delayed || loanStatus == LoanStatus.loanOffer)
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: loanStatus == LoanStatus.delayed ? "Report" : "Cancel Offer",
                          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                          bgColor: PLColors.appErrorColor,
                          functionToRun: loanStatus == LoanStatus.loanOffer ? () => _cancelOffer(context) : null,
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

  _cancelOffer(BuildContext context){
    showAlertDialog(
        context,
        '',
        const CancelLoanOfferPopup());
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
