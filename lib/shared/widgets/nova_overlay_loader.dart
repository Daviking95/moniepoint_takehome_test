part of "package:nova/shared/widgets/exports.dart";

class NovaOverlayLoader extends StatelessWidget {
  final Widget child;
  final String loadingString;
  final bool startLoader;

  const NovaOverlayLoader({Key? key, required this.child, this.loadingString = "", this.startLoader = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(isLoading: startLoader, progressIndicator: ProgressWidget(loadingString: loadingString), color: NovaColors.appWhiteColor, opacity: 0.9, child: child);
  }
}

