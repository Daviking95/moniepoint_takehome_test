part of "package:nova/shared/widgets/exports.dart";

class NovaTitleSubtitleText extends StatelessWidget {
  final String title;
  final String subTitle;
  final double? titleSize;

  const NovaTitleSubtitleText({super.key, required this.title, required
  this.subTitle, this.titleSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NovaTextWidget(
          title: title,
          isTitle: true,
          textSize: titleSize,
        ),
        const SizedBox(height: 4.0),
        NovaTextWidget(
          title: subTitle,
        ),
      ],
    );
  }
}
