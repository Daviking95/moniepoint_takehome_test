part of "package:moniepoint_mobile/shared/design_system/exports.dart";

class MonieEstateDecorations {
  MonieEstateDecorations._();

  static BorderRadius borderRadiusGeometryCircular100 =
      BorderRadius.circular(100);
  static BorderRadius borderRadiusGeometryCircular20 =
      BorderRadius.circular(20);

  static BorderRadius borderRadiusGeometryCircular24 =
      BorderRadius.circular(24);
  static BorderRadius borderRadiusGeometryCircularTop20 =
      const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20));
  static BorderRadius borderRadiusGeometryCircular16 =
      BorderRadius.circular(16);
  static BorderRadius borderRadiusGeometryCircular32 =
      BorderRadius.circular(32);
  static BorderRadius borderRadiusGeometryCircular50 =
      BorderRadius.circular(50);
  static BorderRadius borderRadiusGeometryCircular8 = BorderRadius.circular(8);
  static BorderRadius borderRadiusGeometryCircular4 = BorderRadius.circular(4);

  static BoxShadow get customShadow => BoxShadow(
        color: Colors.black.withOpacity(.3),
        blurRadius: 5.0,
        spreadRadius: -5,
        blurStyle: BlurStyle.outer,
        offset: const Offset(
          5.0,
          5.0, // Move to bottom 10 Vertically
        ),
      );

  static Decoration get tileContainerDecoration {
    return BoxDecoration(
        color: AppNavigator.appContext!.theme.scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(34, 34, 34, 0.1),
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ]);
  }
}
