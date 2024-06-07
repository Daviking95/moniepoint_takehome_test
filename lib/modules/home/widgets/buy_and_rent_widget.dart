part of 'package:moniepoint_mobile/modules/home/exports.dart';

class BuyAndRentWidget extends StatelessWidget {
  const BuyAndRentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(child: BuyWidget()),
        MonieEstateHSpace(16),
        const Expanded(child: RentWidget()),
      ],
    );
  }
}


class BuyWidget extends StatelessWidget {
  const BuyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: MonieEstateColors.appPrimaryColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MonieEstateTextWidget(
              title: "Buy",
              textColor: MonieEstateColors.appWhiteColor,
              textSize: MonieEstateTypography.fontTitleMedium,
            ),
            Column(
              children: [
                CounterAnimateWidget(countTo: 1034, color: MonieEstateColors.appWhiteColor,),
                const MonieEstateTextWidget(
                  title: "Offers",
                  textColor: MonieEstateColors.appWhiteColor,
                ),
              ],
            ),
            const SizedBox()
          ],
        ).paddingAll(16),
      ),
    ).animate()
        .fade(duration: const Duration(milliseconds: 1200), delay: const Duration(milliseconds: 10))
        .scale();
  }
}

class RentWidget extends StatelessWidget {
  const RentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: MonieEstateDecorations.borderRadiusGeometryCircular16,
          color: MonieEstateColors.appWhiteColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MonieEstateTextWidget(
              title: "Rent",
              textColor: MonieEstateColors.appSecondaryColor,
              textSize: MonieEstateTypography.fontTitleMedium,
            ),
            Column(
              children: [
                CounterAnimateWidget(countTo: 2212, color: MonieEstateColors.appSecondaryColor,),
                const MonieEstateTextWidget(
                  title: "Offers",
                  textColor: MonieEstateColors.appSecondaryColor,
                ),
              ],
            ),
            const SizedBox()

          ],
        ).paddingAll(16),
      ),
    ).animate()
        .fade(duration: const Duration(milliseconds: 1200), delay: const Duration(milliseconds: 10))
        .scale();
  }
}

