part of 'package:moniepoint_mobile/modules/home/exports.dart';

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MonieEstateVSpace(16),
        const EstateCardSection(
          imageUrl: MonieEstateAssets.estateOne,
          address: 'Gladkova St., 25',
        ),
        MonieEstateVSpace(4),
        Row(
          children: [
            const Expanded(
              child: EstateCardSection(
                imageUrl: MonieEstateAssets.estateTwo,
                address: 'Workato St., 20',
              ),
            ),
            MonieEstateHSpace(8),
            const Expanded(
              child: EstateCardSection(
                imageUrl: MonieEstateAssets.estateThree,
                address: 'Trefoleva St., 43',
              ),
            ),
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 8);
  }
}
