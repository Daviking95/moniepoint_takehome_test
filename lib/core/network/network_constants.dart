part of 'package:nova/core/network/exports.dart';

class NetworkConstants {
  static const String appAuthModule = "ApplicationAuth";
  static const String onboardingModule = "Onboarding";
  static const String profileModule = "Profile";
  static const String loanModule = "Loan";
  static const String commonModule = "Common";
  static const String transactionModule = "Transaction";


  static const String httpAppAuthUrl = "$appAuthModule/login";
  static const String getOtpForSignupUrl = "$onboardingModule/getotp";
  static const String onboardCustomerUrl = "$onboardingModule/onboardcustomer";
  static const String switchAccountUrl = "$onboardingModule/switchaccount";
  static const String verifyBvnUrl = "$onboardingModule/verifybvn";
  static const String verifyCustomerDetailsUrl = "$onboardingModule/verifications";
  static const String loginUrl = "$onboardingModule/signin";
  static const String getUserProfileUrl = "$profileModule/userprofile";
  static const String sendForgotPinMailUrl = "$profileModule/sendforgotpinmail";

  static const String emailEExistUrl = "$commonModule/EmailEExist";
  static const String forgotPinUrl = "$profileModule/forgotpin";
  static const String updateUserProfileUrl = "$profileModule/updateprofile";
  static const String bankDetailsUrl = "$profileModule/bankdetails";
  static const String validateBankDetailsUrl = "$profileModule/validatebankname";
  static const String getNigeriaBanksUrl = "$transactionModule/GetBankList"; // "https://nigerianbanks.xyz";
  static const String cardDetailsUrl = "$profileModule/carddetails";
  static const String customerUrl = "$profileModule/customer";
  static const String profilePictureUrl = "$profileModule/profilepicture";
  static const String createTransactionPinUrl = "$profileModule/settransactionpin";
  static const String resetTransactionPinUrl = "$profileModule/resettransactionpin";
  static const String lendlyScoreUrl = "$profileModule/lendlyscore";
  static const String loanApplyUrl = "$loanModule/applyforloan";
  static const String offersFromLendersUrl = "$loanModule/myoffers";
  static const String loanMarketplaceUrl = "$loanModule/marketplaceloans";
  static const String activePendingLoanOffersUrl = "$loanModule/loans";
  static const String singleLoanOfferUrl = "$loanModule/offerdetail";
  static const String loggedInUserLoanDetailsUrl = "$loanModule/loandetails";
  static const String repayLoanWithWalletUrl = "$loanModule/repayloanwithwallet";
  static const String repayLoanWithCardUrl = "$loanModule/repayloanwithdebitcard";
  static const String acceptOfferUrl = "$loanModule/acceptoffer";
  static const String calculateLoanUrl = "$loanModule/calculateloan";
  static const String makeLoanOfferUrl = "$loanModule/makeoffer";
  static const String cancelLoanOfferUrl = "$loanModule/cancel";
  static const String cancelLoanRequestUrl = "$loanModule/deleteloan";
  static const String verifyPinUrl = "$loanModule/verifytransactionpin";
  static const String loanHistoryUrl = "$loanModule/loanhistory";
  static const String createWalletUrl = "$transactionModule/CreateWallet";
  static const String getWalletDetailsUrl = "$transactionModule/GetWalletDetails";
}