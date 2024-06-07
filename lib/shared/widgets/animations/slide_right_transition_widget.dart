part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class SlideRightTransitionWidget extends StatefulWidget {
  final Widget child;
  final double delay;
  const SlideRightTransitionWidget({Key? key, required this.child, required this.delay}) : super(key: key);

  @override
  _SlideRightTransitionWidgetState createState() =>
      _SlideRightTransitionWidgetState();
}

class _SlideRightTransitionWidgetState
    extends State<SlideRightTransitionWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _offsetFloat =
        Tween(begin: Offset(0.0, -0.03), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        );

    _offsetFloat.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetFloat,
      child: widget.child,
    );
  }
}
