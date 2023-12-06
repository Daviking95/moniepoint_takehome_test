part of 'package:peerlendly/modules/transaction_history/exports.dart';

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
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const TransactionSummaryScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
              // AppNavigator.navigateRoute(
              //     context: context,
              //     routeType: 7,
              //     route: const TransactionSummaryScreen());
            }
          : () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: PLColors.appWhiteColor,
                borderRadius: PLDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PLImageSvg(svgPath: getNotificationImage(notificationType)),
                PLHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLTextWidget(
                        title: "Your Loan Offer Accepted",
                        textColor:
                            notificationType == NotificationType.loanCharges ||
                                    notificationType ==
                                        NotificationType.walletWithdrawal
                                ? PLColors.appErrorColor
                                : PLColors.appPrimaryText,
                        fontFamily: PLTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: PLTypography.fontBodySmall,
                      ),
                      PLVSpace(8),
                      PLTextWidget(
                        title: dateCreated,
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelSmall,
                      ),
                    ],
                  ),
                ),
                PLHSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PLTextWidget(
                      title: 4000000.toString().formatWithCommasAndDecimals(),
                      textStyle: PLTypography.textTitleSmallStyle,
                      textSize: PLTypography.fontBodyMedium,
                      fontFamily: PLTypography.fontFamilyMedium,
                      fontWeight: FontWeight.w500,
                      textColor:
                          notificationType == NotificationType.loanCharges ||
                                  notificationType ==
                                      NotificationType.walletWithdrawal
                              ? PLColors.appErrorColor
                              : PLColors.appPrimaryText,
                      maxLines: 1,
                      isCurrency: true,
                    ),
                    PLVSpace(8),
                    PLTextWidget(
                      title: "Received",
                      textColor: PLColors.appPrimaryColorMain500,
                      textSize: PLTypography.fontLabelSmall,
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 8, vertical: 16),
          ),
          // Divider(
          //   color: PLColors.appGrayText.withOpacity(.5),
          // ).marginSymmetric(vertical: 3)
        ],
      ).marginOnly(bottom: 20),
    );
  }
}
