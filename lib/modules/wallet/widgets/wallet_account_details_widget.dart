part of 'package:peerlendly/modules/wallet/exports.dart';


class WalletAccountDetailsWidget extends StatelessWidget {
  const WalletAccountDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletWatcher = context.watch<WalletProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          backgroundColor: PLColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(8),
                    PLBackIcon(
                      onTap: () => Navigator.pop(context),
                      isBtmNavWithNoTitle: true,
                    ),
                    PLVSpace(16),
                    PLTextWidget(
                      title: "Wallet Account Number",
                      textStyle: PLTypography.textTitleLargeStyle,
                      textColor: PLColors.appPrimaryText,
                      fontWeight: FontWeight.w700,
                    ),
                    PLVSpace(10),
                    PLTextWidget(
                      title: "This is your wallet account number, use it to credit your wallet and start borrowing or lending.",
                      textColor: PLColors.appGrayText,
                      textSize: PLTypography.fontLabelMedium,
                    ),
                    PLVSpace(10),
                    PLTextWidget(
                      title: "Your Peer Lendly Account",
                      textColor: PLColors.appGrayText,
                      textSize: PLTypography.fontLabelMedium,
                      fontWeight: FontWeight.w600,
                    ),
                    PLVSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _accountDetails()),
                        PLHSpace(8),
                        Container(
                          height: 83.h,
                          decoration: BoxDecoration(
                            color: PLColors.appPrimaryColorMain500,
                            borderRadius: PLDecorations.borderRadiusGeometryCircular8
                          ),
                          child: Center(
                            child: PLTextWidget(
                              title: "Share",
                              textColor: PLColors.appWhiteColor,
                              textSize: PLTypography.fontLabelMedium,
                            ).paddingAll(20),
                          ),
                        )
                      ],
                    ),
                    PLVSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: _ctaForWallet("Fund Wallet", PLAssets.notiWalletFunded, () {
                              AppNavigator.push(const FundWalletScreen());
                            }),
                        ),
                        PLHSpace(16),
                        Expanded(
                          child: _ctaForWallet("Withdraw", PLAssets.notiWalletWithdraw, () {
                            AppNavigator.push(WithdrawWalletAmountScreen());

                          }),
                        )
                      ],
                    ),
                    PLVSpace(24),
                  ],
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
        color: PLColors.appGrayText.withOpacity(.07)
      ),
      child: Column(
        children: [
          _accountItem("Bank Name:", "Stingyx Bank"),
          Row(
            children: [
              _accountItem("Account Number", "1234567899"),
              PLHSpace(10),
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

  _ctaForWallet(String title, String assetString, Function() func) {
    return InkWell(
      onTap: () {
        func();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: PLDecorations.borderRadiusGeometryCircular16,
            boxShadow: [PLDecorations.customShadow],
            color: PLColors.appWhiteColor),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffEEF4FC),
              child: assetString.endsWith(".svg")
                  ? PLImageSvg(svgPath: assetString)
                  : PLImagePng(
                imgPath: assetString,
                width: 24.w,
                height: 24.h,
              ),
            ),
            PLHSpace(8),
            PLTextWidget(
              title: title,
              textSize: PLTypography.fontBodySmall,
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
