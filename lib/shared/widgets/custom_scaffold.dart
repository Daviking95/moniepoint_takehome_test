part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class MonieEstateScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingButtonWidget;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBarWidget;

  const MonieEstateScaffold(
      {Key? key,
        required this.body,
        this.backgroundColor,
        this.floatingButtonWidget,
        this.appBarWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

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
            )),
        drawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: true,
        floatingActionButton: floatingButtonWidget,
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
