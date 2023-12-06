part of 'package:peerlendly/modules/loan/exports.dart';

class MakeOfferAmountExchangeWidget extends StatelessWidget {
  const MakeOfferAmountExchangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();
    final loanReader = context.read<LoanProvider>();

    return Column(
      children: [
        PLVSpace(16),
        PLTextWidget(
          title: "Amount to Pay",
          textColor: PLColors.appGrayText,
          textSize: PLTypography.fontLabelSmall,
        ),
        PLVSpace(8),
        PLTextWidget(
          title: 750000
              .toString()
              .formatWithCommasAndDecimals(),
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
          title: "Expected Amount to Receive",
          textColor: PLColors.appGrayText,
          textSize: PLTypography.fontLabelSmall,
        ),
        PLVSpace(8),
        PLTextWidget(
          title: 900000
              .toString()
              .formatWithCommasAndDecimals(),
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
              callBackFunc: () {
                loanWatcher.processMakingOffer(context);
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
