part of 'package:nova/modules/wallet/exports.dart';

class WalletCardWidget extends StatelessWidget {
  const WalletCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletWatcher = context.watch<WalletProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NovaTextWidget(
          title: "Total Balance",
          textStyle: NovaTypography.textBodySmallStyle,
          textSize: NovaTypography.fontBodyMedium,
          textColor: NovaColors.appWhiteColor,
          maxLines: 1,
        ),
        NovaVSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NovaTextWidget(
              title: 7454434
                  .toString()
                  .formatWithCommasAndDecimals()
                  .hideOrShowBalance(context),
              textStyle: NovaTypography.textBodyMediumStyleBold,
              textSize: NovaTypography.fontHeadlineLarge,
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
                child: const NovaImageSvg(
                  svgPath: NovaAssets.showBalanceWhite,
                )),
          ],
        ),
        NovaVSpace(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NovaTextWidget(
              title: "08011882288",
              textStyle: NovaTypography.textTitleSmallStyle,
              textSize: NovaTypography.fontBodySmall,
              textColor: NovaColors.appWhiteColor.withOpacity(.7),
              maxLines: 1,
            ),
            NovaHSpace(10),
            GestureDetector(
                onTap: () {
                  copyAccountNumber("07011992288");
                },
                child: const NovaImageSvg(svgPath: NovaAssets.copyWhite))
          ],
        ),
        NovaVSpace(16),
        Container(
          decoration: BoxDecoration(
            color: NovaColors.appWhiteColor.withOpacity(.3),
              borderRadius: NovaDecorations.borderRadiusGeometryCircular16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NovaTextWidget(
                title: "Savings Account",
                textStyle: NovaTypography.textTitleSmallStyle,
                textSize: NovaTypography.fontBodySmall,
                textColor: NovaColors.appWhiteColor,
                fontFamily: NovaTypography.fontFamilyMedium,
                maxLines: 1,
              ),
              NovaHSpace(4),
              Icon(
                Icons.arrow_drop_down_outlined,
                color: NovaColors.appWhiteColor,
                size: 15,
              )
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 8),
        ),
        NovaVSpace(32),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NovaVSpace(16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NovaTextWidget(
              title: AppPreferences.isUserBvnVerified
                  ? "08011882288"
                  : "xxxxxxxxxx",
              textStyle: NovaTypography.textTitleSmallStyle,
              textSize: NovaTypography.fontBodySmall,
              textColor: NovaColors.appWhiteColor,
              maxLines: 1,
            ),
            NovaHSpace(4),
            NovaTextWidget(
              title: "-",
              textStyle: NovaTypography.textBodySmallStyle,
              textSize: NovaTypography.fontBodySmall,
              textColor: NovaColors.appWhiteColor,
              maxLines: 1,
            ),
            NovaHSpace(4),
            NovaTextWidget(
              title: "Stanbic IBTC",
              textStyle: NovaTypography.textBodySmallStyle,
              textSize: NovaTypography.fontBodySmall,
              textColor: NovaColors.appWhiteColor,
              maxLines: 1,
            ),
            NovaHSpace(10),
            GestureDetector(
                onTap: () {
                  copyAccountNumber("07011992288");
                },
                child: const NovaImageSvg(svgPath: NovaAssets.copyWhite))
          ],
        )
      ],
    ).paddingSymmetric(vertical: 24, horizontal: 16);
  }
}
