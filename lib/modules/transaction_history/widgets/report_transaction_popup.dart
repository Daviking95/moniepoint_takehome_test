part of 'package:nova/modules/transaction_history/exports.dart';

class ReportTransactionPopup extends StatelessWidget {
  const ReportTransactionPopup({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(24),
          NovaImageSvg(svgPath: NovaAssets.infoIconRed, width: 40.w, height: 40.h,),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'Do you wish to report this transaction?',
            textSize: NovaTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: NovaColors.appGrayText,
          ),
          NovaVSpace(24),
          Row(
            children: [
              Expanded(
                child: PLButtonOutline(
                  borderColor: NovaColors.appPrimaryColorMain500,
                  borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                  textTitle: "No cancel",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              NovaHSpace(16),
              Expanded(
                child: NovaButtonRound(
                    textTitle: "Report",
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
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
