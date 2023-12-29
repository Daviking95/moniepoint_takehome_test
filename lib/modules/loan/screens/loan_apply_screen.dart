part of 'package:peerlendly/modules/loan/exports.dart';

class LoanApplyScreen extends StatelessWidget {
  const LoanApplyScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BaseView<LoanProvider>(
      vmBuilder: (context) =>
          LoanProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoanProvider model) {
    final loanWatcher = context.watch<LoanProvider>();
    final profileWatcher = context.watch<ProfileProvider>();
    final loanReader = context.read<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
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
                            title: "Apply for loan",
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
                                color: PLColors.appPrimaryColorMain500
                                    .withOpacity(.05)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const PLImageSvg(svgPath: PLAssets.infoIcon),
                                PLHSpace(8),
                                Expanded(
                                  child: PLTextWidget(
                                    title: 'Transfers can only be made to bank account number registered to your account',
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appGrayText,
                                    textSize: PLTypography.fontLabelSmall,
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          PLVSpace(24),
                          PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: model.amount,
                            formatter: CurrencyTextInputFormatter(symbol: strCurrency2),
                            fillColor: PLColors.appWhiteColor,
                            validation: (val) => val.validateAmount(strFieldRequiredError),
                            hintText: "How much do you need ?",
                            // onChange: (val) => model.listenForLoanApplyChanges(),
                          ),
                          PLTextWidget(
                            title:
                            "Minimum amount - 5,000.00   Maximum amount - 50,000.00",
                            textColor: PLColors.appGrayText,
                            textSize: PLTypography.fontLabelSmall,
                          ),
                          PLVSpace(16),
                          PLDropDownButtonWithIcon(
                            list: UserData.loanPurpose,
                            title: "What do you want to use it for?",
                            value: model.loanPurpose,
                            callBack: (val) {
                              // model.listenForLoanApplyChanges();
                            },

                          ),
                          // PLVSpace(16),
                          // PLDropDownButton(
                          //   model.loanPeriod.map((e) => "${e.toString()} Days").toList(),
                          //   5.0,
                          //   "Select Loan Period",
                          //   model.tenor,
                          //   onChangeFunction: (val) {
                          //     // model.listenForLoanApplyChanges();
                          //   },
                          // ),
                          PLVSpace(16),
                          PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: model.tenor,
                            // formatter: CurrencyTextInputFormatter(symbol: strCurrency2),
                            fillColor: PLColors.appWhiteColor,
                            validation: (val) => val.validateNumber(strFieldRequiredError),
                            hintText: "When will you repay the Loan? (Specify no of days)",
                            // onChange: (val) => model.listenForLoanApplyChanges(),
                          ),
                          // PLDatePickerTextField(text: "When will you repay the Loan?", isTodayFirstDate: true, datePickerController: model.repaymentDate, isRequired: true),
                          // PLTextWidget(
                          //   title:
                          //   "Loan duration: Sep 16 - Oct 15, 2023",
                          //   textColor: PLColors.appGrayText,
                          //   textSize: PLTypography.fontLabelSmall,
                          // ),
                          PLVSpace(16),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [PLDecorations.customShadow],
                                borderRadius:
                                PLDecorations.borderRadiusGeometryCircular8,
                                color: PLColors.appWhiteColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PLTextWidget(
                                  title: UserData.getUserProfileResponseModel?.fullName ?? '',
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appGrayText,
                                  textSize: PLTypography.fontLabelMedium,
                                ),
                                PLVSpace(12),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        if (!profileWatcher.isLoading &&
                                            profileWatcher
                                                .nigeriaBanks.isNotEmpty && (profileWatcher.bankDetails?.bankName ?? "").isNotEmpty) ...[
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: PLDecorations
                                                  .borderRadiusGeometryCircular16,
                                            ),
                                            child: PLImageNetwork(
                                              networkPath: profileWatcher.nigeriaBanks
                                                  .firstWhere((element) =>
                                              element.name.toLowerCase() ==
                                                  (profileWatcher.bankDetails?.bankName ?? "").toLowerCase())
                                                  .logo,
                                              width: 32.w,
                                              height: 32.h,
                                            ),
                                          ),
                                          PLHSpace(12),
                                        ],
                                        PLTextWidget(
                                          title: profileWatcher
                                              .bankDetails?.bankName ??
                                              "",
                                          textStyle:
                                          PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appPrimaryText,
                                          textSize: PLTypography.fontBodyMedium,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    PLTextWidget(
                                      title:
                                      "${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      textSize: PLTypography.fontBodyMedium,
                                      fontWeight: FontWeight.w600,
                                    )
                                  ],
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 12),
                          ),
                          PLVSpace(24),
                        ],
                      ),
                      Column(
                        children: [
                          PLButtonRound(
                            textTitle: strProceed,
                            borderRadius:
                            PLDecorations.borderRadiusGeometryCircular8,
                            loadingString: loanWatcher.loadingString,
                            isLoader: loanWatcher.isLoading,
                            functionToRun: () {
                              loanWatcher.processLoanSummary(context);
                            },
                          ),
                          PLVSpace(24),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
