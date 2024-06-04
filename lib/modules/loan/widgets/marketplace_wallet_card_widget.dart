part of 'package:nova/modules/loan/exports.dart';

class MarketplaceWalletCardWidget extends StatelessWidget {
  final int selectedIndex;

  const MarketplaceWalletCardWidget({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletWatcher = context.watch<WalletProvider>();

    return Container(
      decoration: BoxDecoration(
        color: NovaColors.appPrimaryColorMain500,
        image: const DecorationImage(
            image: AssetImage(NovaAssets.walletCardBg),
            alignment: Alignment.topLeft,
            fit: BoxFit.contain),
        borderRadius: NovaDecorations.borderRadiusGeometryCircular20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NovaTextWidget(
                    title: selectedIndex == 0
                        ? "Current Balance"
                        : "Investment Balance",
                    textStyle: NovaTypography.textBodySmallStyle,
                    textSize: NovaTypography.fontBodySmall,
                    textColor: NovaColors.appWhiteColor,
                    maxLines: 1,
                  ),
                  NovaVSpace(8),
                  Row(
                    children: [
                      NovaTextWidget(
                        title: 4000000
                            .toString()
                            .formatWithCommasAndDecimals()
                            .hideOrShowBalance(context),
                        textStyle: NovaTypography.textTitleSmallStyle,
                        textSize: NovaTypography.fontTitleLarge,
                        fontFamily: NovaTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w700,
                        textColor: NovaColors.appWhiteColor,
                        maxLines: 1,
                        isCurrency: true,
                      ),
                      NovaHSpace(10),
                      GestureDetector(
                          onTap: () async {
                            walletWatcher.toggleShowBalance();
                          },
                          child:
                              const NovaImageSvg(svgPath: NovaAssets.showBalance)),
                    ],
                  ),
                ],
              ),
              NovaImagePng(
                imgPath: NovaAssets.marketplaceCardIcon,
                width: 80.w,
                height: 50.h,
              )
            ],
          ),
          NovaVSpace(16),
          InkWell(
            onTap: () {
              AppNavigator.push(const MarketplaceLoanList());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NovaTextWidget(
                  title: "Go to marketplace",
                  textStyle: NovaTypography.textTitleSmallStyle,
                  textSize: NovaTypography.fontBodySmall,
                  fontWeight: FontWeight.w600,
                  textColor: NovaColors.appWhiteColor,
                  maxLines: 1,
                ),
                NovaHSpace(10),
                const NovaImageSvg(svgPath: NovaAssets.arrorRight)
              ],
            ),
          )
        ],
      ).paddingSymmetric(vertical: 24, horizontal: 16),
    );
  }
}
