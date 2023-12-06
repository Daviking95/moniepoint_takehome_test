part of 'package:peerlendly/modules/wallet/exports.dart';

class FundWalletScreen extends StatelessWidget {
  const FundWalletScreen({Key? key}) : super(key: key);

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
                        title: "Fund Wallet",
                        textStyle: PLTypography.textTitleLargeStyle,
                        textColor: PLColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: PLTypography.fontTitleLarge,
                      ),
                      PLVSpace(10),
                      PLTextWidget(
                        title: "Fund your wallet via bank transfer (Directly to your Peer Lendly Account) or via your Debit Card.",
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(48),
                      PLTextWidget(
                        title: "Via Bank Transfer",
                        textStyle: PLTypography.textTitleLargeStyle,
                        textColor: PLColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(8),
                      _accountDetails(),
                      PLVSpace(48),
                      PLTextWidget(
                        title: "Via Debit Card",
                        textStyle: PLTypography.textTitleLargeStyle,
                        textColor: PLColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(8),
                      fundOptionItemWidget(PLAssets.payWithDebitCard,
                          "Debit Card", () {
                            AppNavigator.push(FundWalletAmountScreen());
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

  _accountDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
          color: PLColors.appWhiteColor
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _accountItem("Bank Name:", "Stingyx Bank"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                  color: PLColors.appGrayText.withOpacity(.1)
                ),
                child: PLTextWidget(
                  title: "Recommended",
                  textColor: PLColors.appPrimaryText,
                  fontWeight: FontWeight.w300,
                  textSize: PLTypography.fontLabelSmall,
                ).paddingAll(8),
              )
            ],
          ),
          PLVSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _accountItem("Account Number", "1234567899"),
              GestureDetector(
                  onTap: () {
                    copyAccountNumber("07011992288");
                  },
                  child: const PLImageSvg(svgPath: PLAssets.copyBlue))
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 8, vertical: 8),
    );
  }

  _accountItem(String title, String value) {
    return Row(
      children: [
        PLTextWidget(
          title: title,
          textColor: PLColors.appGrayText,
          fontWeight: FontWeight.w300,
          textSize: PLTypography.fontLabelMedium,
        ),
        PLHSpace(8),
        PLTextWidget(
          title: value,
          textColor: PLColors.appPrimaryText,
          fontWeight: FontWeight.w700,
          textSize: PLTypography.fontLabelLarge,
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
