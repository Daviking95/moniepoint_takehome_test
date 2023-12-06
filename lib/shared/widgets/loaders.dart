part of "package:peerlendly/shared/widgets/exports.dart";

class PLProgressIndicator extends StatefulWidget {
  final bool showLoader;

  const PLProgressIndicator({super.key, this.showLoader = false});

  @override
  _PLProgressIndicatorState createState() => _PLProgressIndicatorState();
}

class _PLProgressIndicatorState extends State<PLProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return widget.showLoader
        ? Column(
            children: [
              PLVSpace(32),
              LinearProgressIndicator(
                backgroundColor: context.theme.primaryColor,
                valueColor: const AlwaysStoppedAnimation(PLColors
                    .appSecondaryColorMain500),
                minHeight: 5,
              ),
              PLVSpace(10)
            ],
          )
        : Container(child: PLVSpace(42),);
  }
}
