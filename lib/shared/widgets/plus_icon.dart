part of "package:nova/shared/widgets/exports.dart";

class NovaPlusIcon extends StatelessWidget {
  final Function onTap;

  const NovaPlusIcon({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: NovaDecorations.borderRadiusGeometryCircular4,
          color: NovaColors.appPlusButtonColor,
        ),
        child: Icon(Icons.add, size: 24.sp,),
      ),
    );
  }
}
