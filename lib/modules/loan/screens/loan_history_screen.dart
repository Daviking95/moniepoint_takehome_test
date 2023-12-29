part of 'package:peerlendly/modules/loan/exports.dart';

class LoanHistoryScreen extends StatelessWidget {
  final List<MarketplaceResponseModelLoanDetail> borrowerLoanHistory;
  const LoanHistoryScreen({Key? key, required this.borrowerLoanHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PLVSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PLTextWidget(
              title: "Loan Repaid (${borrowerLoanHistory.length})",
              textColor: PLColors.appPrimaryText,
              fontFamily: PLTypography.fontFamilyMedium,
              fontWeight: FontWeight.w600,
              textSize: PLTypography.fontBodyMedium,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: PLImageSvg(
                svgPath: PLAssets.closeIcon,
                width: 12.w,
                height: 12.h,
              ),
            )
          ],
        ),
        PLVSpace(32),
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
