part of 'package:peerlendly/core/utils/helper_functions/exports.dart';

customDatePicker(BuildContext? context, TextEditingController controller,
    {bool isEndDate = false,
      TextEditingController? startDate,
      bool isLastDate = false,
      required int noOfYears}) async {
  final customDateFormat = DateFormat(dateFormatterv3);

  DateTime dateTime = DateTime.now();

  DateTime? dateTimePicker = await showDatePicker(
    context: context!,
    initialDate: isLastDate
        ? customDateFormat.parse(
        customDateFormat.format(DateTime(DateTime.now().year - (noOfYears * 2))))
        : customDateFormat
        .parse(startDate?.text ?? customDateFormat.format(dateTime)),
    firstDate: isLastDate
        ? customDateFormat
        .parse(customDateFormat.format(DateTime(DateTime.now().year - 100)))
        : isEndDate
        ? customDateFormat
        .parse(startDate?.text ?? customDateFormat.format(dateTime))
        : dateTime.subtract(const Duration(days: 365000)),
    lastDate: isLastDate
        ? customDateFormat
        .parse(customDateFormat.format(DateTime(DateTime.now().year - noOfYears)))
        : dateTime.add(const Duration(days: 365000)),
    currentDate:
    isLastDate ? DateTime(DateTime.now().year - noOfYears) : DateTime.now(),
  );

  controller.text = customDateFormat.format(dateTimePicker!);

  return controller.text;
}

String showCupertinoDatePicker(
    BuildContext context, TextEditingController controller,
    {bool isEndDate = false,
      TextEditingController? startDate,
      bool isLastDate = false,
      bool isTodayLastDate = false,
      Function()? callback,
      int noOfDays = 365000,
      required int noOfYears}) {
  final dateFormat = DateFormat(dateFormatterv3);
  DateTime dateTime = DateTime.now();

  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).copyWith().size.height * 0.50,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).copyWith().size.height * 0.40,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (value) {
                    if (value != controller.text)
                      controller.text = dateFormat.format(value);
                  },
                  initialDateTime: isTodayLastDate
                      ? DateFormat(dateFormatterv3).parse(
                      dateFormat.format(DateTime(DateTime.now().year,
                          DateTime.now().month, DateTime.now().day)))
                      : isLastDate
                      ? DateFormat(dateFormatterv3).parse(
                      dateFormat.format(
                          DateTime(DateTime.now().year - (noOfYears * 2))))
                      : DateFormat(dateFormatterv3)
                      .parse(startDate?.text ?? dateFormat.format(dateTime)),
                  minimumDate: isLastDate
                      ? DateFormat(dateFormatterv3).parse(
                      dateFormat.format(DateTime(DateTime.now().year - 100)))
                      : isEndDate
                      ? DateFormat(dateFormatterv3)
                      .parse(startDate?.text ?? dateFormat.format(dateTime))
                      : dateTime.subtract(const Duration(days: 365000)),
                  maximumDate: isTodayLastDate
                      ? DateFormat(dateFormatterv3).parse(
                      dateFormat.format(DateTime(DateTime.now().year,
                          DateTime.now().month, DateTime.now().day)))
                      : isLastDate
                      ? DateFormat(dateFormatterv3).parse(dateFormat
                      .format(DateTime(DateTime.now().year - noOfYears)))
                      : dateTime.add(Duration(days: noOfDays)),
                ),
              ),
              PLPaddedWidget(
                child: PLButtonRound(
                  textTitle: "Confirm",
                  functionToRun: () {
                    if(callback != null) callback();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      });

  return controller.text;
}