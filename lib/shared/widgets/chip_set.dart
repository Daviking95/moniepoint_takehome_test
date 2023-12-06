part of "package:peerlendly/shared/widgets/exports.dart";

chipSet(String title, [bool isSelected = false]) {
  return Chip(
      backgroundColor: isSelected ? PLColors.appPrimaryColorMain500 : PLColors.appPrimaryColor200.withOpacity(.2),
      label: PLTextWidget(
        title: title,
        textStyle: PLTypography.textBodySmallStyle,
        textSize: PLTypography.fontLabelSmall,
        textColor: isSelected ? PLColors.appWhiteColor : PLColors.appPrimaryColorMain500,
        // fontWeight: FontWeight.w600,
      ));
}