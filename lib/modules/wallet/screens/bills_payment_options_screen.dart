part of 'package:peerlendly/modules/wallet/exports.dart';

class BillsPaymentOptionsScreen extends StatelessWidget {
  const BillsPaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletWatcher = context.watch<WalletProvider>();
    final walletReader = context.read<WalletProvider>();

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(48),
                      PLBackIcon(
                        onTap: () => Navigator.pop(context),
                      ),
                      PLVSpace(16),
                      PLTextWidget(
                        title: "Airtime and Bills",
                        textStyle: PLTypography.textTitleLargeStyle,
                        textColor: PLColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: PLTypography.fontTitleLarge,
                      ),
                      PLVSpace(24),
                      billsPaymentOptionItemWidget(PLAssets.buyAirtimeIcon,
                          "Buy Airtime", () {
                            AppNavigator.push(const AirtimeScreen());
                          }),
                      billsPaymentOptionItemWidget(PLAssets.buyInternetIcon,
                          "Internet", () {
                            AppNavigator.push(const PayBillsScreen(title: "Internet"));
                          }),
                      billsPaymentOptionItemWidget(PLAssets.buyBettingIcon,
                          "Betting", () {
                            AppNavigator.push(const PayBillsScreen(title: "Betting"));
                          }),
                      billsPaymentOptionItemWidget(PLAssets.buyTvIcon,
                          "TV", () {
                            AppNavigator.push(const PayBillsScreen(title: "TV"));
                          }),
                      billsPaymentOptionItemWidget(PLAssets.buyElectricityIcon,
                          "Electricity", () {
                            AppNavigator.push(const PayBillsScreen(title: "Electricity"));
                          }),
                      PLVSpace(24),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }


  Widget billsPaymentOptionItemWidget(
      String assetString, String title, Function() func) {
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
