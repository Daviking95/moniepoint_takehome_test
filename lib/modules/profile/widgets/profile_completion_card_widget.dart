part of 'package:nova/modules/profile/exports.dart';

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
            borderRadius: NovaDecorations.borderRadiusGeometryCircular16,
            color: NovaColors.appWhiteColor),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  color: NovaColors.appWhiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaTextWidget(
                        title: "Profile Completion",
                        textSize: NovaTypography.fontBodyMedium,
                        fontWeight: FontWeight.w600,
                      ),
                      NovaVSpace(2),
                      NovaTextWidget(
                        title:
                            "You need to complete \nyour profile to unlock all our features",
                        textSize: NovaTypography.fontLabelSmall,
                      ),
                      NovaVSpace(4),
                      NovaTextWidget(
                        title: "70%",
                        textSize: NovaTypography.fontHeadlineSmall,
                        fontWeight: FontWeight.w600,
                      ),
                      NovaVSpace(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NovaTextWidget(
                            title:
                            "Complete Verification",
                            textSize: NovaTypography.fontLabelSmall,
                            textColor: NovaColors.appPrimaryColorMain500,
                          ),
                          NovaHSpace(4),
                          const Icon(Icons.arrow_forward, color: NovaColors.appPrimaryColorMain500, size: 13,)
                        ],
                      ),
                    ],
                  )).paddingSymmetric(horizontal: 16),
            ),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                child: NovaImagePng(
                  imgPath: NovaAssets.profileCardIcon,
                  width: 118.w,
                  height: 132.h,
                ))
          ],
        ),
      ),
    );
  }
}
