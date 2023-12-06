part of 'package:peerlendly/modules/home/exports.dart';

class DashboardCTAWidget extends StatelessWidget {
  final String title;
  final String description;
  final String ctaButtonTitle;
  final String assetString;
  final Function actionToTake;

  DashboardCTAWidget(this.title, this.description, this.ctaButtonTitle,
      this.assetString, this.actionToTake,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: PLDecorations.borderRadiusGeometryCircular16,
          color: PLColors.appWhiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffEEF4FC),
            child: assetString.endsWith(".svg")
                ? PLImageSvg(svgPath: assetString)
                : PLImagePng(
                    imgPath: assetString,
                    width: 24.w,
                    height: 24.h,
                  ),
          ),
          PLHSpace(16),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PLTextWidget(
                  title: title,
                  textSize: PLTypography.fontBodyMedium,
                  fontWeight: FontWeight.w600,
                ),
                PLVSpace(4),
                PLTextWidget(
                  title: description,
                  textColor: PLColors.appGrayText,
                  textSize: PLTypography.fontLabelSmall,
                ),
              ],
            ),
          ),
          PLHSpace(8),
          InkWell(
            onTap: () => actionToTake(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: PLDecorations.borderRadiusGeometryCircular20,
                  color: PLColors.appPrimaryColorMain500),
              child: PLTextWidget(
                title: ctaButtonTitle,
                textColor: PLColors.appWhiteColor,
                textSize: PLTypography.fontLabelSmall,
              ).paddingSymmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
