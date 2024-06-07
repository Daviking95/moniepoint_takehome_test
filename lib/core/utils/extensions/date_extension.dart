part of 'package:moniepoint_mobile/core/utils/extensions/exports.dart';

const String dateFormatter = 'dd MMMM yyyy';
const String dateFormatterv2 = 'yyyy-MM-dd';
const String dateFormatterv22 = 'yyyy-MM-dd';
const String dateFormatterv3 = 'dd/MM/yyyy';
const String dateFormatterv4 = 'dd MMM yyyy';
const String dateFormatterv5 = 'dd-MMM-yyyy';
const String timeFormatter = 'E dd MMM,';

extension DateTimePlugin on String {
  String formatDateString() {
    return DateFormat("MMM dd, yyyy").format(DateTime.parse(this));
  }

  String formatDateStringv2() {
    return DateFormat("yyyy-MM-dd").format(DateTime.parse(this));
  }

  String formatDateStringv3() {
    return DateFormat("dd-MMM-yyyy").format(DateTime.parse(this));
  }
  String formatDateStringv4() {
    return DateFormat(dateFormatterv3).format(DateTime.parse(this));
  }
}

extension DateHelper on DateTime {

  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  String formatDatev2() {
    final formatter = DateFormat(dateFormatterv2);
    return formatter.format(this);
  }

  String formatDatev3() {
    final formatter = DateFormat(dateFormatterv3);
    return formatter.format(this);
  }

  String formatDatev4() {
    final formatter = DateFormat(dateFormatterv4);
    return formatter.format(this);
  }

  String formatTime() {
    final formatter = DateFormat(timeFormatter).add_jms();
    return formatter.format(this);
  }

  String formatTimeMini() {
    final formatter = DateFormat(timeFormatter).add_jm();
    return formatter.format(this);
  }

  String formattedTime2() {
    String tdata = DateFormat("hh:mma").format(this);
    return tdata;
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}