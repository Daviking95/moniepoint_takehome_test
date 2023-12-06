part of "package:peerlendly/shared/widgets/exports.dart";

class PLTitleSubtitleText extends StatelessWidget {
  final String title;
  final String subTitle;
  final double? titleSize;

  const PLTitleSubtitleText({super.key, required this.title, required
  this.subTitle, this.titleSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PLTextWidget(
          title: title,
          isTitle: true,
          textSize: titleSize,
        ),
        const SizedBox(height: 4.0),
        PLTextWidget(
          title: subTitle,
        ),
      ],
    );
  }
}
