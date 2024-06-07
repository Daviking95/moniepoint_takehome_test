part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class MonieEstatePaddedWidget extends StatelessWidget {
  final Widget child;

  const MonieEstatePaddedWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child.paddingSymmetric(horizontal: 20);
  }
}
