part of 'package:nova/modules/wallet/exports.dart';

class WalletCardWidget extends StatelessWidget {
  const WalletCardWidget({Key? key}) : super(key: key);

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
                    title: strAccountBalance,
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
                          child: const NovaImageSvg(svgPath: NovaAssets.showBalance)),
                    ],
                  ),
                ],
              ),
              if(AppPreferences.isUserBvnVerified)
              GestureDetector(
                onTap: () {
                  showAlertDialog(context, "", const LendlyScoreSnippet(), context.theme.scaffoldBackgroundColor);

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    NovaTextWidget(
                      title: "Lendly Score",
                      textStyle: NovaTypography.textBodySmallStyle,
                      textSize: NovaTypography.fontLabelSmall,
                      textColor: NovaColors.appWhiteColor,
                      maxLines: 1,
                    ),
                    NovaVSpace(4),
                    LendlyScoreCard(
                      score:
                      AppData.lendlyScoreResponseModel?.lendlyScore ?? 0,
                    ),
                  ],
                ),
              )
            ],
          ),
          NovaVSpace(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NovaTextWidget(
                title: AppPreferences.isUserBvnVerified ? "08011882288" : "xxxxxxxxxx",
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
      ).paddingSymmetric(vertical: 24, horizontal: 16),
    );
  }
}
