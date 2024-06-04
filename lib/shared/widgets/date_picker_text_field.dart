part of "package:nova/shared/widgets/exports.dart";

class NovaDatePickerTextField extends StatefulWidget {
  final String text;
  final String hint;
  final TextEditingController datePickerController;
  final bool isTodayLastDate;
  final bool isTodayFirstDate;
  final int noOfYears;
  final bool hasNoTapFunction;
  final bool isDaySelectable;
  final bool isEndDateSelectable;
  final int selectedDayOrDate;
  final bool isDayOfTheWeekSelected;
  final bool isRequired;
  final double? fontSize;
  final TextEditingController? startDateController;
  final void Function(String value)? onChange;

  NovaDatePickerTextField(
      {super.key,
        this.text = "",
        this.hint = "",
        required this.datePickerController,
        this.isTodayLastDate = false,
        this.isTodayFirstDate = false,
        this.hasNoTapFunction = false,
        this.isRequired = true,
        this.onChange,
        this.noOfYears = 0,
        this.fontSize = 18,
        this.isDaySelectable = false,
        this.isEndDateSelectable = false,
        this.selectedDayOrDate = 0,
        this.startDateController,
        this.isDayOfTheWeekSelected = true});

  @override
  State<NovaDatePickerTextField> createState() => _GFDatePickerTextFieldState();
}

class _GFDatePickerTextFieldState extends State<NovaDatePickerTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaPrimaryTextField(
            controller: widget.datePickerController,
            textInputType: TextInputType.number,
            onTapFunction: widget.hasNoTapFunction ? () {} : openDatePicker,
            hintText: widget.text,
            innerHintText: widget.hint,
            isReadOnly: true,
            fontSize: widget.fontSize,
            onChange: widget.onChange,
            validation: widget.isRequired
                ? (val) => val.validateString(strFieldRequiredError)
                : null,
            prefixIcon: NovaImageSvg(
              svgPath: NovaAssets.dateIcon,
              height: 12.h,
              width: 12.w,
            ).paddingAll(5)),
      ],
    );
  }

  Future<String> openDatePicker() async {
    final appcontext = AppNavigator.appContext;
    widget.datePickerController.text = await customDatePicker(
      appcontext!, widget.datePickerController,
      noOfYears: widget.noOfYears,
      isLastDate: widget.isTodayLastDate,
      isEndDate: widget.isTodayFirstDate,
      // startDateController: widget.startDateController
    );

    return widget.datePickerController.text;
  }
}
