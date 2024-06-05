part of 'package:nova/modules/home/exports.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NovaTextWidget(
                title: "Welcome",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appWhiteColor.withOpacity(.6),
                textSize: NovaTypography.fontBodyMedium,
              ),
              NovaTextWidget(
                title: "Olaoluwa",
                textStyle: NovaTypography.textTitleLargeStyle,
                textColor: NovaColors.appWhiteColor,
                textSize: NovaTypography.fontHeadlineSmall,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // PersistentNavBarNavigator.pushNewScreen(
              //   context,
              //   screen: const ProfileScreen(),
              //   withNavBar: false,
              //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
              // );
            },
            child: ProfileImageWidget(imageFile: AppData.profilePicture, size: 40, fallBackImage: NovaAssets.defaultProfile,),
          )
        ],
      );
  }
}
