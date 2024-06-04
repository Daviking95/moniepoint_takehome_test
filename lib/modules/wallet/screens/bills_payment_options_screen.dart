part of 'package:nova/modules/wallet/exports.dart';

class BillsPaymentOptionsScreen extends StatelessWidget {
  const BillsPaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
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
                        title: "Airtime and Bills",
                        textStyle: NovaTypography.textTitleLargeStyle,
                        textColor: NovaColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: NovaTypography.fontTitleLarge,
                      ),
                      NovaVSpace(24),
                      billsPaymentOptionItemWidget(NovaAssets.buyAirtimeIcon,
                          "Buy Airtime", () {
                            AppNavigator.push(const AirtimeScreen());
                          }),
                      billsPaymentOptionItemWidget(NovaAssets.buyInternetIcon,
                          "Internet", () {
                            AppNavigator.push(const PayBillsScreen(title: "Internet"));
                          }),
                      billsPaymentOptionItemWidget(NovaAssets.buyBettingIcon,
                          "Betting", () {
                            AppNavigator.push(const PayBillsScreen(title: "Betting"));
                          }),
                      billsPaymentOptionItemWidget(NovaAssets.buyTvIcon,
                          "TV", () {
                            AppNavigator.push(const PayBillsScreen(title: "TV"));
                          }),
                      billsPaymentOptionItemWidget(NovaAssets.buyElectricityIcon,
                          "Electricity", () {
                            AppNavigator.push(const PayBillsScreen(title: "Electricity"));
                          }),
                      NovaVSpace(24),
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
