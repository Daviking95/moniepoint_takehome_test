part of 'package:peerlendly/modules/transaction_history/exports.dart';

class ReportTransactionPopup extends StatelessWidget {
  const ReportTransactionPopup({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(24),
          PLImageSvg(svgPath: PLAssets.infoIconRed, width: 40.w, height: 40.h,),
          PLVSpace(24),
          PLTextWidget(
            title: 'Do you wish to report this transaction?',
            textSize: PLTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: PLColors.appGrayText,
          ),
          PLVSpace(24),
          Row(
            children: [
              Expanded(
                child: PLButtonOutline(
                  borderColor: PLColors.appPrimaryColorMain500,
                  borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                  textTitle: "No cancel",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              PLHSpace(16),
              Expanded(
                child: PLButtonRound(
                    textTitle: "Report",
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                    functionToRun: () {
                      Navigator.pop(context);

                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
