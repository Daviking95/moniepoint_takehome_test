part of 'package:nova/modules/home/exports.dart';

class DashboardCTAWidget extends StatelessWidget {
  final String title;
  final String description;
  final String ctaButtonTitle;
  final String assetString;
  final Function actionToTake;
  final Color ctaColor;

  DashboardCTAWidget(this.title, this.description, this.ctaButtonTitle,
      this.assetString, this.actionToTake,
      {super.key, this.ctaColor = NovaColors.appPrimaryColorMain500});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: NovaDecorations.borderRadiusGeometryCircular16,
          color: NovaColors.appWhiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffEEF4FC),
            child: assetString.endsWith(".svg")
                ? NovaImageSvg(svgPath: assetString)
                : NovaImagePng(
                    imgPath: assetString,
                    width: 24.w,
                    height: 24.h,
                  ),
          ),
          NovaHSpace(16),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NovaTextWidget(
                  title: title,
                  textSize: NovaTypography.fontBodyMedium,
                  fontWeight: FontWeight.w600,
                ),
                NovaVSpace(4),
                NovaTextWidget(
                  title: description,
                  textColor: NovaColors.appGrayText,
                  textSize: NovaTypography.fontLabelSmall,
                ),
              ],
            ),
          ),
          NovaHSpace(8),
          InkWell(
            onTap: () => actionToTake(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: NovaDecorations.borderRadiusGeometryCircular20,
                  color: ctaColor),
              child: NovaTextWidget(
                title: ctaButtonTitle,
                textColor: NovaColors.appWhiteColor,
                textSize: NovaTypography.fontLabelSmall,
              ).paddingSymmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
