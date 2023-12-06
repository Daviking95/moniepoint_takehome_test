part of 'package:peerlendly/modules/loan/exports.dart';

class PendingActiveLoanItem extends StatelessWidget {
  final LoanStatus loanStatus;

  const PendingActiveLoanItem({Key? key, required this.loanStatus})
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
            ));
      },
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
                CircleAvatar(
                  backgroundColor: PLColors.appPrimaryColorMain500,
                  radius: 20,
                  child: Text(
                    "JA",
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: PLColors.appWhiteColor),
                  ),
                ),
                PLHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLTextWidget(
                        title: 4000000.toString().formatWithCommasAndDecimals(),
                        isCurrency: true,
                        textColor: PLColors.appPrimaryText,
                        fontFamily: PLTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: PLTypography.fontBodySmall,
                      ),
                      PLVSpace(8),
                      PLTextWidget(
                        title: DateTime.now().formatDate(),
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
                      title: loanStatus.name.toString().toTitleCase,
                      textColor: loanStatus == LoanStatus.delayed
                          ? PLColors.appErrorColor
                          : PLColors.appGreenColor,
                      textSize: PLTypography.fontLabelSmall,
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
