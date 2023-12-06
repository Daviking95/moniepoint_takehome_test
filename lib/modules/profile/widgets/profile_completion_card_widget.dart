part of 'package:peerlendly/modules/profile/exports.dart';

class ProfileCompletionCardWidget extends StatelessWidget {
  const ProfileCompletionCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const CompleteAccountScreen(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: PLDecorations.borderRadiusGeometryCircular16,
            color: PLColors.appWhiteColor),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  color: PLColors.appWhiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLTextWidget(
                        title: "Profile Completion",
                        textSize: PLTypography.fontBodyMedium,
                        fontWeight: FontWeight.w600,
                      ),
                      PLVSpace(2),
                      PLTextWidget(
                        title:
                            "You need to complete \nyour profile to unlock all our features",
                        textSize: PLTypography.fontLabelSmall,
                      ),
                      PLVSpace(4),
                      PLTextWidget(
                        title: "70%",
                        textSize: PLTypography.fontHeadlineSmall,
                        fontWeight: FontWeight.w600,
                      ),
                      PLVSpace(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PLTextWidget(
                            title:
                            "Complete Verification",
                            textSize: PLTypography.fontLabelSmall,
                            textColor: PLColors.appPrimaryColorMain500,
                          ),
                          PLHSpace(4),
                          const Icon(Icons.arrow_forward, color: PLColors.appPrimaryColorMain500, size: 13,)
                        ],
                      ),
                    ],
                  )).paddingSymmetric(horizontal: 16),
            ),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                child: PLImagePng(
                  imgPath: PLAssets.profileCardIcon,
                  width: 118.w,
                  height: 132.h,
                ))
          ],
        ),
      ),
    );
  }
}
