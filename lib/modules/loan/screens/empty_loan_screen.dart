part of 'package:nova/modules/loan/exports.dart';

class EmptyLoanScreen extends StatelessWidget {
  const EmptyLoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NovaVSpace(20),
        Column(
          children: [
            NovaImagePng(imgPath: NovaAssets.emptyLoan, width: 111.w, height: 129.h,),
            NovaVSpace(16),
            NovaTextWidget(
              title: "No Investment Available",
              textSize: NovaTypography.fontBodyLarge,
            ),
            NovaVSpace(24),
            NovaButtonRound(
              textTitle: "Go to marketplace",
              functionToRun: () {

                AppNavigator.push(const MarketplaceLoanList());
              },
            )
          ],
        ),
        NovaVSpace(20),
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
        NovaVSpace(20),
        Column(
          children: [
            NovaImagePng(imgPath: NovaAssets.emptyLoan, width: 111.w, height: 129.h,),
            NovaVSpace(16),
            NovaTextWidget(
              title: text,
              textSize: NovaTypography.fontBodyLarge,
            ),
          ],
        ),
        NovaVSpace(20),
      ],
    );

  }
}

