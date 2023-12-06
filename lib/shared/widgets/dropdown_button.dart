part of "package:peerlendly/shared/widgets/exports.dart";

class PLDropDownButton extends StatefulWidget {
  final List<String> spinnerList;
  final double borderRadius;
  final String hint;
  final bool isReadOnly;
  String result;
  final TextEditingController controller;
  final bool shouldRunAFunctionOnChange;
  final void Function(String val)? onChangeFunction;
  final bool isLoading;

  PLDropDownButton(
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
  State<PLDropDownButton> createState() => _PLDropDownButtonState();
}

class _PLDropDownButtonState extends State<PLDropDownButton> {
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
        PLTextWidget(
          title: widget.hint,
          textSize: PLTypography.fontBodySmall,
          textColor: PLColors.appPrimaryText,
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
                color: PLColors.appPrimaryColorMain500,
              ))
              : Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: PLTypography.textBodyMediumStyleBold
              .copyWith(color: PLColors.appSecondaryColorMain500),
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
              child: PLTextWidget(
                title: value,
                textStyle: PLTypography.textBodySmallStyle, // textBodyMediumStyle
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
  final Function(String)? callBack;

  const PLDropDownButtonWithIcon(
      {super.key,
        required this.list,
        required this.title,
        required this.value,
        this.isNetworkImage = false,
        this.callBack});

  @override
  Widget build(BuildContext context) {
    return PLPrimaryTextField(
      textInputType: TextInputType.text,
      controller: value,
      isReadOnly: true,
      fillColor: PLColors.appWhiteColor,
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
      PLDropDownSearch(
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
