part of "package:peerlendly/shared/widgets/exports.dart";

class PLPlusIcon extends StatelessWidget {
  final Function onTap;

  const PLPlusIcon({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: PLDecorations.borderRadiusGeometryCircular4,
          color: PLColors.appPlusButtonColor,
        ),
        child: Icon(Icons.add, size: 24.sp,),
      ),
    );
  }
}
