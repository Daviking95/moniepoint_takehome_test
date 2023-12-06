part of "package:peerlendly/shared/widgets/exports.dart";

class PLOverlayLoader extends StatelessWidget {
  final Widget child;
  final String loadingString;
  final bool startLoader;

  const PLOverlayLoader({Key? key, required this.child, this.loadingString = "", this.startLoader = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(isLoading: startLoader, progressIndicator: ProgressWidget(loadingString: loadingString), color: PLColors.appWhiteColor, opacity: 0.9, child: child);
  }
}

