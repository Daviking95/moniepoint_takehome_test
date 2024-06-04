part of 'package:nova/modules/loan/exports.dart';

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: NovaPaddedWidget(
                  child: Form(
                    key: loanWatcher.formKeyForLoanApply,
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
                              title: "Apply for loan",
                              textStyle: NovaTypography.textTitleLargeStyle,
                              textColor: NovaColors.appPrimaryText,
                              fontWeight: FontWeight.w700,
                              textSize: NovaTypography.fontTitleLarge,
                            ),
                            NovaVSpace(24),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: NovaDecorations
                                      .borderRadiusGeometryCircular8,
                                  color: NovaColors.appPrimaryColorMain500
                                      .withOpacity(.05)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const NovaImageSvg(svgPath: NovaAssets.infoIcon),
                                  NovaHSpace(8),
                                  Expanded(
                                    child: NovaTextWidget(
                                      title:
                                          'Transfers can only be made to bank account number registered to your account',
                                      textStyle:
                                          NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appGrayText,
                                      textSize: NovaTypography.fontLabelSmall,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 16, vertical: 16),
                            ),
                            NovaVSpace(24),
                            NovaPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: loanWatcher.amount,
                              formatter: [
                                CurrencyTextInputFormatter(symbol: strCurrency2)
                              ],
                              fillColor: NovaColors.appWhiteColor,
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
                            NovaTextWidget(
                              title:
                                  "Minimum amount - ${5000.toString().formatWithCommasAndDecimals().formatToNairaCurrency()} | Maximum amount - ${AppData.getUserProfileResponseModel?.borrowerLimit.toString().formatWithCommasAndDecimals().formatToNairaCurrency() ?? 0}",
                              textColor: NovaColors.appGrayText,
                              textSize: NovaTypography.fontLabelSmall,
                            ),
                            NovaVSpace(16),
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
                            NovaVSpace(16),
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
                            NovaTextWidget(
                              title:
                                  "Loan duration: ${DateTime.now().formatDatev4()} - ${loanWatcher.repaymentDate.text.isNotEmpty ? DateFormat(dateFormatterv3).parse(loanWatcher.selectedDate).formatDatev4() : ""}",
                              textColor: NovaColors.appGrayText,
                              textSize: NovaTypography.fontLabelSmall,
                            ),
                            NovaVSpace(16),
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [NovaDecorations.customShadow],
                                  borderRadius: NovaDecorations
                                      .borderRadiusGeometryCircular8,
                                  color: NovaColors.appWhiteColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel
                                            ?.fullName ??
                                        '',
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appGrayText,
                                    textSize: NovaTypography.fontLabelMedium,
                                  ),
                                  NovaVSpace(12),
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
                                                borderRadius: NovaDecorations
                                                    .borderRadiusGeometryCircular16,
                                              ),
                                              child: NovaImageNetwork(
                                                networkPath: profileWatcher
                                                    .nigeriaBanks
                                                    .firstWhere((element) =>
                                                        element.bankName
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
                                            NovaHSpace(12),
                                          ],
                                          NovaTextWidget(
                                            title: profileWatcher
                                                    .bankDetails?.bankName ??
                                                "",
                                            textStyle: NovaTypography
                                                .textTitleLargeStyle,
                                            textColor: NovaColors.appPrimaryText,
                                            textSize:
                                                NovaTypography.fontBodyMedium,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      NovaTextWidget(
                                        title:
                                            "${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                        textStyle:
                                            NovaTypography.textTitleLargeStyle,
                                        textColor: NovaColors.appPrimaryText,
                                        textSize: NovaTypography.fontBodyMedium,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 16, vertical: 12),
                            ),
                            NovaVSpace(24),
                          ],
                        ),
                        Column(
                          children: [
                            NovaButtonRound(
                              textTitle: strProceed,
                              borderRadius:
                                  NovaDecorations.borderRadiusGeometryCircular8,
                              isFormValidated: loanWatcher.isLoanFormValidated,
                              loadingString: loanWatcher.loadingString,
                              isLoader: loanWatcher.isLoading,
                              functionToRun: () {
                                loanWatcher.processLoanSummary(context);
                              },
                            ),
                            NovaVSpace(24),
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
