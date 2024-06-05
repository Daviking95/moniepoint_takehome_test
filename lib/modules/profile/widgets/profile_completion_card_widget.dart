part of 'package:nova/modules/profile/exports.dart';

class ProfileCompletionCardWidget extends StatelessWidget {
  const ProfileCompletionCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // PersistentNavBarNavigator.pushNewScreen(
        //   context,
        //   screen: const CompleteAccountScreen(),
        //   withNavBar: false,
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: NovaDecorations.borderRadiusGeometryCircular4,
            color: Color(0xffF7F7F7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                NovaImageSvg(
                  svgPath: NovaAssets.upgradeIcon,
                  width: 14.w,
                  height: 17.h,
                ),
                NovaHSpace(6),
                NovaTextWidget(
                  title: "Upgrade your KYC to earn more access",
                  textSize: NovaTypography.fontBodyMedium,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                child: NovaImageSvg(
                  svgPath: NovaAssets.arrorRight,
                  width: 12.w,
                  height: 12.h,
                ))
          ],
        ).paddingSymmetric(horizontal: 8, vertical: 8),
      ),
    );
  }
}
