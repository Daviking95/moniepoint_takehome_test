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
                  child: Form(
                    key: loanWatcher.formKeyForLoanApply,
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
                                  borderRadius: PLDecorations
                                      .borderRadiusGeometryCircular8,
                                  color: PLColors.appPrimaryColorMain500
                                      .withOpacity(.05)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const PLImageSvg(svgPath: PLAssets.infoIcon),
                                  PLHSpace(8),
                                  Expanded(
                                    child: PLTextWidget(
                                      title:
                                          'Transfers can only be made to bank account number registered to your account',
                                      textStyle:
                                          PLTypography.textTitleLargeStyle,
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
                              controller: loanWatcher.amount,
                              formatter: [
                                CurrencyTextInputFormatter(symbol: strCurrency2)
                              ],
                              fillColor: PLColors.appWhiteColor,
                              validation: (val) => Validators.validateAmount(
                                  val,
                                  strFieldRequiredError,
                                  double.parse(AppData
                                          .getUserProfileResponseModel
                                          ?.borrowerLimit ??
                                      "0")),
                              hintText: "How much do you need ?",
                              onChange: (val) =>
                                  loanWatcher.listenForLoanApplyChanges(),
                            ),
                            PLTextWidget(
                              title:
                                  "Minimum amount - ${5000.toString().formatWithCommasAndDecimals().formatToNairaCurrency()} | Maximum amount - ${AppData.getUserProfileResponseModel?.borrowerLimit.toString().formatWithCommasAndDecimals().formatToNairaCurrency() ?? 0}",
                              textColor: PLColors.appGrayText,
                              textSize: PLTypography.fontLabelSmall,
                            ),
                            PLVSpace(16),
                            PLDropDownButtonWithIcon(
                              list: AppData.loanPurpose,
                              title: "What do you want to use it for?",
                              value: loanWatcher.loanPurpose,
                              callBack: (val) {
                                loanWatcher.listenForLoanApplyChanges();
                              },
                            ),
                            // PLVSpace(16),
                            // PLDropDownButton(
                            //   loanWatcher.loanPeriod.map((e) => "${e.toString()} Days").toList(),
                            //   5.0,
                            //   "Select Loan Period",
                            //   loanWatcher.tenor,
                            //   onChangeFunction: (val) {
                            //     // loanWatcher.listenForLoanApplyChanges();
                            //   },
                            // ),
                            PLVSpace(16),
                            // PLPrimaryTextField(
                            //   textInputType: TextInputType.number,
                            //   controller: loanWatcher.tenor,
                            //   // formatter: CurrencyTextInputFormatter(symbol: strCurrency2),
                            //   fillColor: PLColors.appWhiteColor,
                            //   validation: (val) => val.validateNumberCap(strFieldRequiredError, 30),
                            //   hintText: "When will you repay the Loan? (Specify no of days)",
                            //   onChange: (val) => loanWatcher.listenForLoanApplyChanges(),
                            // ),
                            PLDatePickerTextField(
                                text: "When will you repay the Loan?",
                                isTodayFirstDate: true,
                                datePickerController: loanWatcher.repaymentDate,
                                noOfDays: 30,
                                callBack: (){
                                  loanWatcher.selectedDate = loanWatcher.repaymentDate.text;

                                  loanWatcher.tenor.text = DateFormat(dateFormatterv3).parse(loanWatcher.selectedDate).difference(DateTime.now()).inDays.toString();

                                  "selectedDate ${loanWatcher.tenor.text}".logger();

                                  loanWatcher.listenForLoanApplyChanges();
                                },
                                isRequired: true),
                            PLTextWidget(
                              title:
                                  "Loan duration: ${DateTime.now().formatDatev4()} - ${loanWatcher.repaymentDate.text.isNotEmpty ? DateFormat(dateFormatterv3).parse(loanWatcher.selectedDate).formatDatev4() : ""}",
                              textColor: PLColors.appGrayText,
                              textSize: PLTypography.fontLabelSmall,
                            ),
                            PLVSpace(16),
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [PLDecorations.customShadow],
                                  borderRadius: PLDecorations
                                      .borderRadiusGeometryCircular8,
                                  color: PLColors.appWhiteColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel
                                            ?.fullName ??
                                        '',
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
                                                  .nigeriaBanks.isNotEmpty &&
                                              (profileWatcher.bankDetails
                                                          ?.bankName ??
                                                      "")
                                                  .isNotEmpty) ...[
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: PLDecorations
                                                    .borderRadiusGeometryCircular16,
                                              ),
                                              child: PLImageNetwork(
                                                networkPath: profileWatcher
                                                    .nigeriaBanks
                                                    .firstWhere((element) =>
                                                        element.name
                                                            .toLowerCase() ==
                                                        (profileWatcher
                                                                    .bankDetails
                                                                    ?.bankName ??
                                                                "")
                                                            .toLowerCase())
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
                                            textStyle: PLTypography
                                                .textTitleLargeStyle,
                                            textColor: PLColors.appPrimaryText,
                                            textSize:
                                                PLTypography.fontBodyMedium,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      PLTextWidget(
                                        title:
                                            "${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                        textStyle:
                                            PLTypography.textTitleLargeStyle,
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
                              isFormValidated: loanWatcher.isLoanFormValidated,
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
                ),
              )),
        ),
      ),
    );
  }
}
