part of 'package:peerlendly/shared/design_system/exports.dart';

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: PLColors.appPrimaryColorMain500,
    secondary: PLColors.appSecondaryColorMain500,
  );
  final ThemeData base = ThemeData(
    appBarTheme: const AppBarTheme(elevation: 0),
    brightness: Brightness.light,
    // useMaterial3: true,
    primaryColor: PLColors.appPrimaryColorMain500,
    primaryColorDark: PLColors.appPrimaryColorMain500,
    indicatorColor: PLColors.appIndicatorColor,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: PLColors.appWhiteColor,
    scaffoldBackgroundColor: PLColors.appBackgroundColor,
    focusColor: PLColors.appFocusColor,
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
    fontFamily: PLTypography.fontFamilyRegular,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        fontFamily: PLTypography.fontFamilyRegular,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: PLTypography.fontFamilyRegular,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: PLTypography.textHeadlineSmallStyle,
      headlineMedium: PLTypography.textHeadlineMediumStyle,
      headlineLarge: PLTypography.textHeadlineLargeStyle,
      titleSmall: PLTypography.textTitleSmallStyle,
      titleMedium: PLTypography.textTitleMediumStyle,
      titleLarge: PLTypography.textTitleLargeStyle,
      bodySmall: PLTypography.textBodySmallStyle,
      bodyMedium: PLTypography.textBodyMediumStyle,
      bodyLarge: PLTypography.textBodyLargeStyle,
      labelSmall: PLTypography.textLabelSmallStyle,
      labelMedium: PLTypography.textLabelMediumStyle,
      labelLarge: PLTypography.textLabelLargeStyle,
      displaySmall: PLTypography.textDisplaySmallStyle,
      displayMedium: PLTypography.textDisplayMediumStyle,
      displayLarge: PLTypography.textDisplayLargeStyle
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return PLColors.appSecondaryColorMain500;
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
          return PLColors.appSecondaryColorMain500;
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
