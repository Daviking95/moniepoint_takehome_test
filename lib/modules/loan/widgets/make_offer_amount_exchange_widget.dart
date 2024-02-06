part of 'package:peerlendly/modules/loan/exports.dart';

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
    final loanReader = context.read<LoanProvider>();

    return Column(
      children: [
        PLVSpace(16),
        PLTextWidget(
          title: isBorrower ? "Expected Amount to Receive" : "Amount to Pay",
          textColor: PLColors.appGrayText,
          textSize: PLTypography.fontLabelSmall,
        ),
        PLVSpace(8),
        PLTextWidget(
          title: isBorrower ? amountToReceive.toString().formatWithCommasAndDecimals() : amountToPay.toString().formatWithCommasAndDecimals(),
          textStyle: PLTypography.textTitleSmallStyle,
          textSize: PLTypography.fontTitleLarge,
          fontFamily: PLTypography.fontFamilyMedium,
          fontWeight: FontWeight.w700,
          textColor: PLColors.appPrimaryText,
          maxLines: 1,
          isCurrency: true,
        ),
        PLVSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PLImageSvg(svgPath: PLAssets.vectorDown),
            PLHSpace(24),
            const PLImageSvg(svgPath: PLAssets.vectorDown),
          ],
        ),
        PLVSpace(16),
        PLTextWidget(
          title: isBorrower ? "Amount to Pay" : "Expected Amount to Receive",
          textColor: PLColors.appGrayText,
          textSize: PLTypography.fontLabelSmall,
        ),
        PLVSpace(8),
        PLTextWidget(
          title: isBorrower ? amountToPay.toString().formatWithCommasAndDecimals() : amountToReceive.toString().formatWithCommasAndDecimals(),
          textStyle: PLTypography.textTitleSmallStyle,
          textSize: PLTypography.fontTitleLarge,
          fontFamily: PLTypography.fontFamilyMedium,
          fontWeight: FontWeight.w700,
          textColor: PLColors.appPrimaryText,
          maxLines: 1,
          isCurrency: true,
        ),
        PLVSpace(32),
        PLButtonRound(
          textTitle: strNext,
          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
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
