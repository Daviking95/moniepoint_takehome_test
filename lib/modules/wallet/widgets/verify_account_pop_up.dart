part of 'package:peerlendly/modules/wallet/exports.dart';

class VerifyAccountPopUp extends StatelessWidget {
  const VerifyAccountPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          const PLImageSvg(svgPath: PLAssets.warningIcon),
          PLVSpace(24),
          PLTextWidget(
            title: 'Oops! \nVerify your account now',
            textSize: PLTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: PLColors.appGrayText,
          ),
          PLVSpace(24),
          PLButtonRound(
              textTitle: "Verify Account",
              functionToRun: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const CompleteAccountScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              })
        ],
      ),
    );
  }
}
