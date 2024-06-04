part of "package:nova/shared/widgets/exports.dart";

class NovaTextWidget extends StatelessWidget {
  final String? title;
  final bool? isCenter;
  final bool? isTitle;
  final bool? isPrimary;
  final bool? isCurrency;
  final double? textSize;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int? maxLines;

  const NovaTextWidget(
      {Key? key,
      required this.title,
      this.isCenter = false,
      this.textSize = 14,
      this.maxLines,
      this.isTitle = false,
      this.isPrimary = false,
      this.isCurrency = false,
      this.textColor,
      this.textStyle,
      this.overflow = TextOverflow.visible,
      this.fontFamily,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left,
      this.textDecoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    FontWeight? _fontWeight;
    TextStyle? _textStyle;
    Color? _txtColor;
    String? _fontFamily;

    _fontFamily = fontFamily ?? (isTitle! ? NovaTypography.fontFamilyBold : NovaTypography.fontFamilyLight);

    _fontWeight = isTitle! ? FontWeight.bold : fontWeight!;

    _textStyle = textStyle ?? (isTitle! ? context.textTheme.headlineSmall : context.textTheme.bodyMedium);

    _txtColor = textColor ?? (isPrimary! ? context.theme.primaryColor : context.theme.textTheme.bodyMedium!.color);

    Widget textToShow = isCurrency!
        ? Text(title?.formatWithCommasAndDecimals() ?? '',
                textAlign: textAlign ?? (isCenter! ? TextAlign.center : TextAlign.left),
                overflow: overflow,
                maxLines: maxLines,
                style: _textStyle!.copyWith(fontSize: textSize, fontWeight: _fontWeight, color: _txtColor, decoration: textDecoration, fontFamily: _fontFamily),
                softWrap: true)
            .addNaira(_txtColor!, textSize!)
        : Text(title ?? '',
            textAlign: textAlign ?? (isCenter! ? TextAlign.center : TextAlign.left),
            overflow: overflow,
            maxLines: maxLines,
            style: _textStyle!.copyWith(fontSize: textSize, fontWeight: _fontWeight, color: _txtColor, decoration: textDecoration, fontFamily: _fontFamily),
            softWrap: true);

    return textToShow;
  }
}
