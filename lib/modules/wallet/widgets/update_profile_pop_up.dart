part of 'package:peerlendly/modules/wallet/exports.dart';


class UpdateProfilePopUp extends StatelessWidget {
  const UpdateProfilePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          const PLImageSvg(svgPath: PLAssets.warningIcon),
          PLVSpace(24),
          PLTextWidget(
            title: 'Oops! \n You need to update your profile to proceed',
            textSize: PLTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: PLColors.appGrayText,
          ),
          PLVSpace(24),
          PLButtonRound(
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
