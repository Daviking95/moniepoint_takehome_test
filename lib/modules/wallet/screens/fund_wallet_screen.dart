part of 'package:nova/modules/wallet/exports.dart';

class FundWalletScreen extends StatelessWidget {
  const FundWalletScreen({Key? key}) : super(key: key);

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
                        title: "Fund Wallet",
                        textStyle: NovaTypography.textTitleLargeStyle,
                        textColor: NovaColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: NovaTypography.fontTitleLarge,
                      ),
                      NovaVSpace(10),
                      NovaTextWidget(
                        title: "Fund your wallet via bank transfer (Directly to your Nova Account) or via your Debit Card.",
                        textColor: NovaColors.appGrayText,
                        textSize: NovaTypography.fontLabelMedium,
                      ),
                      NovaVSpace(48),
                      NovaTextWidget(
                        title: "Via Bank Transfer",
                        textStyle: NovaTypography.textTitleLargeStyle,
                        textColor: NovaColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: NovaTypography.fontLabelMedium,
                      ),
                      NovaVSpace(8),
                      _accountDetails(),
                      NovaVSpace(48),
                      NovaTextWidget(
                        title: "Via Debit Card",
                        textStyle: NovaTypography.textTitleLargeStyle,
                        textColor: NovaColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: NovaTypography.fontLabelMedium,
                      ),
                      NovaVSpace(8),
                      fundOptionItemWidget(NovaAssets.payWithDebitCard,
                          "Debit Card", () {
                            AppNavigator.push(FundWalletAmountScreen());
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

  _accountDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
          color: NovaColors.appWhiteColor
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _accountItem("Bank Name:", "Stingyx Bank"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                  color: NovaColors.appGrayText.withOpacity(.1)
                ),
                child: NovaTextWidget(
                  title: "Recommended",
                  textColor: NovaColors.appPrimaryText,
                  fontWeight: FontWeight.w300,
                  textSize: NovaTypography.fontLabelSmall,
                ).paddingAll(8),
              )
            ],
          ),
          NovaVSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _accountItem("Account Number", "1234567899"),
              GestureDetector(
                  onTap: () {
                    copyAccountNumber("07011992288");
                  },
                  child: const NovaImageSvg(svgPath: NovaAssets.copyBlue))
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 8, vertical: 8),
    );
  }

  _accountItem(String title, String value) {
    return Row(
      children: [
        NovaTextWidget(
          title: title,
          textColor: NovaColors.appGrayText,
          fontWeight: FontWeight.w300,
          textSize: NovaTypography.fontLabelMedium,
        ),
        NovaHSpace(8),
        NovaTextWidget(
          title: value,
          textColor: NovaColors.appPrimaryText,
          fontWeight: FontWeight.w700,
          textSize: NovaTypography.fontLabelLarge,
        )
      ],
    ).paddingSymmetric(vertical: 8);
  }


  Widget fundOptionItemWidget(
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
