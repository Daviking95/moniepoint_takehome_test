part of 'package:peerlendly/modules/loan/exports.dart';

class MakeOfferScreen extends StatelessWidget {
  const MakeOfferScreen({Key? key}) : super(key: key);

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
    final loanReader = context.read<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Form(
                  key: loanWatcher.formKeyToMakeOffer,
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
                                    title: 'Note: Interest rates are capped. Lenders cannot input an interest rate above 15%',
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appGrayText,
                                    textSize: PLTypography.fontLabelSmall,
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 16),
                          ),
                          PLVSpace(24),
                          Container(
                            decoration: BoxDecoration(
                              color: PLColors.appWhiteColor,
                              borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: PLTextWidget(
                                    title: "Interest rates are capped at 15%",
                                    textColor: PLColors.appGrayText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  ),
                                ),
                                PLVSpace(10),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        loanWatcher.changeInterest(true);
                                      },
                                      child: PLImageSvg(
                                        svgPath: PLAssets.minusIcon,
                                        width: 36.w,
                                        height: 36.h,
                                      ),
                                    ),
                                    PLHSpace(8),
                                    Expanded(
                                      child: PLPrimaryTextField(
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
                                            val.validateNumber(strFieldRequiredError),
                                        onChange: (val) => loanWatcher.listenForInterestChanges(),
                                      ),
                                    ),
                                    PLHSpace(16),
                                    InkWell(
                                      onTap: () {
                                        loanWatcher.changeInterest(false);
                                      },
                                      child: PLImageSvg(
                                        svgPath: PLAssets.plusIcon,
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
                          PLVSpace(24),
                        ],
                      ),
                      Column(
                        children: [
                          PLButtonRound(
                            textTitle: strNext,
                            borderRadius:
                            PLDecorations.borderRadiusGeometryCircular8,
                            loadingString: loanWatcher.loadingString,
                            isFormValidated: loanWatcher.isFormValidated,
                            isLoader: loanWatcher.isLoading,
                            functionToRun: () {
                              AppNavigator.push(MakeOfferSummaryScreen());
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
