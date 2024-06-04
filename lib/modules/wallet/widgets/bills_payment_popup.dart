part of 'package:nova/modules/wallet/exports.dart';


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
    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          const NovaImageSvg(svgPath: NovaAssets.warningIcon),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'You are about to fund your wallet with',
            textSize: NovaTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: NovaColors.appGrayText,
          ),
          NovaVSpace(4),
          NovaTextWidget(
            title: amount.toString().formatWithCommasAndDecimals(),
            textStyle: NovaTypography.textTitleSmallStyle,
            textSize: NovaTypography.fontBodyMedium,
            fontWeight: FontWeight.w600,
            textColor: NovaColors.appPrimaryText,
            maxLines: 1,
            isCurrency: true,
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
                    textTitle: "Yes pay",
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
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
