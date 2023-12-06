part of "package:peerlendly/shared/widgets/exports.dart";


class InactivityHandler extends StatefulWidget {
  final Widget child;

  InactivityHandler({required this.child});

  @override
  State<InactivityHandler> createState() => _InactivityHandlerState();
}

class _InactivityHandlerState extends State<InactivityHandler> with WidgetsBindingObserver {
  Timer? timer;
  Timer? networkTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _getNewRefreshToken();
  }

  void didChangeAppLifeCycleState(AppLifecycleState state) {
    super.didChangeDependencies();
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      initializeTimer();
    }
  }

  @override
  void dispose() {
    if(timer != null) timer!.cancel();
    networkTimer!.cancel();

    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      onPanStart: _handleUserInteraction,
      onLongPress: _handleUserInteraction,
      // onHorizontalDragStart: _handleUserInteraction,
      // onHorizontalDragEnd: _handleUserInteraction,
      child: widget.child,
    );
    // return widget.child;
  }

  void _handleUserInteraction([_]) {
    // initializeTimer();
  }

  initializeTimer() {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer.periodic(Duration(minutes: 3), (timer) async {
      AppNavigator.pushAndRemoveUtil(LoginScreen());
    });
  }

  void _getNewRefreshToken() {
    networkTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      // if ((AppConstants.currentWidget != null) && (AppConstants.currentWidget != LoginScreen())) {
        NetworkService.checkIfTokenHasExpiredOutsideDio();
      // }
    });
  }
}
