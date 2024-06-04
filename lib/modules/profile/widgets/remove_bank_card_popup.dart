part of 'package:nova/modules/profile/exports.dart';


class RemoveBankCardPopup extends StatelessWidget {
  final String id;
  final bool isCard;
  const RemoveBankCardPopup({Key? key, required this.id, this.isCard = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          NovaImageSvg(
            svgPath: NovaAssets.infoIconRed,
            width: 50.w,
            height: 50.h,
          ),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'Do you wish to delete this "${isCard ? 'card' : 'bank'}"?',
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
                  textTitle: "No, cancel",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              NovaHSpace(16),
              Expanded(
                child: NovaButtonRound(
                    textTitle: "Delete",
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                    bgColor: NovaColors.appErrorColor,
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
