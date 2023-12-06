part of 'package:peerlendly/core/utils/helper_functions/exports.dart';

vibrate() async {
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate();
  }
}