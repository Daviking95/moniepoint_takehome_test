import 'package:flutter/material.dart';

import 'bootstrap.dart';
import 'flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.pilot;
  Bootstrap.load();
}
