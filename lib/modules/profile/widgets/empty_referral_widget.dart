part of 'package:peerlendly/modules/profile/exports.dart';

class EmptyReferralWidget extends StatelessWidget {
  const EmptyReferralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 170.w,
        child: Column(
          children: [
            const PLImageSvg(svgPath: PLAssets.noReferral),
            PLVSpace(16),
            PLTextWidget(
              title: "You have no \npending referrals",
              textColor: PLColors.appPrimaryText,
              textStyle: PLTypography.textHeadlineMediumStyle,
              textSize: PLTypography.fontDesc20,
              fontFamily: PLTypography.fontFamilyBold,
              textAlign: TextAlign.center,
            ),
            PLVSpace(4),
            PLTextWidget(
              title: "Invite your friends and earn gifts",
              textColor: PLColors.appPrimaryText,
              textStyle: PLTypography.textHeadlineMediumStyle,
              textSize: PLTypography.fontLabelMedium,
              textAlign: TextAlign.center,
            ),
            PLVSpace(16),

          ],
        ),
      ),
    );
  }
}
