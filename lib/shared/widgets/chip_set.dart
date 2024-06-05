part of "package:nova/shared/widgets/exports.dart";

chipSet(String title, [bool isSelected = false]) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: NovaDecorations.borderRadiusGeometryCircular4,
      color: NovaColors.appPrimaryColorMain500
    ),
      // backgroundColor: isSelected ? NovaColors.appPrimaryColorMain500 : NovaColors.appPrimaryColorMain500,
      child: NovaTextWidget(
        title: title,
        textStyle: NovaTypography.textBodySmallStyle,
        textSize: NovaTypography.fontLabelMedium,
        fontFamily: NovaTypography.fontFamilyMedium,
        textColor: isSelected ? NovaColors.appWhiteColor : NovaColors.appWhiteColor,
        // fontWeight: FontWeight.w600,
      ).paddingSymmetric(horizontal: 16, vertical: 8));
}