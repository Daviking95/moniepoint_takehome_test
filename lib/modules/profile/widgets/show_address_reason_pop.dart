part of 'package:nova/modules/profile/exports.dart';

class ShowAddressReasonPop extends StatelessWidget {
  const ShowAddressReasonPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          NovaTextWidget(
            title: "Address Verification is not mandatory on Nova. However, if you want to borrow or lend above ₦5,000, your address must be verified and this comes at a cost. This is an independent service and you will be charged ₦1,500 for this.",
            textStyle: NovaTypography.textTitleSmallStyle,
            textSize: NovaTypography.fontBodyMedium,
            fontWeight: FontWeight.w600,
            textColor: NovaColors.appPrimaryText,
            maxLines: 1,
            isCurrency: true,
          ),
          NovaVSpace(24),
          Container(
            decoration: BoxDecoration(
                borderRadius:
                NovaDecorations.borderRadiusGeometryCircular8,
                color: NovaColors.appPrimaryColorMain500
                    .withOpacity(.05)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NovaImageSvg(svgPath: NovaAssets.infoIcon),
                NovaHSpace(8),
                Expanded(
                  child: NovaTextWidget(
                    title: 'We use PayStack. PayStack charges 1.5% + N100, up to N2,000 for every transaction.',
                    textStyle: NovaTypography.textTitleLargeStyle,
                    textColor: NovaColors.appGrayText,
                    textSize: NovaTypography.fontLabelSmall,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
          ),
          NovaVSpace(24),
          NovaButtonRound(
              textTitle: "Yes fund",
              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
              functionToRun: () {
                Navigator.pop(context);

              })
        ],
      ),
    );
  }
}
