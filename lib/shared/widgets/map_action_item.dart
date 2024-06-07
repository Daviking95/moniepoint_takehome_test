part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class MapActionItem extends StatelessWidget {
  final String imgAsset;
  final String text;
  const MapActionItem({Key? key, required this.imgAsset, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        MonieEstateImagePng(
          imgPath: imgAsset,
          width: 25.w,
          height: 25.h,
          color: const Color(0xff8d8a85),
        ),
        MonieEstateHSpace(8),
        MonieEstateTextWidget(
          title: text,
          textSize: MonieEstateTypography.fontBodyLarge,
          fontFamily: MonieEstateTypography.fontFamilyMedium,
          textAlign: TextAlign.left,
          textColor: const Color(0xff8d8a85),
        )
      ],
    ).marginOnly(bottom: 16);
  }
}
