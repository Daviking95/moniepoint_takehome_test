part of "package:peerlendly/shared/widgets/exports.dart";

class PLPasswordTextField extends StatefulWidget {
  final String textInputTitle;
  final TextEditingController? controller;
  final Color? color;
  final TextInputAction? textInputAction;
  final bool? isThereNoBottomPadding;
  final String? Function(String? value)? validation;
  final void Function(String value)? onChange;
  final String labelText;
  final String hintText;

  PLPasswordTextField(
      {this.textInputTitle = "Password",
        this.controller,
        this.textInputAction = TextInputAction.next,
        this.color,
        this.hintText = "",
        this.validation,
        this.onChange,
        this.isThereNoBottomPadding = false,
        this.labelText = ""});

  @override
  _PLPasswordTextFieldState createState() => _PLPasswordTextFieldState();
}

class _PLPasswordTextFieldState extends State<PLPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedBorders(
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
              child: PLTextWidget(
                title: _obscureText ? strShow : strHide,
              )
                  .paddingSymmetric(horizontal: 10)),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
