part of 'package:peerlendly/core/utils/extensions/exports.dart';

extension PasswordValidator on String {
  bool isPasswordCompliant([int minLength = 8]) {
    if (length < minLength) {
      return false;
    }

    bool hasUppercase = contains(RegExp(r"[A-Z]"));
    if (hasUppercase) {
      bool hasDigits = contains(RegExp(r"[0-9]"));
      if (hasDigits) {
        bool hasLowercase = contains(RegExp(r"[a-z]"));
        if (hasLowercase) {
          return hasLowercase;
          // bool hasSpecialCharacters =
          //     contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
          // return hasSpecialCharacters;
        }
      }
    }
    return false;
  }

  String? passwordError([int minLength = 8]) {
    if (length < minLength) {
      return "Password is less than 8 characters";
    }

    bool hasUppercase = contains(RegExp(r"[A-Z]"));
    if (!hasUppercase) {
      return "Password must contain a Capital Letter";
    }

    bool hasDigits = contains(RegExp(r"[0-9]"));
    if (!hasDigits) {
      return "Password must contain a Number";
    }

    bool hasLowercase = contains(RegExp(r"[a-z]"));
    if (!hasLowercase) {
      return "Password must contain a small Letter";
    }

    bool hasSpecialCharacters = contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasSpecialCharacters) {
      return "Password must have a special character";
    }

    return null;
  }

  String? comparePassword(String compareString) {
    if (this == compareString) {
      return null;
    } else {
      return "Password must be similar";
    }
  }
}