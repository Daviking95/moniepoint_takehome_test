part of "package:nova/shared/widgets/exports.dart";

class NovaPrimaryTextField extends StatelessWidget {
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
  final Widget? prefixIcon;
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
  final bool hasPrefixIcon;
  final FontWeight? fontWeight;
  final String label;
  final String hintText;
  final String innerHintText;
  final bool enabled;
  final bool obscureText;
  final Color? textColor;

  const NovaPrimaryTextField(
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
      this.innerHintText = "",
      this.onTapFunction,
      this.onFieldSubmitted,
      this.isReadOnly = false,
      this.onChange,
      this.maxLine = 1,
      this.formatter,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.suffixText = "",
      this.focusNode,
      this.textColor,
      this.textAlign = TextAlign.start,
      this.textInputAction = TextInputAction.next,
      this.borderRadius = 8.0,
      this.hasSuffixIcon = false,
      this.hasPrefixIcon = false,
      this.hasDecoration = false,
      this.validation,
      this.label = "",
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaTextWidget(
          title: hintText,
          textSize: NovaTypography.fontBodyMedium,
          textColor: textColor ?? NovaColors.appBlackColor,
          // fontWeight: FontWeight.w600,
        ),
        // PLVSpace(8),
        CustomRoundedBorders(
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            decoration: buildInputDecoration(context, label, suffixIcon, hintText, enabled, borderRadius, fillColor, suffixText, prefixIcon, innerHintText),
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppNavigator.appContext?.textTheme.labelSmall!.color,
              fontSize: 18.sp,
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

InputDecoration buildInputDecoration(BuildContext context, String label, [Widget? suffixIcon, String hintText = "", bool enabled = true, double borderRadius = 8.0, Color? fillColor, String? suffixText, Widget? prefixIcon, String innerHintText = ""]) {
  return InputDecoration(
    errorMaxLines: 3,
    errorStyle: const TextStyle(fontSize: 10),
    // errorText: "EThis should be the longest error in history, but here we are still typing it out like it is valid",
    suffixIcon: suffixIcon?.paddingAll(10),
    prefixIcon: prefixIcon?.paddingAll(10),
    suffixText: suffixText,

    // labelText: label,
    hintText: innerHintText,
    hintStyle: context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Color(0xff94A3B8)),
    filled: true,
    fillColor: fillColor ?? NovaColors.appWhiteColor, // AppNavigator.appContext?.theme.scaffoldBackgroundColor,
    // labelStyle: context.textTheme.bodyMedium!.copyWith(
    //   color: AppNavigator.appContext?.textTheme.labelSmall!.color,
    //   fontSize: PLTypography.fontDesc14,
    // ),
    border: InputBorder.none,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : NovaColors.appBorderColor,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.grey : Colors.grey,
        width: 0.5,
      ),
    ),
    enabled: enabled,
    focusedBorder: OutlineInputBorder(
      borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : Theme.of(context).primaryColor,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : Theme.of(context).colorScheme.error,
        width: 1.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
      borderSide: BorderSide(
        color: borderRadius == 0 ? Colors.transparent : Theme.of(context).colorScheme.error,
        width: 1.0,
      ),
    ),
  );
}
