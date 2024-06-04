part of 'package:nova/modules/loan/exports.dart';

class PayLoanOptionsScreen extends StatelessWidget {
  final double amountToPay;
  final LoogedInUserLoanResponseModel? loanDetails;

  const PayLoanOptionsScreen({Key? key, required this.amountToPay, required this.loanDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: NovaOverlayLoader(
                  loadingString: loanWatcher.loadingString,
                  startLoader: loanWatcher.isLoading,
                  child: NovaPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        NovaVSpace(16),
                        NovaTextWidget(
                          title: "Pay Loan",
                          textStyle: NovaTypography.textTitleLargeStyle,
                          textColor: NovaColors.appPrimaryText,
                          fontWeight: FontWeight.w700,
                          textSize: NovaTypography.fontTitleLarge,
                        ),
                        NovaVSpace(24),
                        payOptionItemWidget(
                            NovaAssets.payWithWallet, "Pay With Wallet", () {
                          showAlertDialog(
                              context,
                              '',
                              PayLoanPopUp(
                                  amount: amountToPay, loanWatcher: loanWatcher, loanDetails: loanDetails));
                        }, loanWatcher),
                        payOptionItemWidget(NovaAssets.payWithDebitCard,
                            "Pay With Debit Card", () {
                              showAlertDialog(
                                  context,
                                  '',
                                  PayLoanPopUp(
                                    isWallet: false,
                                      amount: amountToPay, loanWatcher: loanWatcher, loanDetails: loanDetails));
                            }, loanWatcher),
                        NovaVSpace(24),
                        NovaVSpace(24),
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
            borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
            color: NovaColors.appWhiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                      color: const Color(0xffFAFCFE)),
                  child: NovaImageSvg(
                    svgPath: assetString,
                    width: 24.w,
                    height: 24.h,
                  ).paddingAll(5),
                ),
                NovaHSpace(12),
                NovaTextWidget(
                  title: title,
                  textStyle: NovaTypography.textTitleLargeStyle,
                  textColor: NovaColors.appPrimaryText,
                  textSize: NovaTypography.fontBodyMedium,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            loanWatcher.isLoading ? const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: NovaColors.appPrimaryColorMain500,
                )) :
            const Icon(
              Icons.arrow_forward_ios,
              color: NovaColors.appPrimaryText,
              size: 18,
            )
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 16),
      ),
    ).marginSymmetric(vertical: 8);
  }
}
