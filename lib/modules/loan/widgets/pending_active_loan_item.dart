part of 'package:nova/modules/loan/exports.dart';

class PendingActiveLoanItem extends StatelessWidget {
  final LoanStatus loanStatus;
  final ActivePendingLoansResponseModelLoanDetail loanDetail;

  const PendingActiveLoanItem({Key? key, required this.loanStatus, required this.loanDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.navigateRoute(
            context: context,
            routeType: 7,
            route: SingleLoanScreen(
              loanStatus: loanStatus,
                loanDetail: loanDetail
            ));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: NovaColors.appWhiteColor,
                borderRadius: NovaDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: NovaColors.appPrimaryColorMain500,
                  radius: 20,
                  child: Text(
                    loanDetail.borrowerName.length < 2 ? loanDetail.borrowerName : loanDetail.borrowerName.substring(0,2).toUpperCase(),
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: NovaColors.appWhiteColor),
                  ),
                ),
                NovaHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaTextWidget(
                        title: loanDetail.loanAmount.toString().formatWithCommasAndDecimals(),
                        isCurrency: true,
                        textColor: NovaColors.appPrimaryText,
                        fontFamily: NovaTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: NovaTypography.fontBodySmall,
                      ),
                      NovaVSpace(8),
                      NovaTextWidget(
                        title: DateTime.now().formatDate(),
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
                      title: getLoanStatus(loanDetail.loanStatus.toInt()),
                      textColor: loanDetail.loanStatus.toInt() == 5
                          ? NovaColors.appErrorColor
                          : NovaColors.appGreenColor,
                      textSize: NovaTypography.fontLabelSmall,
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 8, vertical: 16),
          ),
        ],
      ).marginOnly(bottom: 12),
    );
  }
}
