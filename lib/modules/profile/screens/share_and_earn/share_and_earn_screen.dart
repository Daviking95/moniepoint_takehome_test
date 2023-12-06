part of 'package:peerlendly/modules/profile/exports.dart';


class ShareAndEarnScreen extends StatelessWidget {
  const ShareAndEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(48),
                    PLBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    PLVSpace(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const PLImageSvg(svgPath: PLAssets.shareIcon),
                        PLVSpace(8),
                        PLTextWidget(
                          title: "Share and Earn",
                          isTitle: true,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontHeadlineSmall,
                        ),
                        PLVSpace(4),
                        PLTextWidget(
                          title: "Invite your friends and earn gifts",
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontLabelSmall,
                        ),
                      ],
                    ),
                    PLVSpace(24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: PLTextWidget(
                        title: "Referral Link",
                        textColor: PLColors.appPrimaryText,
                        textStyle: PLTypography.textHeadlineMediumStyle,
                        textSize: PLTypography.fontLabelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    PLVSpace(8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: PLColors.appWhiteColor,
                              borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                              border: Border.all(color: Color(0xffe4e4e4))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: PLTextWidget(
                                    title: "https://peerlendly.com/${UserData.getUserProfileResponseModel?.referralCode ?? ''}",
                                    textColor: PLColors.appPrimaryColorMain500,
                                    textSize: PLTypography.fontLabelMedium,
                                  ),
                                ),
                                PLImageSvg(svgPath: PLAssets.copyBlue)
                              ],
                            ).paddingSymmetric(horizontal: 20, vertical: 16),
                          ),
                        ),
                        PLHSpace(8),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: PLDecorations
                                    .borderRadiusGeometryCircular8,
                                color: PLColors.appPrimaryColorMain500),
                            child: PLTextWidget(
                              title: "Share",
                              textColor: PLColors.appWhiteColor,
                              textSize: PLTypography.fontLabelSmall,
                            ).paddingSymmetric(horizontal: 20, vertical: 16),
                          ),
                        )
                      ],
                    ),
                    PLVSpace(24),
                    Container(
                      width: context.width,
                      decoration: BoxDecoration(
                          borderRadius: PLDecorations
                              .borderRadiusGeometryCircular16,
                          color: PLColors.appWhiteColor),
                      child: Column(
                        children: [
                          PLVSpace(16),

                          PLTextWidget(
                            title: "How to Earn",
                            textColor: PLColors.appPrimaryText,
                            textSize: PLTypography.fontBodyLarge,
                            fontWeight: FontWeight.w700,
                          ),
                          PLVSpace(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _refWidget("Share your referral link", PLAssets.refShare),
                              _refWidget("", PLAssets.refArrow),
                              _refWidget("Friends sign in with your referral link", PLAssets.refSign),
                              _refWidget("", PLAssets.refArrow),
                              _refWidget("Friends complete their first transaction", PLAssets.refComplete),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 12, vertical: 8),
                    ),
                    PLVSpace(24),
                    Expanded(
                      child: CustomTabRounded(
                        tabTitleStringList: ['Pending', 'Complete'],
                        tabWidgetsList: [EmptyReferralWidget(), ReferralList()],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  _refWidget(String title, String assetString) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PLImageSvg(svgPath: assetString),
          PLVSpace(16),
          PLTextWidget(
            title: title,
            textColor: PLColors.appGrayText,
            textStyle: PLTypography.textHeadlineMediumStyle,
            textSize: PLTypography.fontLabelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
