part of "package:nova/shared/widgets/exports.dart";

class NovaTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const NovaTooltip({required this.message,required  this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      // message: message,
      richMessage: WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Container(
            padding: const EdgeInsets.all(10),
            constraints:
            BoxConstraints(maxWidth: context.width / 1.1),
            child: Text(message, maxLines: 3, style: NovaTypography.textLabelSmallStyle,),
          )),
      triggerMode: TooltipTriggerMode.tap,
      height: 24.h,
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(34, 34, 34, 0.1),
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ]),
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      showDuration: const Duration(seconds: 5),
      waitDuration: const Duration(seconds: 1),
      child: child,
    );
  }
}
