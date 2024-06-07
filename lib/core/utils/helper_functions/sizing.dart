part of 'package:moniepoint_mobile/core/utils/helper_functions/exports.dart';

class SizingExtension {
  static getHeightOrWidth({isHeight = true}) {
    final sizing = AppNavigator.appContext!.deviceSize;
    double width = sizing.width;
    double height = sizing.height;
    return isHeight ? height : width;
  }

  static getHeightWithoutSafeArea() {
    var padding = MediaQuery.of(AppNavigator.appContext!).padding;
    double height = getHeightOrWidth(isHeight: true) - padding.top - padding.bottom;

    return height;
  }

  static getHeightWithoutStatusBar() {
    var padding = MediaQuery.of(AppNavigator.appContext!).padding;
    double height = getHeightOrWidth(isHeight: true) - padding.top;

    return height;
  }

  static getHeightWithoutStatusBarAndToolbar() {
    var padding = MediaQuery.of(AppNavigator.appContext!).padding;
    double height =
        getHeightOrWidth(isHeight: true) - padding.top - kToolbarHeight;

    return height;
  }
}