part of "package:nova/shared/widgets/exports.dart";

chipSet(String title, [bool isSelected = false]) {
  return Chip(
      backgroundColor: isSelected ? NovaColors.appPrimaryColorMain500 : NovaColors.appPrimaryColor200.withOpacity(.2),
      label: NovaTextWidget(
        title: title,
        textStyle: NovaTypography.textBodySmallStyle,
        textSize: NovaTypography.fontLabelSmall,
        textColor: isSelected ? NovaColors.appWhiteColor : NovaColors.appPrimaryColorMain500,
        // fontWeight: FontWeight.w600,
      ));
}