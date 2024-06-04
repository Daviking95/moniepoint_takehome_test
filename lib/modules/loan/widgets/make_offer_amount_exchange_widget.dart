part of 'package:nova/modules/loan/exports.dart';

class MakeOfferAmountExchangeWidget extends StatelessWidget {
  final double amountToPay;
  final double amountToReceive;

  final bool isBorrower;
  final Function() callBack;

  const MakeOfferAmountExchangeWidget(
      {Key? key,
      required this.amountToPay,
      required this.amountToReceive, this.isBorrower = false,
      required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();

    return Column(
      children: [
        NovaVSpace(16),
        NovaTextWidget(
          title: isBorrower ? "Expected Amount to Receive" : "Amount to Pay",
          textColor: NovaColors.appGrayText,
          textSize: NovaTypography.fontLabelSmall,
        ),
        NovaVSpace(8),
        NovaTextWidget(
          title: isBorrower ? amountToReceive.toString().formatWithCommasAndDecimals() : amountToPay.toString().formatWithCommasAndDecimals(),
          textStyle: NovaTypography.textTitleSmallStyle,
          textSize: NovaTypography.fontTitleLarge,
          fontFamily: NovaTypography.fontFamilyMedium,
          fontWeight: FontWeight.w700,
          textColor: NovaColors.appPrimaryText,
          maxLines: 1,
          isCurrency: true,
        ),
        NovaVSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NovaImageSvg(svgPath: NovaAssets.vectorDown),
            NovaHSpace(24),
            const NovaImageSvg(svgPath: NovaAssets.vectorDown),
          ],
        ),
        NovaVSpace(16),
        NovaTextWidget(
          title: isBorrower ? "Amount to Pay" : "Expected Amount to Receive",
          textColor: NovaColors.appGrayText,
          textSize: NovaTypography.fontLabelSmall,
        ),
        NovaVSpace(8),
        NovaTextWidget(
          title: isBorrower ? amountToPay.toString().formatWithCommasAndDecimals() : amountToReceive.toString().formatWithCommasAndDecimals(),
          textStyle: NovaTypography.textTitleSmallStyle,
          textSize: NovaTypography.fontTitleLarge,
          fontFamily: NovaTypography.fontFamilyMedium,
          fontWeight: FontWeight.w700,
          textColor: NovaColors.appPrimaryText,
          maxLines: 1,
          isCurrency: true,
        ),
        NovaVSpace(32),
        NovaButtonRound(
          textTitle: strNext,
          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
          functionToRun: () {
            Navigator.pop(context);

            modalBottomSheet(
                context,
                TransferPinActivationWidget(
                  prevContext: context,
                  callBackFunc: (value) {
                    loanWatcher.verifyPin(context, value, () {
                      callBack();
                    });
                  },
                ),
                true,
                context.height / 1.5);
          },
        ).paddingSymmetric(horizontal: 16)
      ],
    );
  }
}
