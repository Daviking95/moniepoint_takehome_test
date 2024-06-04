part of 'package:nova/modules/loan/exports.dart';

class MakeOfferScreen extends StatelessWidget {
  final MarketplaceResponseModelLoanDetail marketplaceLoan;

  const MakeOfferScreen({Key? key,
    required this.marketplaceLoan,
  }) : super(key: key);

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Form(
                  key: loanWatcher.formKeyToMakeOffer,
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
                          NovaVSpace(8),
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
                                    title: 'Note: Interest rates are capped. Lenders cannot input an interest rate above 15%',
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appGrayText,
                                    textSize: NovaTypography.fontLabelSmall,
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          NovaVSpace(24),
                          Container(
                            decoration: BoxDecoration(
                              color: NovaColors.appWhiteColor,
                              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: NovaTextWidget(
                                    title: "Interest rates are capped at 15%",
                                    textColor: NovaColors.appGrayText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  ),
                                ),
                                NovaVSpace(10),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        loanWatcher.changeInterest(true);
                                      },
                                      child: NovaImageSvg(
                                        svgPath: NovaAssets.minusIcon,
                                        width: 36.w,
                                        height: 36.h,
                                      ),
                                    ),
                                    NovaHSpace(8),
                                    Expanded(
                                      child: NovaPrimaryTextField(
                                        textInputType: TextInputType.number,
                                        controller: loanWatcher.interestRate,
                                        textAlign: TextAlign.center,
                                        borderRadius: 0,
                                        fontSize: 30,
                                        // autoFocus: true,
                                        fillColor: Colors.transparent,
                                        hasSuffixIcon: true,
                                        suffixText: "%",
                                        validation: (val) =>
                                            val.validateNumberCap(strFieldRequiredError, 15),
                                        onChange: (val) => loanWatcher.listenForInterestChanges(),
                                      ),
                                    ),
                                    NovaHSpace(16),
                                    InkWell(
                                      onTap: () {
                                        loanWatcher.changeInterest(false);
                                      },
                                      child: NovaImageSvg(
                                        svgPath: NovaAssets.plusIcon,
                                        width: 36.w,
                                        height: 36.h,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          // PLVSpace(24),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       height: 15,
                          //       width: 15,
                          //       child: Checkbox(
                          //         value: loanWatcher.addLendlyProtection,
                          //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          //         activeColor: PLColors.appPrimaryColorMain500,
                          //         onChanged: (bool? value) {
                          //           loanWatcher.addLendlyProtection = value!;
                          //         },
                          //       ),
                          //     ),
                          //     PLHSpace(16),
                          //     PLTextWidget(
                          //       title: "Add Lendly Protection",
                          //       textColor: PLColors.appPrimaryText,
                          //       fontWeight: FontWeight.w600,
                          //       textSize: PLTypography.fontLabelMedium,
                          //     ),
                          //     PLHSpace(8),
                          //     InkWell(
                          //       onTap: () {
                          //         showAlertDialog(context, '', const PLImagePng(imgPath: PLAssets.lendlyProtection));
                          //
                          //       },
                          //         child: const Icon(Icons.info_outline, color: PLColors.appPrimaryColorMain500, size: 15,))
                          //   ],
                          // ),
                          NovaVSpace(24),
                        ],
                      ),
                      Column(
                        children: [
                          NovaButtonRound(
                            textTitle: strNext,
                            borderRadius:
                            NovaDecorations.borderRadiusGeometryCircular8,
                            loadingString: loanWatcher.loadingString,
                            isFormValidated: loanWatcher.isFormValidated,
                            isLoader: loanWatcher.isLoading,
                            functionToRun: () {
                              loanWatcher.calculateLoan(marketplaceLoan.loanId, loanWatcher.interestRate.text, marketplaceLoan);
                              },
                          ),
                          NovaVSpace(24),
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
