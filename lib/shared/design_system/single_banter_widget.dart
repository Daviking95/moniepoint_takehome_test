part of "package:nova/shared/design_system/exports.dart";

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
            borderRadius: NovaDecorations.borderRadiusGeometryCircular100,
            border: Border.all(
              color: NovaColors.appPrimaryColorMain500,
              width: 1.0,
            )
          ),
          child: NovaImageSvg(svgPath: iconSet,height: 30, width: 30,).paddingAll(10),
        ),
        NovaVSpace(4),
        NovaTextWidget(
          title: title.length < 15 ? title : "${title.substring(0, 15)}...",
          textStyle: NovaTypography.textLabelSmallStyle,
          textColor: NovaColors.appPrimaryColorMain500,
          textSize: NovaTypography.fontLabelSmall,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ).marginOnly(left: index == 0 ? 0 : 8, right: 8);
  }
}
