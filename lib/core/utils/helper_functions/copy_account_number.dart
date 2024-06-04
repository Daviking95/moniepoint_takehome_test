part of 'package:nova/core/utils/helper_functions/exports.dart';

copyAccountNumber(String data) {
  Clipboard.setData(ClipboardData(text: data))
      .then((value) => showSnackAtTheTop(message: strAccountCopied, isSuccess: true))
      .then((value) => vibrate());
}