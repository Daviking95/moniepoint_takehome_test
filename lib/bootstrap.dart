
import 'package:flutter/material.dart';
import 'app_level_locator/exports.dart';

class Bootstrap {
  const Bootstrap._();

  static void load() async {

    await InitializeServices.setupFunctions();

    runApp(const MonieEstateApp());
  }
}
