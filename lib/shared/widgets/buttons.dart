part of "package:nova/shared/widgets/exports.dart";

class NovaButtonRound extends StatelessWidget {
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
  final bool isAllCaps;
  final bool isFormValidated;
  final bool hasBgImg;

  const NovaButtonRound(
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
      this.isAllCaps = false,
      this.hasBgImg = false,
      this.suffixIcon,
      this.fontSize = 18,
      this.inSpacerWidth = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle =
        textStyle ?? NovaTypography.textBodyMediumStyleBold.copyWith(color: textColor ?? (isFormValidated ? NovaColors.appWhiteColor : NovaColors.appWhiteColor.withOpacity(.4)));

    return InkWell(
      onTap: (){
        isLoader || !isFormValidated || functionToRun == null
            ? null
            : {
          FocusScope.of(context).unfocus(),
          functionToRun!(),
        };
      },
      child: SizedBox(
        height: height ?? context.theme.buttonTheme.height,
        child: Stack(
          children: [
            Material(
              elevation: 1.0,
              borderRadius: borderRadius ?? NovaDecorations.borderRadiusGeometryCircular4,
              color: isLoader ? NovaColors.neutralColor500 : bgColor ?? (isFormValidated ? context.theme.primaryColor : NovaColors.appGrayText),
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
                    ? buttonSuffixIcon(textTitle, _textStyle, fontSize, suffixIcon, context, isAllCaps)
                    : buttonNoSuffixIcon(textTitle, _textStyle, fontSize, context, inSpacerWidth, isAllCaps),
              ),
            ),
            if(hasBgImg)
            Positioned(
              right: -30,
                top: -65,
                child: SvgPicture.asset(NovaAssets.buttonImg, fit: BoxFit.fitWidth,
                  height: 200.h,
                  width: context.width,
                ))
            // NovaImageSvg(svgPath: NovaAssets.buttonImg),

          ],
        ),
      ).paddingSymmetric(vertical: 6),
    );
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
  final bool isAllCaps;

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
      this.isAllCaps = false,
      this.functionToRun,
      this.textStyle,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    TextStyle? _textStyle = textStyle ?? context.textTheme.bodyLarge?.copyWith(color: NovaColors.appPrimaryColorMain500);

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
              borderRadius: borderRadius ?? NovaDecorations.borderRadiusGeometryCircular4,
            )),
        onPressed: () => onPressed(context),
        child: buttonWidget ?? buttonNoSuffixIcon(textTitle, _textStyle, fontSize, context, 0, isAllCaps),
      ),
    ).paddingSymmetric(vertical: 6);
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
