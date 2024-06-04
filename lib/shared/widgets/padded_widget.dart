part of "package:nova/shared/widgets/exports.dart";

class NovaPaddedWidget extends StatelessWidget {
  final Widget child;

  const NovaPaddedWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child.paddingSymmetric(horizontal: 25);
  }
}
