part of 'package:nova/modules/transaction_history/exports.dart';

class TransactionsCardWidget extends StatelessWidget {
  final NotificationType notificationType;
  final bool hasPopUp;
  final String dateCreated;

  const TransactionsCardWidget(
      {Key? key,
      required this.notificationType,
      required this.dateCreated,
      this.hasPopUp = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: hasPopUp
          ? () {
              // PersistentNavBarNavigator.pushNewScreen(
              //   context,
              //   screen: const TransactionSummaryScreen(),
              //   withNavBar: false,
              //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
              // );
            }
          : () {},
      child: Container(
        decoration: BoxDecoration(
            color: NovaColors.appWhiteColor,
            borderRadius: NovaDecorations.borderRadiusGeometryCircular8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NovaImageSvg(svgPath: getNotificationImage(notificationType), width: 40.w, height: 40.h,),
            NovaHSpace(8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NovaTextWidget(
                    title: "Olarenwaju Philip",
                    textColor:
                        notificationType == NotificationType.loanCharges ||
                                notificationType ==
                                    NotificationType.walletWithdrawal
                            ? NovaColors.appErrorColor
                            : NovaColors.appPrimaryText,
                    fontFamily: NovaTypography.fontFamilyMedium,
                    fontWeight: FontWeight.w600,
                    textSize: NovaTypography.fontBodyMedium,
                  ),
                  NovaVSpace(8),
                  NovaTextWidget(
                    title: dateCreated,
                    textColor: NovaColors.appGrayText,
                    textSize: NovaTypography.fontLabelSmall,
                  ),
                ],
              ),
            ),
            NovaHSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                NovaTextWidget(
                  title: 4000000.toString().formatWithCommasAndDecimals(),
                  textStyle: NovaTypography.textTitleSmallStyle,
                  textSize: NovaTypography.fontBodyMedium,
                  fontFamily: NovaTypography.fontFamilyMedium,
                  fontWeight: FontWeight.w500,
                  textColor:
                      notificationType == NotificationType.loanCharges ||
                              notificationType ==
                                  NotificationType.walletWithdrawal
                          ? NovaColors.appErrorColor
                          : NovaColors.appGreenColor,
                  maxLines: 1,
                  isCurrency: true,
                ),
                NovaVSpace(8),
                NovaTextWidget(
                  title: "Sucessful",
                  textColor: NovaColors.appPrimaryColorMain500,
                  textSize: NovaTypography.fontLabelSmall,
                ),
              ],
            ),
          ],
        ),
      ).marginOnly(bottom: 18),
    );
  }
}
