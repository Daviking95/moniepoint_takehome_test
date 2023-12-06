part of "package:peerlendly/shared/design_system/exports.dart";

class SingleBanterWidget extends StatelessWidget {
  final String iconSet;
  final String title;
  final int index;

  const SingleBanterWidget({Key? key, required this.iconSet, required this.title, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: PLDecorations.borderRadiusGeometryCircular100,
            border: Border.all(
              color: PLColors.appPrimaryColorMain500,
              width: 1.0,
            )
          ),
          child: PLImageSvg(svgPath: iconSet,height: 30, width: 30,).paddingAll(10),
        ),
        PLVSpace(4),
        PLTextWidget(
          title: title.length < 15 ? title : "${title.substring(0, 15)}...",
          textStyle: PLTypography.textLabelSmallStyle,
          textColor: PLColors.appPrimaryColorMain500,
          textSize: PLTypography.fontLabelSmall,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ).marginOnly(left: index == 0 ? 0 : 8, right: 8);
  }
}
