part of "package:nova/core/enums/exports.dart";

enum NotificationType{
  loanAccepted,
  loanReceived,
  loanCharges,
  loanOffer,
  walletFunded,
  walletWithdrawal,
}

enum LoanStatus{
  noLoan,
  requested,
  approved,
  active,
  delayed,
  loanOffer
}
