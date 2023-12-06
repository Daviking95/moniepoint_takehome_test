part of 'package:peerlendly/modules/home/exports.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: AppPreferences.isUserDocumentVerified ? null : () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const CompleteAccountScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Row(
              children: [
                ProfileImageWidget(imageFile: UserData.profilePicture, size: 40),
                PLHSpace(12),
                PLTextWidget(
                  title: (UserData.getUserProfileResponseModel?.bvnVerified ?? false) ? (UserData.getUserProfileResponseModel?.fullName ?? "") : "Verify Account",
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
            ],
          )
        ],
      );
  }
}
