part of 'package:nova/modules/wallet/exports.dart';

class RecentTransactionWidget extends StatelessWidget {
  const RecentTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NovaTextWidget(
              title: "Transaction History",
              textStyle: NovaTypography.textTitleSmallStyle,
              textSize: NovaTypography.fontDesc20,
              fontWeight: FontWeight.w700,
              fontFamily: NovaTypography.fontFamilyMedium,
              textColor: Color(0xff2E3A59),
              maxLines: 1,
            ),
            NovaTextWidget(
              title: "Show All",
              textStyle: NovaTypography.textTitleSmallStyle,
              textSize: NovaTypography.fontBodyLarge,
              fontWeight: FontWeight.w500,
              textColor: NovaColors.appPrimaryColorMain500,
              maxLines: 1,
            ),
          ],
        ),
        NovaVSpace(16),
        Column(
          children: [
            TransactionsCardWidget(notificationType: NotificationType.walletWithdrawal, hasPopUp: true, dateCreated: DateTime.now().formatDate()),
            TransactionsCardWidget(notificationType: NotificationType.walletFunded, hasPopUp: true, dateCreated: DateTime.now().formatDate()),
            TransactionsCardWidget(notificationType: NotificationType.walletWithdrawal, hasPopUp: true, dateCreated: DateTime.now().formatDate()),
            TransactionsCardWidget(notificationType: NotificationType.walletFunded, hasPopUp: true, dateCreated: DateTime.now().formatDate()),
            TransactionsCardWidget(notificationType: NotificationType.walletFunded, hasPopUp: true, dateCreated: DateTime.now().formatDate()),
            TransactionsCardWidget(notificationType: NotificationType.walletWithdrawal, hasPopUp: true, dateCreated: DateTime.now().formatDate()),

          ],
        )
      ],
    );

  }
}
