part of "package:peerlendly/shared/widgets/exports.dart";

class PLPaddedWidget extends StatelessWidget {
  final Widget child;

  const PLPaddedWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child.paddingSymmetric(horizontal: 25);
  }
}
