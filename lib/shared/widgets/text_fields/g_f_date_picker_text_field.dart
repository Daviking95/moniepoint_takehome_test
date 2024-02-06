part of "package:peerlendly/shared/widgets/exports.dart";

class PLDatePickerTextField extends StatefulWidget {
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
  final int? noOfDays;
  final Function()? callBack;
  final TextEditingController? startDateController;

  PLDatePickerTextField(
      {super.key,
      this.text = "",
      required this.datePickerController,
      this.isTodayLastDate = false,
      this.isTodayFirstDate = false,
      this.hasNoTapFunction = false,
      this.isRequired = true,
        this.noOfDays,
      this.noOfYears = 0,
      this.fontSize = 18,
      this.isDaySelectable = false,
      this.isEndDateSelectable = false,
      this.selectedDayOrDate = 0,
      this.startDateController,
        this.callBack,
      this.isDayOfTheWeekSelected = true});

  @override
  State<PLDatePickerTextField> createState() => _PLDatePickerTextFieldState();
}

class _PLDatePickerTextFieldState extends State<PLDatePickerTextField> {
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
                validation: widget.isRequired
                    ? (val) => val.validateString(strFieldRequiredError)
                    : null,
                suffixIcon: Icon(Icons.date_range, size: 15,)),
      ],
    );
  }

  Future<String> openDatePicker() async {
    final appcontext = AppNavigator.appContext;
    widget.datePickerController.text = showCupertinoDatePicker(
      appcontext!, widget.datePickerController,
      noOfYears: widget.noOfYears,
      isTodayLastDate: widget.isTodayLastDate,
      isEndDate: widget.isTodayFirstDate,
      callback: widget.callBack,
        noOfDays: widget.noOfDays ?? 365000,
      // startDateController: widget.startDateController
    );

    return widget.datePickerController.text;
  }
}
