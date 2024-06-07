part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: MonieEstateImagePng(
          imgPath: MonieEstateAssets.btmSearch,
          width: 15.w,
          height: 15.h,
          color: MonieEstateColors.appBlackColor,
        ).paddingAll(10),
        hintText: 'Search...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: MonieEstateColors.appWhiteColor,
      ),
    );
  }
}