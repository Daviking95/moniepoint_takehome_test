part of "package:nova/shared/widgets/exports.dart";

class PinTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String? value)? validation;
  final int fieldCount;
  final bool isTransactionPin;
  final bool obscureText;
  final double? boxSize;
  final void Function(String value)? onChange;

  PinTextField({super.key, this.controller, required this.validation, this.fieldCount = 4, this.isTransactionPin = false, this.obscureText = true, this.onChange, this.boxSize});

  final FocusNode pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return PinCodeFields(
      autofocus: true,
      keyboardType: TextInputType.phone,
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        length: fieldCount,
        focusNode: pinPutFocusNode,
        enabled: true,
        onChange: (value) {

          if(controller != null) {
            controller!.text = value;
          }

          if (onChange != null) {
            onChange!(value);
          }
        },
        obscureText: obscureText, onComplete: (String value) {  },
    );
  }
}