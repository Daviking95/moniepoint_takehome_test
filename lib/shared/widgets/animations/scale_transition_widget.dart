part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class ScaleTransitionWidget extends StatefulWidget {
  final Widget child;
  final double delay;
  const ScaleTransitionWidget({Key? key, required this.child, required this.delay}) : super(key: key);

  @override
  State<ScaleTransitionWidget> createState() => _ScaleTransitionWidgetState();
}

class _ScaleTransitionWidgetState extends State<ScaleTransitionWidget> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: (500 * widget.delay).round()),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animation,
        child: widget.child);
  }
}
