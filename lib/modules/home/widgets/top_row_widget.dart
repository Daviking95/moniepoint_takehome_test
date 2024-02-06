part of 'package:peerlendly/modules/home/exports.dart';

class TopRowWidget extends StatelessWidget {
  final Function() dashboardRefreshCallback;
  const TopRowWidget({Key? key, required this.dashboardRefreshCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: (AppData.getUserProfileResponseModel?.bvnVerified ?? false) ? const ProfileScreen() : const CompleteAccountScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Row(
              children: [
                ProfileImageWidget(imageFile: AppData.profilePicture, size: 40),
                PLHSpace(12),
                PLTextWidget(
                  title: (AppData.getUserProfileResponseModel?.bvnVerified ?? false) ? (AppData.getUserProfileResponseModel?.fullName.toTitleCase ?? "") : "Verify Account",
                  textStyle: PLTypography.textTitleLargeStyle,
                  textColor: PLColors.appPrimaryColorMain500,
                  textSize: PLTypography.fontTitleMedium,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  modalBottomSheet(
                      context,
                      const NotificationScreen(),
                      true,
                      context.height / 1.3);
                  // showAlertDialog(context, "", const NotificationScreen());
                },
                child: PLImageSvg(svgPath: PLAssets.notificationBell, width: 24.w, height: 24.h,),
              ),
              // PLHSpace(8),
              // InkWell(
              //   onTap: () => dashboardRefreshCallback(),
              //     child: const Icon(Icons.refresh))
            ],
          )
        ],
      );
  }
}
