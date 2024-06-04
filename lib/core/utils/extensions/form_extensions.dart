part of 'package:nova/core/utils/extensions/exports.dart';

extension ObscuredPhoneNumber on String {
  String hidePhoneNumber() {
    return ("${substring(0, 4)} *** *** ${substring(length - 3, length)}");
  }
}

extension Log on Object? {
  void log() => devtools.log(toString());
}

extension Logger on String {
  void logger() {
    if (F.appFlavor == Flavor.pilot) {
      log("PRINTING IN LOG : $this");
      // print("PRINTING IN PRINTS : $logString");
      // _printWrapped("PRINTING IN PRINT_WRAPPED : $logString");
    } else {
      log("PRINTING IN LOG : $this");
    }
  }
}

extension InitIcon on String {
  String initials() {
    String result = "";
    List<String> words = split(" ");
    for (var element in words) {
      if (element.trim().isNotEmpty && result.length < 2) {
        result += element[0].trim();
      }
    }

    return result.trim().toUpperCase();
  }
}

extension Capitalise on String {
  String capitalize() {
    if (isEmpty) return "";
    if (length == 1) return this[0].toUpperCase();
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizer() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension ShortCodeParser on String {
  String parseShortCode() {
    String shortCode = replaceAll("#", "%23").replaceAll("+", "%2B");
    return shortCode;
  }
}

extension AddNaira on Text {
  Wrap addNaira([Color color = Colors.white, double size = 14]) {
    return Wrap(
      children: [
        Text("$strCurrency ",
            style: TextStyle(fontFamily: '', color: color, fontSize: size)),
        Text(data ?? "", style: style),
      ],
    );
  }
}

extension FormatCurrency on String {
  String formatCurrency() {
    if (isEmpty) return "";
    double value = double.parse(this);

    final formatter = NumberFormat.simpleCurrency(locale: "en_Us");
    String newText = formatter.format(value);
    newText = newText.substring(1, newText.length);

    return newText;
  }

  String formatWithCommasAndDecimals() {
    if (isEmpty) return '';

    final parts = split('.');
    String formatted = parts[0]
        .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) {
      return '${match.group(1)},';
    });

    if (parts.length > 1) {
      formatted += '.${parts[1]}';
    }

    return formatted;
  }

  String hideOrShowBalance(BuildContext context) {
    WalletProvider walletWatcher = context.watch<WalletProvider>();
    return walletWatcher.showBalance ? this : "****";
  }

  String removeNSymbol() {
    return toString().replaceAll(strCurrency2, "");
  }

  String removeCommaAndCurrency() {
    return toString()
        .replaceAll(strCurrency2, "")
        .replaceAll(",", "")
    // .split(".")[0]
        .trim();
  }
}

extension FormatToNairaCurrency on String {
  String formatToNairaCurrency() {
    if (isEmpty) return "";
    // double value = double.parse(this);

    String newText = "\₦ $this";

    return newText;
  }
}
