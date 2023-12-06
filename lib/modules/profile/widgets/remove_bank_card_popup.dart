part of 'package:peerlendly/modules/profile/exports.dart';


class RemoveBankCardPopup extends StatelessWidget {
  final String id;
  final bool isCard;
  const RemoveBankCardPopup({Key? key, required this.id, this.isCard = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          PLImageSvg(
            svgPath: PLAssets.infoIconRed,
            width: 50.w,
            height: 50.h,
          ),
          PLVSpace(24),
          PLTextWidget(
            title: 'Do you wish to delete this "${isCard ? 'card' : 'bank'}"?',
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
                  textTitle: "No, cancel",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              PLHSpace(16),
              Expanded(
                child: PLButtonRound(
                    textTitle: "Delete",
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                    bgColor: PLColors.appErrorColor,
                    functionToRun: () {
                      profileWatcher.removeBankDetails(id, isCard);
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
