part of 'package:moniepoint_mobile/modules/home/exports.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: MonieEstateColors.appWhiteColor,
              borderRadius:
                  MonieEstateDecorations.borderRadiusGeometryCircular8),
          child: Row(
            children: [
              MonieEstateImagePng(
                imgPath: MonieEstateAssets.location,
                color: MonieEstateColors.appSecondaryColor,
                height: 15.h,
                width: 15.w,
              ),
              MonieEstateHSpace(6),
              const MonieEstateTextWidget(
                title: "Saint Pertersburg",
                textColor: MonieEstateColors.appSecondaryColor,
              ),
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 8).animate().fade(
                duration: const Duration(milliseconds: 1500),
                delay: const Duration(milliseconds: 800),
              ),
        ).animate().slideX(
              duration: const Duration(milliseconds: 1200),
            ),
        const ProfileImageWidget(
          imageFile: "",
          size: 50,
          fallBackImage: MonieEstateAssets.defaultProfile,
        ).animate().fade(duration: const Duration(milliseconds: 1200)).scale()
      ],
    );
  }
}
