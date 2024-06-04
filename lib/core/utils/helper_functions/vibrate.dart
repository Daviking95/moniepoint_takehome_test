part of 'package:nova/core/utils/helper_functions/exports.dart';

vibrate() async {
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate();
  }
}