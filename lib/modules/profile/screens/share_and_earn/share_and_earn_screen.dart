part of 'package:nova/modules/profile/exports.dart';


class ShareAndEarnScreen extends StatelessWidget {
  const ShareAndEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String referralCode = "https://nova.com/${AppData.getUserProfileResponseModel?.referralCode ?? ''}";

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(48),
                    NovaBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    NovaVSpace(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const NovaImageSvg(svgPath: NovaAssets.shareIcon),
                        NovaVSpace(8),
                        NovaTextWidget(
                          title: "Share and Earn",
                          isTitle: true,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontHeadlineSmall,
                        ),
                        NovaVSpace(4),
                        NovaTextWidget(
                          title: "Invite your friends and earn gifts",
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontLabelSmall,
                        ),
                      ],
                    ),
                    NovaVSpace(24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: NovaTextWidget(
                        title: "Referral Link",
                        textColor: NovaColors.appPrimaryText,
                        textStyle: NovaTypography.textHeadlineMediumStyle,
                        textSize: NovaTypography.fontLabelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    NovaVSpace(8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: NovaColors.appWhiteColor,
                              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                              border: Border.all(color: Color(0xffe4e4e4))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: NovaTextWidget(
                                    title: referralCode,
                                    textColor: NovaColors.appPrimaryColorMain500,
                                    textSize: NovaTypography.fontLabelMedium,
                                  ),
                                ),
                                NovaImageSvg(svgPath: NovaAssets.copyBlue)
                              ],
                            ).paddingSymmetric(horizontal: 20, vertical: 16),
                          ),
                        ),
                        NovaHSpace(8),
                        InkWell(
                          onTap: () {
                            Share.share(referralCode, subject: 'My nova referral link');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: NovaDecorations
                                    .borderRadiusGeometryCircular8,
                                color: NovaColors.appPrimaryColorMain500),
                            child: NovaTextWidget(
                              title: "Share",
                              textColor: NovaColors.appWhiteColor,
                              textSize: NovaTypography.fontLabelSmall,
                            ).paddingSymmetric(horizontal: 20, vertical: 16),
                          ),
                        )
                      ],
                    ),
                    NovaVSpace(24),
                    Container(
                      width: context.width,
                      decoration: BoxDecoration(
                          borderRadius: NovaDecorations
                              .borderRadiusGeometryCircular16,
                          color: NovaColors.appWhiteColor),
                      child: Column(
                        children: [
                          NovaVSpace(16),

                          NovaTextWidget(
                            title: "How to Earn",
                            textColor: NovaColors.appPrimaryText,
                            textSize: NovaTypography.fontBodyLarge,
                            fontWeight: FontWeight.w700,
                          ),
                          NovaVSpace(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _refWidget("Share your referral link", NovaAssets.refShare),
                              _refWidget("", NovaAssets.refArrow),
                              _refWidget("Friends sign in with your referral link", NovaAssets.refSign),
                              _refWidget("", NovaAssets.refArrow),
                              _refWidget("Friends complete their first transaction", NovaAssets.refComplete),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 12, vertical: 8),
                    ),
                    NovaVSpace(24),
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
          NovaImageSvg(svgPath: assetString),
          NovaVSpace(16),
          NovaTextWidget(
            title: title,
            textColor: NovaColors.appGrayText,
            textStyle: NovaTypography.textHeadlineMediumStyle,
            textSize: NovaTypography.fontLabelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
