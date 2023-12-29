part of 'package:peerlendly/core/utils/extensions/exports.dart';

extension TextfieldValidator on String? {
  String? validateEmail(String errorString) {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (this == null || this == "") return errorString;
    if (regExp.hasMatch(this!)) {
      return null;
    } else {
      return errorString;
    }
  }

  String? validateNumber(String errorString) {
    RegExp regExp = RegExp(r'^[0-9]*$');

    if (this == null || this == "") return errorString;
    if (regExp.hasMatch(this!)) {
      return null;
    } else {
      return errorString;
    }
  }

  String? validateNumberCap(String errorString, int number) {
    RegExp regExp = RegExp(r'^[0-9]*$');

    if (this == null || this == "") return errorString;
    if (this == null && int.parse(this ?? "0") > number) return "You cannot input more than $number";
    if (regExp.hasMatch(this!)) {
      return null;
    } else {
      return errorString;
    }
  }

  String? compareNumber(String compareString) {
    RegExp regExp = RegExp(r'^[0-9]*$');

    if (this == null || this == "") {
      return "Only digits are allowed";
    } else if (this != compareString) {
      return "New pin and confirm pin must be similar";
    } else if (regExp.hasMatch(this!)) {
      return null;
    } else {
      return "Field is required";
    }
  }

  String? validatePhoneNumber(String errorString) {
    RegExp regExp = RegExp(r'[0-9]{11}$');

    if (this == null || this == "") return errorString;
    if (regExp.hasMatch(this!)) {
      return null;
    } else {
      return errorString;
    }
  }

  String? validateLength(String errorString, int length) {
    // RegExp regExp = RegExp(r'^[0-9]{length}$');

    if (this == null || this == "") return errorString;
    return null;
    // if (regExp.hasMatch(this!)) {
    //   return null;
    // } else {
    //   return errorString;
    // }
  }

  String? validateString(String errorString) {
    if (this == null || this == "") {
      return "$errorString is required";
    } else {
      return null;
    }
  }

  String? validateAmount(String errorString) {
    if (this == null || this == "") return errorString;
    if (this!.startsWith("0")) {
      return "Amount field cannot be 0";
    } else {
      return null;
    }
  }
}