part of 'package:nova/modules/wallet/exports.dart';

class ExistingLoanPopUp extends StatelessWidget {
  const ExistingLoanPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          const NovaImageSvg(svgPath: NovaAssets.warningIcon),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'Oops! \n You currently have an existing loan',
            textSize: NovaTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: NovaColors.appGrayText,
          ),
          NovaVSpace(24),
          NovaButtonRound(
              textTitle: "Okay",
              functionToRun: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
