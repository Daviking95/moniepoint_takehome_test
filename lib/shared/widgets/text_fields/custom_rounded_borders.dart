part of "package:peerlendly/shared/widgets/exports.dart";

class CustomRoundedBorders extends StatelessWidget {

  final Widget child;
  const CustomRoundedBorders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: ShapeDecoration(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: PLDecorations.borderRadiusGeometryCircular8
      //   ),
      //   color: Colors.white,
      // ),
      child: child.marginSymmetric(vertical: 8),
    );
  }
}
