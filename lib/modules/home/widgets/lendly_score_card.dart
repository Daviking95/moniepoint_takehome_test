part of 'package:nova/modules/home/exports.dart';

class LendlyScoreCard extends StatelessWidget {
  final int score;
  final Color bgColor;

  const LendlyScoreCard(
      {Key? key, required this.score, this.bgColor = NovaColors.appWhiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      color: bgColor,
      elevation: 0,
      child: Text(
        score.toString(),
        style: TextStyle(
          color: bgColor == NovaColors.appWhiteColor ? NovaColors.appPrimaryColorMain500 : NovaColors.appWhiteColor,
          fontWeight: FontWeight.bold,
          // fontFamily: PLTypography.fontFamilyBold,
          fontSize: NovaTypography.fontHeadlineSmall,
        ),
      )
          // PLTextWidget(
          //   title: (score).toString(),
          //   isCenter: true,
          //   textColor: bgColor == PLColors.appWhiteColor ? PLColors.appPrimaryColorMain500 : PLColors.appWhiteColor,
          //   fontWeight: FontWeight.bold,
          //   fontFamily: PLTypography.fontFamilyBold,
          //   textSize: PLTypography.fontHeadlineSmall,
          // )
          .paddingAll(5),
    );
  }
}
