part of 'package:nova/modules/profile/exports.dart';

class EmptyReferralWidget extends StatelessWidget {
  const EmptyReferralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 170.w,
        child: Column(
          children: [
            const NovaImageSvg(svgPath: NovaAssets.noReferral),
            NovaVSpace(16),
            NovaTextWidget(
              title: "You have no \npending referrals",
              textColor: NovaColors.appPrimaryText,
              textStyle: NovaTypography.textHeadlineMediumStyle,
              textSize: NovaTypography.fontDesc20,
              fontFamily: NovaTypography.fontFamilyBold,
              textAlign: TextAlign.center,
            ),
            NovaVSpace(4),
            NovaTextWidget(
              title: "Invite your friends and earn gifts",
              textColor: NovaColors.appPrimaryText,
              textStyle: NovaTypography.textHeadlineMediumStyle,
              textSize: NovaTypography.fontLabelMedium,
              textAlign: TextAlign.center,
            ),
            NovaVSpace(16),

          ],
        ),
      ),
    );
  }
}
