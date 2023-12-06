part of 'package:peerlendly/modules/loan/exports.dart';

class LoanHistoryScreen extends StatelessWidget {
  const LoanHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PLVSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PLTextWidget(
              title: "Loan Repaid (4)",
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
            LoanHistoryCard(),
            LoanHistoryCard(),
            LoanHistoryCard(),
            LoanHistoryCard(),
            LoanHistoryCard(),
          ],
        ))
      ],
    );
  }
}
