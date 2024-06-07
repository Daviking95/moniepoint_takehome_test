part of 'package:moniepoint_mobile/modules/home/exports.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MonieEstateTextWidget(
          title: "Hi Marina",
          textColor: MonieEstateColors.appSecondaryColor,
          textSize: MonieEstateTypography.fontTitleLarge,
          fontFamily: MonieEstateTypography.fontFamilyMedium,
          textAlign: TextAlign.left,
        ).animate().fade(duration: const Duration(milliseconds: 1200)),
        MonieEstateVSpace(6),
        MonieEstateTextWidget(
          title: "Let's select your perfect place",
          textSize: MonieEstateTypography.fontDisplaySmall,
          fontFamily: MonieEstateTypography.fontFamilyRegular,
          textAlign: TextAlign.left,
        )
            .animate()
        .fade(duration: const Duration(milliseconds: 200),)
            .slideY(duration: const Duration(milliseconds: 1200), begin: .5, end: 0),
      ],
    );
  }
}
