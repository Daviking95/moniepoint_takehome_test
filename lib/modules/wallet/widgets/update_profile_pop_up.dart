part of 'package:nova/modules/wallet/exports.dart';


class UpdateProfilePopUp extends StatelessWidget {
  const UpdateProfilePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          const NovaImageSvg(svgPath: NovaAssets.warningIcon),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'Oops! \n You need to update your profile to proceed',
            textSize: NovaTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: NovaColors.appGrayText,
          ),
          NovaVSpace(24),
          NovaButtonRound(
              textTitle: "Update your profile",
              functionToRun: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const EditProfileScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              })
        ],
      ),
    );

  }
}
