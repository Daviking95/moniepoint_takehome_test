part of "package:nova/shared/widgets/exports.dart";

class NovaDropDownButton extends StatefulWidget {
  final List<String> spinnerList;
  final double borderRadius;
  final String hint;
  final bool isReadOnly;
  String result;
  final TextEditingController controller;
  final bool shouldRunAFunctionOnChange;
  final void Function(String val)? onChangeFunction;
  final bool isLoading;

  NovaDropDownButton(
      this.spinnerList,
      this.borderRadius,
      this.hint,
      this.controller, {
        super.key,
        this.result = "",
        this.shouldRunAFunctionOnChange = false,
        this.isReadOnly = false,
        this.onChangeFunction,
        this.isLoading = false,
      });

  @override
  State<NovaDropDownButton> createState() => _NovaDropDownButtonState();
}

class _NovaDropDownButtonState extends State<NovaDropDownButton> {
  String dropdownValueForSelectedItem = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.result =
    widget.controller.text.isEmpty ? "" : widget.controller.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaTextWidget(
          title: widget.hint,
          textSize: NovaTypography.fontBodySmall,
          textColor: NovaColors.appPrimaryText,
          fontWeight: FontWeight.w600,
        ),
        DropdownButtonFormField<String>(
          value: widget.result.isNotEmpty ? widget.result : null,
          validator: (value) => value == null ? 'Field is required' : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          icon: widget.isLoading
              ? Container(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: NovaColors.appPrimaryColorMain500,
              ))
              : Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: NovaTypography.textBodyMediumStyleBold
              .copyWith(color: NovaColors.appSecondaryColorMain500),
          onChanged: (String? data) {
            setState(() {
              dropdownValueForSelectedItem = data!;

              _returnValueString(data);

              if (widget.shouldRunAFunctionOnChange) widget.onChangeFunction!(data);
            });
          },
          isExpanded: true,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: buildInputDecoration(context, widget.hint, null, widget.hint),
          // underline: Container(),
          items: widget.spinnerList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: NovaTextWidget(
                title: value,
                textStyle: NovaTypography.textBodySmallStyle, // textBodyMediumStyle
              ),
            );
          }).toList(),
        ).marginOnly(top: 10, bottom: 10),
      ],
    );
  }

  TextEditingController _returnValueString(String data) {
    widget.controller.text = data;
    return widget.controller;
  }
}

class PLDropDownButtonWithIcon extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  final String title;
  final bool isNetworkImage;
  final TextEditingController value;
  final Widget? prefixIcon;
  final Function(String)? callBack;

  const PLDropDownButtonWithIcon(
      {super.key,
        required this.list,
        required this.title,
        required this.value,
        this.prefixIcon,
        this.isNetworkImage = false,
        this.callBack});

  @override
  Widget build(BuildContext context) {
    return NovaPrimaryTextField(
      textInputType: TextInputType.text,
      controller: value,
      isReadOnly: true,
      prefixIcon: prefixIcon,
      fillColor: NovaColors.appWhiteColor,
      validation: (val) => val.validateString(strFieldRequiredError),
      onTapFunction: () {
        selectFromDropDown(context, list, value, title, callBack);
      },
      suffixIcon: const Icon(
        Icons.arrow_drop_down,
        size: 24,
      ),
      hintText: title,
    );
  }
}

void selectFromDropDown(BuildContext context, List<Map<String, dynamic>> list,
    TextEditingController value, String label, Function(String)? callBack) {
  modalBottomSheet(
      context,
      NovaDropDownSearch(
          list: list,
          title: label,
          callBack: (val) {
            value.text = val;

            if (callBack != null) {
              callBack(val);
            }
          }),
      true,
      context.height / 1.5);
}
