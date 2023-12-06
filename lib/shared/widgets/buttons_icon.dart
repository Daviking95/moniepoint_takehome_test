part of "package:peerlendly/shared/widgets/exports.dart";

buttonLoaderIcon(String loadingString) {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 20,
        width: 20,
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: PLColors.appWhiteColor,
            strokeWidth: 2,
          ),
        ),
      ),
      PLHSpace(16),
      if (loadingString.isNotEmpty)
        PLTextWidget(
          title: loadingString.toString().capitalize(),
          textSize: PLTypography.fontBodySmall,
          fontWeight: FontWeight.w600,
          textColor: PLColors.appWhiteColor,
        ),
    ],
  );
}

buttonSuffixIcon(String? textTitle, TextStyle? textStyle, double? fontSize,
    Widget? suffixIcon, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        textTitle!.toTitleCase,
        textAlign: TextAlign.center,
        style: textStyle ??
            context.textTheme.bodySmall?.copyWith(fontSize: fontSize),
      ),
      Container(margin: const EdgeInsets.only(left: 10), child: suffixIcon)
    ],
  );
}

Widget buttonNoSuffixIcon(String? textTitle, TextStyle? textStyle, double?
fontSize,
    BuildContext context, double inSpacerWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: inSpacerWidth,
      ),
      Text(
        textTitle!.toTitleCase,
        textAlign: TextAlign.center,
        style: textStyle ?? context.textTheme.bodyLarge?.copyWith(fontSize:
        fontSize),
      ),
    ],
  );
}
