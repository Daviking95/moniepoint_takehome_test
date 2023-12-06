part of 'package:peerlendly/modules/wallet/exports.dart';


class BillsPaymentPopup extends StatelessWidget {
  final double amount;
  final Function() callback;

  const BillsPaymentPopup({
    Key? key,
    required this.amount,
    required this.callback,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          const PLImageSvg(svgPath: PLAssets.warningIcon),
          PLVSpace(24),
          PLTextWidget(
            title: 'You are about to fund your wallet with',
            textSize: PLTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: PLColors.appGrayText,
          ),
          PLVSpace(4),
          PLTextWidget(
            title: amount.toString().formatWithCommasAndDecimals(),
            textStyle: PLTypography.textTitleSmallStyle,
            textSize: PLTypography.fontBodyMedium,
            fontWeight: FontWeight.w600,
            textColor: PLColors.appPrimaryText,
            maxLines: 1,
            isCurrency: true,
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
                    textTitle: "Yes pay",
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                    functionToRun: () {
                      Navigator.pop(context);

                      callback();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
