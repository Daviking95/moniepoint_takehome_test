part of 'package:nova/modules/loan/exports.dart';

class LoanHistoryScreen extends StatelessWidget {
  final List<MarketplaceResponseModelLoanDetail> borrowerLoanHistory;
  const LoanHistoryScreen({Key? key, required this.borrowerLoanHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NovaVSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NovaTextWidget(
              title: "Loan Repaid (${borrowerLoanHistory.length})",
              textColor: NovaColors.appPrimaryText,
              fontFamily: NovaTypography.fontFamilyMedium,
              fontWeight: FontWeight.w600,
              textSize: NovaTypography.fontBodyMedium,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: NovaImageSvg(
                svgPath: NovaAssets.closeIcon,
                width: 12.w,
                height: 12.h,
              ),
            )
          ],
        ),
        NovaVSpace(32),
        Expanded(
            child: ListView(
          children: [
            for (var index = 0; index < borrowerLoanHistory.length; index++) ...[
              LoanHistoryCard(loanDetail: borrowerLoanHistory[index]),
            ],
          ],
        ))
      ],
    );
  }
}
