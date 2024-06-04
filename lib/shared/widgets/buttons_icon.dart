part of "package:nova/shared/widgets/exports.dart";

buttonLoaderIcon(String loadingString) {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 20,
        width: 20,
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: NovaColors.appWhiteColor,
            strokeWidth: 2,
          ),
        ),
      ),
      NovaHSpace(16),
      if (loadingString.isNotEmpty)
        NovaTextWidget(
          title: loadingString.toString().capitalize(),
          textSize: NovaTypography.fontBodySmall,
          fontWeight: FontWeight.w600,
          textColor: NovaColors.appWhiteColor,
        ),
    ],
  );
}

buttonSuffixIcon(String? textTitle, TextStyle? textStyle, double? fontSize,
    Widget? suffixIcon, BuildContext context, bool isAllCaps) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        isAllCaps ? textTitle!.toUpperCase() : textTitle!.toTitleCase,
        textAlign: TextAlign.center,
        style: textStyle ??
            context.textTheme.bodySmall?.copyWith(fontSize: fontSize!.toInt().sp, ),
      ),
      Container(margin: const EdgeInsets.only(left: 10), child: suffixIcon)
    ],
  );
}

Widget buttonNoSuffixIcon(String? textTitle, TextStyle? textStyle, double?
fontSize,
    BuildContext context, double inSpacerWidth, bool isAllCaps) {
  return Text(
    isAllCaps ? textTitle!.toUpperCase() : textTitle!.toTitleCase,
    textAlign: TextAlign.center,
    style: textStyle ?? context.textTheme.bodyLarge?.copyWith(fontSize:
    fontSize!.toInt().sp),
  );
}
