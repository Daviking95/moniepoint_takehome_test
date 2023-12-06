part of 'package:peerlendly/core/network/exports.dart';

class NetworkConstants {
  static const String appAuthModule = "ApplicationAuth";
  static const String onboardingModule = "Onboarding";
  static const String profileModule = "Profile";
  static const String loanModule = "Loan";
  static const String httpAppAuthUrl = "$appAuthModule/login";
  static const String getOtpForSignupUrl = "$onboardingModule/getotp";
  static const String onboardCustomerUrl = "$onboardingModule/onboardcustomer";
  static const String switchAccountUrl = "$onboardingModule/switchaccount";
  static const String verifyBvnUrl = "$onboardingModule/verifybvn";
  static const String verifyCustomerDetailsUrl = "$onboardingModule/verifications";
  static const String loginUrl = "$onboardingModule/signin";
  static const String getUserProfileUrl = "$profileModule/userprofile";
  static const String sendForgotPinMailUrl = "$profileModule/sendforgotpinmail";
  static const String forgotPinUrl = "$profileModule/forgotpin";
  static const String updateUserProfileUrl = "$profileModule/updateprofile";
  static const String bankDetailsUrl = "$profileModule/bankdetails";
  static const String validateBankDetailsUrl = "$profileModule/validatebankname";
  static const String getNigeriaBanksUrl = "https://nigerianbanks.xyz";
  static const String cardDetailsUrl = "$profileModule/carddetails";
  static const String customerUrl = "$profileModule/customer";
  static const String profilePictureUrl = "$profileModule/profilepicture";
  static const String lendlyScoreUrl = "$profileModule/lendlyscore";
  static const String loanApplyUrl = "$loanModule/applyforloan";
}