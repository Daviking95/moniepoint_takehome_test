part of "package:peerlendly/shared/design_system/exports.dart";

class PLTypography {
  static const String fontFamilyRegular = "interRegular";
  static const String fontFamilyBlack = "interBlack";
  static String fontFamilyLight = "interLight";
  static String fontFamilyMedium = "interMedium";
  static String fontFamilyBold = "interBold";
  static String fontFamilyExtraBold = "interExtraBold";

  static double fontTitle = 32.0.sp;
  static double fontDesc16 = 16.0.sp;
  static double fontDesc14 = 14.0.sp;
  static double fontDesc20 = 20.0.sp;

  static double fontBodySmall = 12.0.sp;
  static double fontBodyMedium = 14.0.sp;
  static double fontBodyLarge = 16.0.sp;

  static double fontLabelSmall = 10.0.sp;
  static double fontLabelMedium = 12.0.sp;
  static double fontLabelLarge = 14.0.sp;

  static double fontTitleSmall = 14.0.sp;
  static double fontTitleMedium = 16.0.sp;
  static double fontTitleLarge = 22.0.sp;

  static double fontHeadlineSmall = 24.0.sp;
  static double fontHeadlineMedium = 28.0.sp;
  static double fontHeadlineLarge = 32.0.sp;

  static double fontDisplaySmall = 36.0.sp;
  static double fontDisplayMedium = 45.0.sp;
  static double fontDisplayLarge = 57.0.sp;

  //For FontWeight 350
  static FontWeight w350 = FontWeight.w100;

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textBodySmallStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: fontBodySmall,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis,
          color: PLColors.appPrimaryText,
          fontFamily: fontFamilyRegular,
          height: 1.21));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textBodyMediumStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: fontBodyMedium,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis,
          fontFamily: fontFamilyMedium,
          color: PLColors.appPrimaryText,
          height: 1.21));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textBodyMediumStyleBold = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: fontBodyMedium,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          fontFamily: fontFamilyBold,
          color: PLColors.appPrimaryText,
          height: 1.21));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textBodyLargeStyle = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: fontBodyLarge,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamilyBold,
          overflow: TextOverflow.ellipsis,
          color: PLColors.appPrimaryText,
          height: 1.21));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textLabelSmallStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontLabelSmall,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyRegular,
      color: PLColors.appSecondaryText,
      overflow: TextOverflow.ellipsis,
      height: 1.21));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textLabelMediumStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontLabelMedium,
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis,
      fontFamily: fontFamilyMedium,
      color: PLColors.appSecondaryText,
      height: 1.21));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textLabelLargeStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontLabelLarge,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      fontFamily: fontFamilyBold,
      color: PLColors.appSecondaryText,
      height: 1.21));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textTitleSmallStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontTitleSmall,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyRegular,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textTitleMediumStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontTitleMedium,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyMedium,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textTitleLargeStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontTitleLarge,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyBold,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textHeadlineSmallStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontHeadlineSmall,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamilyBold,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textHeadlineMediumStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontHeadlineMedium,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyMedium,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textHeadlineLargeStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontHeadlineLarge,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamilyBold,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textDisplaySmallStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontDisplaySmall,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyRegular,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textDisplayMediumStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontDisplayMedium,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyMedium,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));

  // Use copyWith to change FontWeight to ExtraBold, Bold, SemiBold
  static TextStyle textDisplayLargeStyle = GoogleFonts.inter(textStyle: TextStyle(
      fontSize: fontDisplayLarge,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamilyBold,
      overflow: TextOverflow.ellipsis,
      color: PLColors.appPrimaryText,
      height: 1.2));
}
