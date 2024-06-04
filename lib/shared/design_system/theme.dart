part of 'package:nova/shared/design_system/exports.dart';

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: NovaColors.appPrimaryColorMain500,
    secondary: NovaColors.appSecondaryColorMain500,
  );
  final ThemeData base = ThemeData(
    appBarTheme: const AppBarTheme(elevation: 0),
    brightness: Brightness.light,
    // useMaterial3: true,
    primaryColor: NovaColors.appPrimaryColorMain500,
    primaryColorDark: NovaColors.appPrimaryColorMain500,
    indicatorColor: NovaColors.appIndicatorColor,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: NovaColors.appWhiteColor,
    scaffoldBackgroundColor: NovaColors.appBackgroundColor,
    focusColor: NovaColors.appFocusColor,
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
    fontFamily: NovaTypography.fontFamilyRegular,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        fontFamily: NovaTypography.fontFamilyRegular,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: NovaTypography.fontFamilyRegular,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: NovaTypography.textHeadlineSmallStyle,
      headlineMedium: NovaTypography.textHeadlineMediumStyle,
      headlineLarge: NovaTypography.textHeadlineLargeStyle,
      titleSmall: NovaTypography.textTitleSmallStyle,
      titleMedium: NovaTypography.textTitleMediumStyle,
      titleLarge: NovaTypography.textTitleLargeStyle,
      bodySmall: NovaTypography.textBodySmallStyle,
      bodyMedium: NovaTypography.textBodyMediumStyle,
      bodyLarge: NovaTypography.textBodyLargeStyle,
      labelSmall: NovaTypography.textLabelSmallStyle,
      labelMedium: NovaTypography.textLabelMediumStyle,
      labelLarge: NovaTypography.textLabelLargeStyle,
      displaySmall: NovaTypography.textDisplaySmallStyle,
      displayMedium: NovaTypography.textDisplayMediumStyle,
      displayLarge: NovaTypography.textDisplayLargeStyle
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return NovaColors.appSecondaryColorMain500;
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
          return NovaColors.appSecondaryColorMain500;
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
