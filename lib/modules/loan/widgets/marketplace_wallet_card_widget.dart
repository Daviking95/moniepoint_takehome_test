part of 'package:peerlendly/modules/loan/exports.dart';


class MarketplaceWalletCardWidget extends StatelessWidget {
  const MarketplaceWalletCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletWatcher = context.watch<WalletProvider>();

    return Container(
      decoration: BoxDecoration(
        color: PLColors.appPrimaryColorMain500,
        image: const DecorationImage(
            image: AssetImage(PLAssets.walletCardBg),
            alignment: Alignment.topLeft,
            fit: BoxFit.contain),
        borderRadius: PLDecorations.borderRadiusGeometryCircular20,
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
                  PLTextWidget(
                    title: "Current Balance",
                    textStyle: PLTypography.textBodySmallStyle,
                    textSize: PLTypography.fontBodySmall,
                    textColor: PLColors.appWhiteColor,
                    maxLines: 1,
                  ),
                  PLVSpace(8),
                  Row(
                    children: [
                      PLTextWidget(
                        title: 4000000
                            .toString()
                            .formatWithCommasAndDecimals()
                            .hideOrShowBalance(context),
                        textStyle: PLTypography.textTitleSmallStyle,
                        textSize: PLTypography.fontTitleLarge,
                        fontFamily: PLTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w700,
                        textColor: PLColors.appWhiteColor,
                        maxLines: 1,
                        isCurrency: true,
                      ),
                      PLHSpace(10),
                      GestureDetector(
                          onTap: () async {
                            walletWatcher.toggleShowBalance();
                          },
                          child: const PLImageSvg(svgPath: PLAssets.showBalance)),
                    ],
                  ),
                ],
              ),
              PLImagePng(imgPath: PLAssets.marketplaceCardIcon, width: 80.w, height: 50.h,)
            ],
          ),
          PLVSpace(16),
          InkWell(
            onTap: () {
              AppNavigator.push(const MarketplaceLoanList());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PLTextWidget(
                  title: "Go to marketplace",
                  textStyle: PLTypography.textTitleSmallStyle,
                  textSize: PLTypography.fontBodySmall,
                  fontWeight: FontWeight.w600,
                  textColor: PLColors.appWhiteColor,
                  maxLines: 1,
                ),
                PLHSpace(10),
                const PLImageSvg(svgPath: PLAssets.arrorRight)
              ],
            ),
          )
        ],
      ).paddingSymmetric(vertical: 24, horizontal: 16),
    );
  }
}
