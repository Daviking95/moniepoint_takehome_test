part of "package:nova/shared/widgets/exports.dart";

class NovaScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingButtonWidget;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBarWidget;

  const NovaScaffold(
      {Key? key,
        required this.body,
        this.backgroundColor,
        this.floatingButtonWidget,
        this.appBarWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor ?? context.theme.scaffoldBackgroundColor,
        appBar: appBarWidget,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: body
              // EasyDebounceBuilder(
              //     delay: const Duration(milliseconds: 1000),
              //     builder: (context, debounce) {
              //       return child;
              //     })
            )),
        // key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: true,
        floatingActionButton: floatingButtonWidget,
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
