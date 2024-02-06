part of 'package:peerlendly/modules/wallet/exports.dart';

class WalletCardWidget extends StatelessWidget {
  const WalletCardWidget({Key? key}) : super(key: key);

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
                    title: strAccountBalance,
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
              if(AppPreferences.isUserBvnVerified)
              GestureDetector(
                onTap: () {
                  showAlertDialog(context, "", const LendlyScoreSnippet(), context.theme.scaffoldBackgroundColor);

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PLTextWidget(
                      title: "Lendly Score",
                      textStyle: PLTypography.textBodySmallStyle,
                      textSize: PLTypography.fontLabelSmall,
                      textColor: PLColors.appWhiteColor,
                      maxLines: 1,
                    ),
                    PLVSpace(4),
                    LendlyScoreCard(
                      score:
                      AppData.lendlyScoreResponseModel?.lendlyScore ?? 0,
                    ),
                  ],
                ),
              )
            ],
          ),
          PLVSpace(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PLTextWidget(
                title: AppPreferences.isUserBvnVerified ? "08011882288" : "xxxxxxxxxx",
                textStyle: PLTypography.textTitleSmallStyle,
                textSize: PLTypography.fontBodySmall,
                textColor: PLColors.appWhiteColor,
                maxLines: 1,
              ),
              PLHSpace(4),
              PLTextWidget(
                title: "-",
                textStyle: PLTypography.textBodySmallStyle,
                textSize: PLTypography.fontBodySmall,
                textColor: PLColors.appWhiteColor,
                maxLines: 1,
              ),
              PLHSpace(4),
              PLTextWidget(
                title: "Stanbic IBTC",
                textStyle: PLTypography.textBodySmallStyle,
                textSize: PLTypography.fontBodySmall,
                textColor: PLColors.appWhiteColor,
                maxLines: 1,
              ),
              PLHSpace(10),
              GestureDetector(
                  onTap: () {
                    copyAccountNumber("07011992288");
                  },
                  child: const PLImageSvg(svgPath: PLAssets.copyWhite))
            ],
          )
        ],
      ).paddingSymmetric(vertical: 24, horizontal: 16),
    );
  }
}
