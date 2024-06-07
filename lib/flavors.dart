enum Flavor {
  pilot,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.pilot:
        return 'MoniepointMobile Poc';
      case Flavor.prod:
        return 'MoniepointMobile';
      default:
        return 'title';
    }
  }

}
