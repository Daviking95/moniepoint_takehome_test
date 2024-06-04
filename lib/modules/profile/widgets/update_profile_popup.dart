part of 'package:nova/modules/profile/exports.dart';


class UpdateProfilePopup extends StatelessWidget {
  final BuildContext parentContext;
  final int tabSection;
  final ProfileProvider model;
  const UpdateProfilePopup({Key? key, required this.parentContext, required this.tabSection, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileProvider>();

    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          NovaImageSvg(
            svgPath: NovaAssets.infoIcon,
            width: 50.w,
            height: 50.h,
          ),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'Do you wish to update your profile?',
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
                    textTitle: "Update",
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                    bgColor: NovaColors.appErrorColor,
                    functionToRun: () {
                      Navigator.pop(context);
                      model.updateProfileInfo(parentContext, tabSection);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
