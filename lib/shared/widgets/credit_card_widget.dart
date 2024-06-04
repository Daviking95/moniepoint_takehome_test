import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova/core/exports.dart';
import 'package:provider/provider.dart';

import '../../modules/profile/exports.dart';
import '../design_system/exports.dart';
import 'exports.dart';

class NovaCreditCardWidget extends StatefulWidget {

  final Function(TextEditingController cardNum, String cvv, String cardName, String expDate) callback;

  const NovaCreditCardWidget(
      {Key? key,
      required this.callback})
      : super(key: key);

  @override
  _NovaCreditCardWidgetState createState() => _NovaCreditCardWidgetState();
}

class _NovaCreditCardWidgetState extends State<NovaCreditCardWidget> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController expDateController = TextEditingController();

  PLCardType cardType = PLCardType.Invalid;

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      PLCardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: cardNumberController,
            keyboardType: TextInputType.number,
            validator: (val) => CardUtils.validateCardNum(val),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(19),
              CardNumberInputFormatter()
            ],
            decoration: InputDecoration(
              hintText: "Card number",
              suffix: CardUtils.getCardIcon(cardType),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              controller: cardNameController,
              decoration: const InputDecoration(hintText: "Full name"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cvvController,
                  validator: (val) => CardUtils.validateCVV(val),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    // Limit the input
                    LengthLimitingTextInputFormatter(4),
                    CardMonthInputFormatter()
                  ],
                  decoration: const InputDecoration(hintText: "CVV"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: expDateController,
                  validator: (val) => CardUtils.validateDate(val),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5),
                  ],
                  decoration: const InputDecoration(hintText: "MM/YY"),
                ),
              ),
            ],
          ),
          NovaVSpace(32),
          NovaButtonRound(
            textTitle: "Add Card",
            // isFormValidated: profileWatcher.isAddCardFormValidated,
            isLoader: profileWatcher.isLoading,
            loadingString: profileWatcher.loadingString,
            borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
            functionToRun: () => profileWatcher.addCardDetails(context),
          ),
        ],
      ),
    );
  }
}

enum PLCardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardUtils {
  static PLCardType getCardTypeFrmNumber(String input) {
    PLCardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = PLCardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = PLCardType.Visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = PLCardType.Verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = PLCardType.AmericanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = PLCardType.Discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = PLCardType.DinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = PLCardType.Jcb;
    } else if (input.length <= 8) {
      cardType = PLCardType.Others;
    } else {
      cardType = PLCardType.Invalid;
    }
    return cardType;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget? getCardIcon(PLCardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case PLCardType.Master:
        img = 'mastercard.png';
        break;
      case PLCardType.Visa:
        img = 'visa.png';
        break;
      case PLCardType.Verve:
        img = 'verve.png';
        break;
      case PLCardType.AmericanExpress:
        img = 'amex.png';
        break;
      case PLCardType.Discover:
        img = 'discover.png';
        break;
      case PLCardType.DinersClub:
        img = 'dinners_club.png';
        break;
      case PLCardType.Jcb:
        img = 'jcb.png';
        break;
      case PLCardType.Others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return "This field is required";
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return "Card is invalid";
    }

    return null;

  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    int year;
    int month;
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }
    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }
    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }
    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }
}
