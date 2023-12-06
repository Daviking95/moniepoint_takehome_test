part of "package:peerlendly/shared/design_system/exports.dart";

class PLColors {

  PLColors._();

  static const Color appPrimaryColorMain500 = Color(0XFF2F7CE5);
  static const Color appPrimaryColor50 = Color(0xFFE5E9FF);
  static const Color appPrimaryColor100 = Color(0xFFB8C3FF);
  static const Color appPrimaryColor200 = Color(0XFF95A5FF);
  static const Color appPrimaryColor300 = Color(0XFF6C83FF);
  static const Color appPrimaryColor400 = Color(0XFF4F6AFF);
  static const Color appPrimaryColor600 = Color(0XFF0E229A);
  static const Color appPrimaryColor700 = Color(0XFF0B1D86);
  static const Color appPrimaryColor800 = Color(0XFF06156A);
  static const Color appPrimaryColor900 = Color(0XFF030C42);

  static const Color appPrimaryText = Color(0xFF1B1464);
  static const Color appGrayText = Color(0xFF83848B);
  static const Color appSecondaryText = Color(0xFF57636C);
  static const Color appBackgroundColor = Color(0xFFF7F9FD);
  static const Color appContainerBackgroundColor = Color(0xFFF6F6FF);

  static const Color appSecondaryColor100 = Color(0XFFfff8e5);
  static const Color appSecondaryColor200 = Color(0XFFffeab3);
  static const Color appSecondaryColor300 = Color(0XFFffdc80);
  static const Color appSecondaryColor400 = Color(0XFFffcd4d);
  static const Color appSecondaryColorMain500 = Color(0XFFA92914);
  static const Color appSecondaryColor600 = Color(0XFFe6a600);
  static const Color appSecondaryColor700 = Color(0XFFb38100);
  static const Color appSecondaryColor800 = Color(0XFF805c00);
  static const Color appSecondaryColor900 = Color(0XFF4d3700);

  static const Color appSuccessColor = Color(0xff28A745);
  static const Color appErrorColor = Color(0XFFFF5963);
  static const Color appWarningColor = Color(0XFFF9CF58);
  static const Color appWhiteColor = Color(0XFFffffff);

  static const Color appGreenColor = Color(0XFF30830B);
  static const Color appBlackColor = Color(0XFF222222);
  static const Color appGradient1Color = Color(0XFF4E33FF);
  static const Color appGradient2Color = Color(0XFF715CFF);

  static const Color appIndicatorColor = Color(0xff6A5C8A);
  static const Color appSliderColor = Color(0xffD9D9D9);
  static const Color appPlusButtonColor = Color(0xffDCD6FF);
  static const Color appPlusButtonInnerColor = Color(0xff0D0F11);
  static const Color appFocusColor = Color(0xffC1C1C3);
  static const Color appBorderColor = Color(0xffE1E1E1);

  static const Color grayColor100 = Color(0xFF1A1A1A);

  static const Color neutralColor100 = Color(0xFFF8F8F8);
  static const Color neutralColor200 = Color(0xFFEAEAEA);
  static const Color neutralColor300 = Color(0xFFCCCCCC);
  static const Color neutralColor400 = Color(0xFFA8A8A8);
  static const Color neutralColor500 = Color(0xFF808080);
  static const Color neutralColor600 = Color(0xFF555555);
  static const Color neutralColor700 = Color(0xFF2E2E2E);
  static const Color neutralColor800 = Color(0xFF171717);

  static LinearGradient appLinearGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[appGradient1Color, appGradient2Color],
    tileMode: TileMode.mirror,
  );
}
