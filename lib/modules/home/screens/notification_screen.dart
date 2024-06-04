part of 'package:nova/modules/home/exports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: Expanded(
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                  child: NovaBackIcon(onTap: () => Navigator.pop(context))),
              NovaVSpace(16),
              _showCardWithDate(context, 0, NotificationType.loanAccepted, DateTime.now().add(const Duration(days: 1))),
              _showCardWithDate(context, 1, NotificationType.loanReceived, DateTime.now().add(const Duration(days: 1))),
              _showCardWithDate(context, 2, NotificationType.loanOffer, DateTime.now().add(const Duration(days: 2))),
              _showCardWithDate(context, 3, NotificationType.loanCharges, DateTime.now()),
              _showCardWithDate(context, 4, NotificationType.walletWithdrawal, DateTime.now()),
              _showCardWithDate(context, 5, NotificationType.walletFunded, DateTime.now().add(const Duration(days: 2))),
              // _showCardWithDate(context, 6, NotificationType.loanOffer, DateTime.now().add(const Duration(days: 3))),
              // _showCardWithDate(context, 7, NotificationType.loanCharges, DateTime.now()),

              // for (var index = 0; index < 6; index++) ...[
              //   _showCardWithDate(context, index),
              // ]
            ],
          ).paddingSymmetric(horizontal: 10),
        ),
      ),
    );
  }

  _showCardWithDate(
      BuildContext context, int index, NotificationType notificationType, DateTime dateCreated) {
    DateTime currentDateFormatted = dateCreated;
    DateTime prevCurrentDateFormatted = index - 1 == -1 ? DateTime.now() : dateCreated.subtract(Duration(days: 1));

    if (index == 0 || currentDateFormatted.day != prevCurrentDateFormatted.day) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: NovaTextWidget(
              title: dateCreated.formatDate(),
              textSize: NovaTypography.fontLabelSmall,
              fontWeight: FontWeight.w600,
              textColor: NovaColors.appGrayText,
            ),
            // Text(),
          ),
          const SizedBox(height: 5.0),
          TransactionsCardWidget(notificationType: notificationType, hasPopUp: false, dateCreated: dateCreated.formatDate()),
        ],
      );
    } else {
      return TransactionsCardWidget(notificationType: notificationType, hasPopUp: false, dateCreated: dateCreated.formatDate());
    }
  }
}
