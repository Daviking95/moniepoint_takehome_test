

part of 'package:nova/modules/transaction_history/exports.dart';

getNotificationImage(NotificationType notificationType){
  String assetString = "";
  switch(notificationType) {
    case NotificationType.loanAccepted:
      assetString = NovaAssets.notiLoanAccepted;
      break;
    case NotificationType.loanCharges:
      assetString = NovaAssets.notiLoanCharges;
      break;
    case NotificationType.loanOffer:
      assetString = NovaAssets.notiLoanAccepted;
      break;
    case NotificationType.loanReceived:
      assetString = NovaAssets.notiLoanAccepted;
      break;
    case NotificationType.walletFunded:
      assetString = NovaAssets.notiWalletFunded;
      break;
    case NotificationType.walletWithdrawal:
      assetString = NovaAssets.notiWalletWithdraw;
      break;
    default:
  }

  return assetString;

}