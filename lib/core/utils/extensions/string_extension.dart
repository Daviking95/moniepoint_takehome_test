
part of 'package:moniepoint_mobile/core/utils/extensions/exports.dart';


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


extension AddNaira on Text {
  Wrap addNaira([Color color = Colors.white, double size = 14]) {
    return Wrap(
      children: [
        Text("$strCurrency ",
            style: TextStyle(fontFamily: '', color: color.withOpacity(.6), fontSize: size)),
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
}