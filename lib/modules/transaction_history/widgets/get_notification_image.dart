

part of 'package:peerlendly/modules/transaction_history/exports.dart';

getNotificationImage(NotificationType notificationType){
  String assetString = "";
  switch(notificationType) {
    case NotificationType.loanAccepted:
      assetString = PLAssets.notiLoanAccepted;
      break;
    case NotificationType.loanCharges:
      assetString = PLAssets.notiLoanCharges;
      break;
    case NotificationType.loanOffer:
      assetString = PLAssets.notiLoanAccepted;
      break;
    case NotificationType.loanReceived:
      assetString = PLAssets.notiLoanAccepted;
      break;
    case NotificationType.walletFunded:
      assetString = PLAssets.notiWalletFunded;
      break;
    case NotificationType.walletWithdrawal:
      assetString = PLAssets.notiWalletWithdraw;
      break;
    default:
  }

  return assetString;

}