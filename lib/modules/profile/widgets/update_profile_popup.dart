part of 'package:peerlendly/modules/profile/exports.dart';


class UpdateProfilePopup extends StatelessWidget {
  final BuildContext parentContext;
  final int tabSection;
  final ProfileProvider model;
  const UpdateProfilePopup({Key? key, required this.parentContext, required this.tabSection, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileProvider>();

    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          PLImageSvg(
            svgPath: PLAssets.infoIcon,
            width: 50.w,
            height: 50.h,
          ),
          PLVSpace(24),
          PLTextWidget(
            title: 'Do you wish to update your profile?',
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
                    textTitle: "Update",
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                    bgColor: PLColors.appErrorColor,
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
