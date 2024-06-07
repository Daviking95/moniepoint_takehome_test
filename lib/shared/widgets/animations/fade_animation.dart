part of "package:moniepoint_mobile/shared/widgets/exports.dart";

// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;
//
//   const FadeAnimation({Key? key, required this.delay, required this.child})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PlayAnimationBuilder<double>(
//       tween: Tween(begin: 100.0, end: 200.0),
//       duration: const Duration(seconds: 1),
//       builder: (context, value, _) {
//         return child;
//       },
//       onCompleted: () {
//         // do something ...
//       },
//     );
//   }
// }



class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({super.key, required this.delay, required this.child});

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: (500 * widget.delay).round()),
        vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);


    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: widget.child);
  }
}