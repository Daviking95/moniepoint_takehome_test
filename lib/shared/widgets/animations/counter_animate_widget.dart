part of "package:moniepoint_mobile/shared/widgets/exports.dart";


class CounterAnimateWidget extends StatefulWidget {
  final int countTo;
  final Color color;

  CounterAnimateWidget({required this.countTo, required this.color});

  @override
  _CounterAnimateWidgetState createState() => _CounterAnimateWidgetState();
}

class _CounterAnimateWidgetState extends State<CounterAnimateWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<int> _animation = IntTween(
    begin: 0,
    end: widget.countTo,
  ).animate(_controller);

  @override
  void initState() {
    super.initState();

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return MonieEstateTextWidget(
          title: '${_animation.value}',
          textColor: widget.color,
          fontFamily: MonieEstateTypography.fontFamilyBlack,
          textSize: MonieEstateTypography.fontDisplaySmall,
        );
      },
    );
  }
}