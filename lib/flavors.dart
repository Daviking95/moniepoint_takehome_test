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
        return 'Peer Lendly Poc';
      case Flavor.prod:
        return 'Peer Lendly';
      default:
        return 'Peer Lendly';
    }
  }

  static String get appVersion {
    return "1.0";
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.pilot:
        return 'http://ndyknight-001-site1.itempurl.com/api/';
      case Flavor.prod:
        return 'http://ndyknight-001-site1.itempurl.com/api/';
      default:
        return 'http://ndyknight-001-site1.itempurl.com/api/';
    }
  }
}
