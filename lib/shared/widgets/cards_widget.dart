part of "package:peerlendly/shared/widgets/exports.dart";

class PLCardsWidget extends StatelessWidget {
  final Widget child;

  const PLCardsWidget({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: context.width,
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(34, 34, 34, 0.1),
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ]),
      child: child,
    ).paddingSymmetric(horizontal: 8);
  }
}

class PLCardsWithTextAndImage extends StatelessWidget {
  final Color bgColor;
  final List<Widget> textWidget;
  final Widget imageWidget;


  const PLCardsWithTextAndImage({super.key, required this.bgColor, required this.imageWidget, required this.textWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: PLDecorations.borderRadiusGeometryCircular8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...textWidget.map((e) => e)
              ],
            ).paddingSymmetric(horizontal: 12),
          ),
          imageWidget
        ],
      ).paddingSymmetric(vertical: 12),
    ).marginSymmetric(vertical: 4);
  }
}

