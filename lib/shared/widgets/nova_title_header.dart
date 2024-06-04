part of "package:nova/shared/widgets/exports.dart";

class NovaTitleHeader extends StatelessWidget {
  final String title;
  final Color? textColor;
  const NovaTitleHeader({Key? key, required this.title, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NovaTextWidget(
      title: title,
      fontFamily: NovaTypography.fontFamilyBold,
      textStyle: NovaTypography.textHeadlineMediumStyle,
      textSize: NovaTypography.fontHeadlineMedium,
      textColor: textColor ?? NovaColors.appPrimaryColorMain500,
    );
  }
}
