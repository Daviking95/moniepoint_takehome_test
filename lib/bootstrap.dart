
import 'dart:developer';
import 'package:flutter/material.dart';
import 'app_level_locator/exports.dart';

class Bootstrap {
  const Bootstrap._();

  static void load() async {
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };

    await InitializeServices.setupFunctions();

    runApp(const PLApp());
  }
}
