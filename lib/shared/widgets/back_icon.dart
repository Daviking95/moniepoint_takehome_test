part of "package:peerlendly/shared/widgets/exports.dart";

class PLBackIcon extends StatelessWidget {
  final Function onTap;
  final String? title;
  final bool isBtmNavWithNoTitle;
  final Color? titleColor;
  final Widget? extraWidget;

  final bool isCancel;

  const PLBackIcon({required this.onTap, this.title, this.isBtmNavWithNoTitle = false, this.titleColor, this.extraWidget, this.isCancel = false, super.key});

  @override
  Widget build(BuildContext context) {
    return isBtmNavWithNoTitle
        ? Center(
            child: SizedBox(
              width: 74,
              child: Divider(
                height: 2,
                thickness: 4,
                color: PLColors.neutralColor400.withOpacity(.5),
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => onTap(),
                child: isCancel ? PLImageSvg(svgPath: PLAssets.closeIcon, width: 15.w, height: 15.h,) : CircleAvatar(
                  backgroundColor: const Color(0x4CD9E1FC), // PLColors.neutralColor300.withOpacity(.2),
                  maxRadius: 20,
                  child: Icon(
                    LineIcons.alternateLongArrowLeft,
                    color: titleColor ?? PLColors.neutralColor600,
                    size: 30,
                  ),
                ).marginOnly(top: 8, right: 8, bottom: 8),
              ),
              if (title != null && title!.isNotEmpty) ...[
                PLHSpace(22),
                Expanded(
                  child: PLTextWidget(
                    title: title.toString().toTitleCase,
                    isTitle: true,
                    textColor: titleColor,
                    textStyle: PLTypography.textHeadlineMediumStyle,
                    textSize: PLTypography.fontTitleMedium,
                  ),
                ),
              ],
              extraWidget ?? PLHSpace(80)
            ],
          );
  }
}

class PLForwardIcon extends StatelessWidget {
  final Function onTap;

  const PLForwardIcon({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: PLImageSvg(
        svgPath: PLAssets.forwardArrowIcon,
        width: 8.w,
      ).marginOnly(top: 8, right: 8, bottom: 8),
    );
  }
}
