part of 'package:peerlendly/modules/wallet/exports.dart';

class ExistingLoanPopUp extends StatelessWidget {
  const ExistingLoanPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          const PLImageSvg(svgPath: PLAssets.warningIcon),
          PLVSpace(24),
          PLTextWidget(
            title: 'Oops! \n You currently have an existing loan',
            textSize: PLTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: PLColors.appGrayText,
          ),
          PLVSpace(24),
          PLButtonRound(
              textTitle: "Okay",
              functionToRun: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
