part of "package:peerlendly/shared/widgets/exports.dart";

class PLButtonRound extends StatelessWidget {
  final String? textTitle;
  final String? routeToGo;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Object? arguments;
  final Function()? functionToRun;
  final bool? isIcon;
  final Widget? icon;
  final bool? isFakeButton;
  final bool? hasPadding;
  final bool isLoader;
  final String? loadingString;
  final bool? hasSuffixIcon;
  final Widget? suffixIcon;
  final double? fontSize;
  final double inSpacerWidth;
  final bool isFormValidated;

  const PLButtonRound(
      {Key? key,
      this.textTitle = "",
      this.routeToGo,
      this.bgColor,
      this.textColor,
      this.textStyle,
      this.width = 0,
      this.arguments = true,
      this.functionToRun,
      this.isFakeButton = false,
      this.borderRadius,
      this.isIcon = false,
      this.icon,
      this.hasPadding = true,
      this.isFormValidated = true,
      this.height,
      this.isLoader = false,
      this.loadingString = "",
      this.hasSuffixIcon = false,
      this.suffixIcon,
      this.fontSize = 16,
      this.inSpacerWidth = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle =
        textStyle ?? context.textTheme.bodyMedium?.copyWith(color: textColor ?? (isFormValidated ? PLColors.appWhiteColor : PLColors.appWhiteColor.withOpacity(.4)));

    return SizedBox(
      height: height ?? context.theme.buttonTheme.height,
      child: Material(
        elevation: 1.0,
        borderRadius: borderRadius ?? PLDecorations.borderRadiusGeometryCircular50,
        color: isLoader ? PLColors.neutralColor500 : bgColor ?? (isFormValidated ? context.theme.primaryColor : PLColors.appGrayText),
        child: MaterialButton(
          minWidth: width == 0 ? context.width : width,
          onPressed: () {
            isLoader || !isFormValidated || functionToRun == null
                ? null
                : {
                    FocusScope.of(context).unfocus(),
                    functionToRun!(),
                  };
          },
          child: isLoader
              ? buttonLoaderIcon(loadingString ?? "")
              : isIcon!
                  ? icon
                  : hasSuffixIcon!
                      ? buttonSuffixIcon(textTitle, _textStyle, fontSize, suffixIcon, context)
                      : buttonNoSuffixIcon(textTitle, _textStyle, fontSize, context, inSpacerWidth),
        ),
      ),
    ).paddingSymmetric(vertical: 10);
  }
}

class PLButtonOutline extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final Color? borderColor;
  final TextStyle? textStyle;
  final String? textTitle;
  final String? routeToGo;
  final Object? arguments;
  final Function? functionToRun;
  final double? fontSize;
  final Widget? buttonWidget;
  final bool hasBorder;

  const PLButtonOutline(
      {super.key,
      this.borderRadius,
      this.width = 0,
      this.borderColor,
      this.textTitle,
      this.buttonWidget,
      this.routeToGo,
      this.arguments = true,
      this.hasBorder = true,
      this.functionToRun,
      this.textStyle,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    TextStyle? _textStyle = textStyle ?? context.textTheme.bodyLarge?.copyWith(color: PLColors.appPrimaryColorMain500);

    return SizedBox(
      width: width == 0 ? context.width : width,
      height: context.theme.buttonTheme.height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: hasBorder
                ? BorderSide(
                    color: borderColor ?? context.theme.buttonTheme.colorScheme!.primary,
                    style: BorderStyle.solid,
                    width: 1.0,
                  )
                : null,
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? PLDecorations.borderRadiusGeometryCircular50,
            )),
        onPressed: () => onPressed(context),
        child: buttonWidget ?? buttonNoSuffixIcon(textTitle, _textStyle, fontSize, context, 0),
      ),
    ).paddingSymmetric(vertical: 10);
  }

  onPressed(BuildContext context) {
    routeToGo != null
        ? AppNavigator.navigateRoute(
            context: context,
            routeType: 5,
            routeName: routeToGo!,
          )
        : functionToRun!();
  }
}
