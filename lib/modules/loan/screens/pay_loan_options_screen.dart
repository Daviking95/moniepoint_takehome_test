part of 'package:peerlendly/modules/loan/exports.dart';

class PayLoanOptionsScreen extends StatelessWidget {
  final double amountToPay;
  final LoogedInUserLoanResponseModel? loanDetails;


  const PayLoanOptionsScreen({Key? key, required this.amountToPay, required this.loanDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();
    final loanReader = context.read<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: PLOverlayLoader(
                  loadingString: loanWatcher.loadingString,
                  startLoader: loanWatcher.isLoading,
                  child: PLPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        PLVSpace(16),
                        PLTextWidget(
                          title: "Pay Loan",
                          textStyle: PLTypography.textTitleLargeStyle,
                          textColor: PLColors.appPrimaryText,
                          fontWeight: FontWeight.w700,
                          textSize: PLTypography.fontTitleLarge,
                        ),
                        PLVSpace(24),
                        payOptionItemWidget(
                            PLAssets.payWithWallet, "Pay With Wallet", () {
                          showAlertDialog(
                              context,
                              '',
                              PayLoanPopUp(
                                  amount: amountToPay, loanWatcher: loanWatcher, loanDetails: loanDetails));
                        }, loanWatcher),
                        payOptionItemWidget(PLAssets.payWithDebitCard,
                            "Pay With Debit Card", () {
                              showAlertDialog(
                                  context,
                                  '',
                                  PayLoanPopUp(
                                    isWallet: false,
                                      amount: amountToPay, loanWatcher: loanWatcher, loanDetails: loanDetails));
                            }, loanWatcher),
                        PLVSpace(24),
                        PLVSpace(24),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget payOptionItemWidget(
      String assetString, String title, Function() func, LoanProvider loanWatcher) {
    return InkWell(
      onTap: () => func(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: PLDecorations.borderRadiusGeometryCircular8,
            color: PLColors.appWhiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                      color: const Color(0xffFAFCFE)),
                  child: PLImageSvg(
                    svgPath: assetString,
                    width: 24.w,
                    height: 24.h,
                  ).paddingAll(5),
                ),
                PLHSpace(12),
                PLTextWidget(
                  title: title,
                  textStyle: PLTypography.textTitleLargeStyle,
                  textColor: PLColors.appPrimaryText,
                  textSize: PLTypography.fontBodyMedium,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            loanWatcher.isLoading ? const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: PLColors.appPrimaryColorMain500,
                )) :
            const Icon(
              Icons.arrow_forward_ios,
              color: PLColors.appPrimaryText,
              size: 18,
            )
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 16),
      ),
    ).marginSymmetric(vertical: 8);
  }
}
