part of 'package:peerlendly/modules/loan/exports.dart';

class EmptyLoanScreen extends StatelessWidget {
  const EmptyLoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PLVSpace(20),
        Column(
          children: [
            PLImagePng(imgPath: PLAssets.emptyLoan, width: 111.w, height: 129.h,),
            PLVSpace(16),
            PLTextWidget(
              title: "No Investment Available",
              textSize: PLTypography.fontBodyLarge,
            ),
            PLVSpace(24),
            PLButtonRound(
              textTitle: "Go to marketplace",
              functionToRun: () {

                AppNavigator.push(const MarketplaceLoanList());
              },
            )
          ],
        ),
        PLVSpace(20),
      ],
    );
  }
}


class EmptyLoanScreenWithTextOnly extends StatelessWidget {
  final String text;
  const EmptyLoanScreenWithTextOnly({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PLVSpace(20),
        Column(
          children: [
            PLImagePng(imgPath: PLAssets.emptyLoan, width: 111.w, height: 129.h,),
            PLVSpace(16),
            PLTextWidget(
              title: text,
              textSize: PLTypography.fontBodyLarge,
            ),
          ],
        ),
        PLVSpace(20),
      ],
    );

  }
}

