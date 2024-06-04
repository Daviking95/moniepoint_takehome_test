part of 'package:nova/modules/wallet/exports.dart';

class VerifyAccountPopUp extends StatelessWidget {
  const VerifyAccountPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          const NovaImageSvg(svgPath: NovaAssets.warningIcon),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'Oops! \nVerify your account now',
            textSize: NovaTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: NovaColors.appGrayText,
          ),
          NovaVSpace(24),
          NovaButtonRound(
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
