part of "package:peerlendly/shared/widgets/exports.dart";

class PlDatePickerTextField extends StatefulWidget {
  final String text;
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


  PlDatePickerTextField(
      {super.key,
        this.text = "",
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
  State<PlDatePickerTextField> createState() => _GFDatePickerTextFieldState();
}

class _GFDatePickerTextFieldState extends State<PlDatePickerTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PLPrimaryTextField(
            controller: widget.datePickerController,
            textInputType: TextInputType.number,
            onTapFunction: widget.hasNoTapFunction ? () {} : openDatePicker,
            hintText: widget.text,
            isReadOnly: true,
            fontSize: widget.fontSize,
            onChange: widget.onChange,
            validation: widget.isRequired
                ? (val) => val.validateString(strFieldRequiredError)
                : null,
            suffixIcon: Icon(Icons.date_range)),
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
