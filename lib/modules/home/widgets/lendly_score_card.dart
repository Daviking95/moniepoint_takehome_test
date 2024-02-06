part of 'package:peerlendly/modules/home/exports.dart';

class LendlyScoreCard extends StatelessWidget {
  final int score;
  final Color bgColor;

  const LendlyScoreCard(
      {Key? key, required this.score, this.bgColor = PLColors.appWhiteColor})
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
          color: bgColor == PLColors.appWhiteColor ? PLColors.appPrimaryColorMain500 : PLColors.appWhiteColor,
          fontWeight: FontWeight.bold,
          // fontFamily: PLTypography.fontFamilyBold,
          fontSize: PLTypography.fontHeadlineSmall,
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
