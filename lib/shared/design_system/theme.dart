part of 'package:moniepoint_mobile/shared/design_system/exports.dart';

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: MonieEstateColors.appPrimaryColor,
    secondary: MonieEstateColors.appSecondaryColor,
  );
  final ThemeData base = ThemeData(
    appBarTheme: const AppBarTheme(elevation: 0),
    brightness: Brightness.light,
    // useMaterial3: true,
    primaryColor: MonieEstateColors.appPrimaryColor,
    primaryColorDark: MonieEstateColors.appPrimaryColor,
    indicatorColor: MonieEstateColors.appIndicatorColor,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: MonieEstateColors.appWhiteColor,
    scaffoldBackgroundColor: MonieEstateColors.appBackgroundColor,
    focusColor: MonieEstateColors.appFocusColor,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
        height: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        )),
    fontFamily: MonieEstateTypography.fontFamilyRegular,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        fontFamily: MonieEstateTypography.fontFamilyRegular,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: MonieEstateTypography.fontFamilyRegular,
      ),
    ),
    textTheme: TextTheme(
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return MonieEstateColors.appSecondaryColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return MonieEstateColors.appSecondaryColor;
        }
        return null;
      }),
    ),
    colorScheme: colorScheme
        .copyWith(background: const Color(0xffFCFCFC))
        .copyWith(error: const Color(0xFFB00020)),
  );
  return base;
}
