part of 'package:nova/modules/home/exports.dart';

class DashboardCTAWidget extends StatelessWidget {
  final String title;
  final String description;
  final String assetString;
  final Function actionToTake;

  DashboardCTAWidget(this.title, this.description,
      this.assetString, this.actionToTake,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => actionToTake(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: NovaDecorations.borderRadiusGeometryCircular16,
            color: Color(0xffF7F7F7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            NovaVSpace(8),
            NovaTextWidget(
              title: title,
              textSize: NovaTypography.fontBodyMedium,
              fontFamily: NovaTypography.fontFamilyMedium,
              fontWeight: FontWeight.w700,
            ),
            NovaVSpace(4),
            NovaTextWidget(
              title: description,
              textColor: NovaColors.appBlackColor,
              textSize: NovaTypography.fontLabelMedium,
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
