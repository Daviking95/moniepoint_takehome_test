part of 'package:nova/modules/wallet/exports.dart';


class WalletAccountDetailsWidget extends StatelessWidget {
  const WalletAccountDetailsWidget({Key? key}) : super(key: key);

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(8),
                    NovaBackIcon(
                      onTap: () => Navigator.pop(context),
                      isBtmNavWithNoTitle: true,
                    ),
                    NovaVSpace(16),
                    NovaTextWidget(
                      title: "Wallet Account Number",
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontWeight: FontWeight.w700,
                    ),
                    NovaVSpace(10),
                    NovaTextWidget(
                      title: "This is your wallet account number, use it to credit your wallet and start borrowing or lending.",
                      textColor: NovaColors.appGrayText,
                      textSize: NovaTypography.fontLabelMedium,
                    ),
                    NovaVSpace(10),
                    NovaTextWidget(
                      title: "Your Nova Account",
                      textColor: NovaColors.appGrayText,
                      textSize: NovaTypography.fontLabelMedium,
                      fontWeight: FontWeight.w600,
                    ),
                    NovaVSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _accountDetails()),
                        NovaHSpace(8),
                        Container(
                          height: 83.h,
                          decoration: BoxDecoration(
                            color: NovaColors.appPrimaryColorMain500,
                            borderRadius: NovaDecorations.borderRadiusGeometryCircular8
                          ),
                          child: Center(
                            child: NovaTextWidget(
                              title: "Share",
                              textColor: NovaColors.appWhiteColor,
                              textSize: NovaTypography.fontLabelMedium,
                            ).paddingAll(20),
                          ),
                        )
                      ],
                    ),
                    NovaVSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: _ctaForWallet("Fund Wallet", NovaAssets.notiWalletFunded, () {
                              AppNavigator.push(const FundWalletScreen());
                            }),
                        ),
                        NovaHSpace(16),
                        Expanded(
                          child: _ctaForWallet("Withdraw", NovaAssets.notiWalletWithdraw, () {
                            AppNavigator.push(WithdrawWalletAmountScreen());

                          }),
                        )
                      ],
                    ),
                    NovaVSpace(24),
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
        borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
        color: NovaColors.appGrayText.withOpacity(.07)
      ),
      child: Column(
        children: [
          _accountItem("Bank Name:", "Stingyx Bank"),
          Row(
            children: [
              _accountItem("Account Number", "1234567899"),
              NovaHSpace(10),
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

  _ctaForWallet(String title, String assetString, Function() func) {
    return InkWell(
      onTap: () {
        func();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: NovaDecorations.borderRadiusGeometryCircular16,
            boxShadow: [NovaDecorations.customShadow],
            color: NovaColors.appWhiteColor),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffEEF4FC),
              child: assetString.endsWith(".svg")
                  ? NovaImageSvg(svgPath: assetString)
                  : NovaImagePng(
                imgPath: assetString,
                width: 24.w,
                height: 24.h,
              ),
            ),
            NovaHSpace(8),
            NovaTextWidget(
              title: title,
              textSize: NovaTypography.fontBodySmall,
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
