

part of 'package:nova/modules/transaction_history/exports.dart';

getNotificationImage(NotificationType notificationType){
  String assetString = "";
  switch(notificationType) {
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