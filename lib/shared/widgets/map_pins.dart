part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class MapPins extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final String text;

  const MapPins(
      {super.key,
      this.top,
      this.bottom,
      this.left,
      required this.text,
      this.right});

  @override
  Widget build(BuildContext context) {
    var homeWatcher = context.watch<HomeProvider>();

    return Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(
          decoration: const BoxDecoration(
              color: MonieEstateColors.appPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )),
          child: homeWatcher.toglleMapPins
              ? MonieEstateImagePng(
                  imgPath: MonieEstateAssets.buildingIcon,
                  width: 25.w,
                  height: 25.h,
                  color: MonieEstateColors.appWhiteColor,
                )
                  .paddingSymmetric(horizontal: 20, vertical: 16)
                  .animate()
                  .scale()
              : MonieEstateTextWidget(
                  title: text,
                  textSize: MonieEstateTypography.fontTitleMedium,
                  fontFamily: MonieEstateTypography.fontFamilyRegular,
                  textAlign: TextAlign.left,
                  textColor: MonieEstateColors.appWhiteColor,
                )
                  .paddingSymmetric(horizontal: 20, vertical: 16)
                  .animate()
                  .fade(duration: const Duration(milliseconds: 200))
                  .scale(),
        ).animate().scale());
  }
}
