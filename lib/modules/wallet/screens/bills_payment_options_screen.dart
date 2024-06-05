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
          backgroundColor: NovaColors.appWhiteColor,
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
                        title: "Bills Payment",
                      ),
                      NovaVSpace(24),

                      billsPaymentOptionItemWidget(NovaAssets.buyElectricityIcon,
                          "Electricity", () {
                            AppNavigator.push(const PayBillsScreen(title: "Electricity"));
                          }),

                      billsPaymentOptionItemWidget(NovaAssets.buyTvIcon,
                          "Cable TV", () {
                            AppNavigator.push(const PayBillsScreen(title: "Cable TV"));
                          }),
                      billsPaymentOptionItemWidget(NovaAssets.buyWaterBillIcon,
                          "Water Bill", () {
                            AppNavigator.push(const PayBillsScreen(title: "Water Bill"));
                          }),

                      billsPaymentOptionItemWidget(NovaAssets.buyBettingIcon,
                          "Sport Betting", () {
                            AppNavigator.push(const PayBillsScreen(title: "Sport Betting"));
                          }),

                      billsPaymentOptionItemWidget(NovaAssets.buyInternetIcon,
                          "Internet Bill", () {
                            AppNavigator.push(const PayBillsScreen(title: "Internet Bill"));
                          }),
                      billsPaymentOptionItemWidget(NovaAssets.buyEducationIcon,
                          "Education", () {
                            AppNavigator.push(const PayBillsScreen(title: "Education"));
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
                    width: 50.w,
                    height: 50.h,
                  ).paddingAll(5),
                ),
                NovaHSpace(12),
                NovaTextWidget(
                  title: title,
                  textStyle: NovaTypography.textTitleLargeStyle,
                  textColor: NovaColors.appPrimaryText,
                  textSize: NovaTypography.fontBodyLarge,
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
        ),
      ),
    ).marginSymmetric(vertical: 8);
  }

}
