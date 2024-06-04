part of "package:nova/shared/widgets/exports.dart";

class NovaPasswordTextField extends StatefulWidget {
  final String textInputTitle;
  final TextEditingController? controller;
  final Color? color;
  final TextInputAction? textInputAction;
  final bool? isThereNoBottomPadding;
  final String? Function(String? value)? validation;
  final void Function(String value)? onChange;
  final String labelText;
  final String hintText;
  final Color? textColor;

  NovaPasswordTextField(
      {this.textInputTitle = "Password",
        this.controller,
        this.textInputAction = TextInputAction.next,
        this.color,
        this.hintText = "",
        this.validation,
        this.onChange,
        this.textColor,
        this.isThereNoBottomPadding = false,
        this.labelText = ""});

  @override
  _NovaPasswordTextFieldState createState() => _NovaPasswordTextFieldState();
}

class _NovaPasswordTextFieldState extends State<NovaPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaTextWidget(
          title: widget.hintText,
          textSize: NovaTypography.fontBodyMedium,
          textColor: widget.textColor ?? NovaColors.appBlackColor,
          // fontWeight: FontWeight.w600,
        ),
        CustomRoundedBorders(
          child: TextFormField(
            obscureText: _obscureText,
            keyboardType: TextInputType.visiblePassword,
            style: context.textTheme.bodyLarge!.copyWith(
              color: AppNavigator.appContext?.textTheme.labelSmall!.color,
            ),
            validator: widget.validation,
            controller: widget.controller,
            onChanged: widget.onChange,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: widget.color,
            textInputAction: widget.textInputAction,
            enableInteractiveSelection: true,
            toolbarOptions: const ToolbarOptions(
              paste: true,
              cut: true,
              copy: true,
              selectAll: true,
            ),
            decoration: buildInputDecoration(context, widget.labelText, null, widget.hintText)
            .copyWith(
              suffixIconConstraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              suffixIcon: GestureDetector(
                  onTap: _toggle,
                  child: Icon(_obscureText ? Icons.remove_red_eye_outlined : Icons.dnd_forwardslash)
                  // NovaTextWidget(
                  //   title: _obscureText ? strShow : strHide,
                  // )
                      .paddingSymmetric(horizontal: 10)),
            ),
          ),
        ),
      ],
    ).marginSymmetric(
      vertical: 4,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
