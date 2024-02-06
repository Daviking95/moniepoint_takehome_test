part of "package:peerlendly/shared/widgets/exports.dart";

class PLPrimaryTextField extends StatelessWidget {
  final String textInputTitle;
  final TextEditingController? controller;
  final int? maxLength;
  final double? fontSize;
  final TextInputType? textInputType;
  final Color? cursorColor;
  final bool autoFocus;
  final void Function()? onTapFunction;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChange;
  final bool isReadOnly;
  final int? maxLine;
  final Widget? suffixIcon;
  final double borderRadius;
  final TextInputAction textInputAction;
  final bool hasSuffixIcon;
  final String suffixText;
  final List<TextInputFormatter>? formatter;
  final String? Function(String? value)? validation;
  final Color? fillColor;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final bool hasDecoration;
  final FontWeight? fontWeight;
  final String label;
  final String hintText;
  final bool enabled;
  final bool obscureText;

  const PLPrimaryTextField(
      {super.key,
      this.textInputTitle = "",
      this.controller,
      this.maxLength,
      this.fontSize = 15,
      this.textInputType,
      this.fontWeight,
      this.fillColor,
      this.cursorColor,
      this.autoFocus = false,
      this.hintText = "",
      this.onTapFunction,
      this.onFieldSubmitted,
      this.isReadOnly = false,
      this.onChange,
      this.maxLine = 1,
      this.formatter,
      this.suffixIcon,
      this.obscureText = false,
      this.suffixText = "",
      this.focusNode,
      this.textAlign = TextAlign.start,
      this.textInputAction = TextInputAction.next,
      this.borderRadius = 8.0,
      this.hasSuffixIcon = false,
      this.hasDecoration = false,
      this.validation,
      this.label = "",
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PLTextWidget(
          title: hintText,
          textSize: PLTypography.fontBodySmall,
          textColor: PLColors.appPrimaryText,
          fontWeight: FontWeight.w600,
        ),
        // PLVSpace(8),
        CustomRoundedBorders(
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            decoration: buildInputDecoration(context, label, suffixIcon, hintText, enabled, borderRadius, fillColor, suffixText),
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppNavigator.appContext?.textTheme.labelSmall!.color,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: context.textTheme.bodyMedium!.color,
            keyboardType: textInputType,
            onFieldSubmitted: onFieldSubmitted,
            // controller: controller,
            autofocus: autoFocus,
            validator: validation,
            onTap: onTapFunction,
            readOnly: isReadOnly,
            focusNode: focusNode,
            obscureText: obscureText,
            maxLength: maxLength,
            enableInteractiveSelection: true,
            toolbarOptions: const ToolbarOptions(
              paste: true,
              cut: true,
              copy: true,
              selectAll: true,
            ),
            inputFormatters: formatter ??  <TextInputFormatter>[FilteringTextInputFormatter.singleLineFormatter],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: textInputAction,
            autocorrect: true,
            onChanged: onChange,
            textAlign: textAlign,
            maxLines: maxLine,
          ),
        ),
      ],
    ).marginSymmetric(
      vertical: 4,
    );
  }
}

InputDecoration buildInputDecoration(BuildContext context, String label, [Widget? suffixIcon, String hintText = "", bool enabled = true, double borderRadius = 8.0, Color? fillColor, String? suffixText]) {
  return InputDecoration(
    errorMaxLines: 3,
    errorStyle: const TextStyle(fontSize: 10),
    // errorText: "EThis should be the longest error in history, but here we are still typing it out like it is valid",
    suffixIcon: suffixIcon?.paddingAll(10),
    suffixText: suffixText,

    // labelText: label,
    // hintText: hintText,
    hintStyle: context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: PLColors.appSecondaryText),
    filled: true,
    fillColor: fillColor ?? PLColors.appWhiteColor, // AppNavigator.appContext?.theme.scaffoldBackgroundColor,
    // labelStyle: context.textTheme.bodyMedium!.copyWith(
    //   color: AppNavigator.appContext?.textTheme.labelSmall!.color,
    //   fontSize: PLTypography.fontDesc14,
    // ),
    border: InputBorder.none,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: PLDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : PLColors.appBorderColor,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: PLDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.grey : Colors.grey,
        width: 0.5,
      ),
    ),
    enabled: enabled,
    focusedBorder: OutlineInputBorder(
      borderRadius: PLDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : Theme.of(context).primaryColor,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: PLDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : Theme.of(context).colorScheme.error,
        width: 1.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: PLDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : Theme.of(context).colorScheme.error,
        width: 1.0,
      ),
    ),
  );
}
