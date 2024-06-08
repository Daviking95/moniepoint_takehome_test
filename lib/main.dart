import 'package:flutter/material.dart';

import 'bootstrap.dart';
import 'flavors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.prod;
  Bootstrap.load();
}
