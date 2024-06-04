part of "package:nova/shared/widgets/exports.dart";

class NovaProgressIndicator extends StatefulWidget {
  final bool showLoader;

  const NovaProgressIndicator({super.key, this.showLoader = false});

  @override
  _NovaProgressIndicatorState createState() => _NovaProgressIndicatorState();
}

class _NovaProgressIndicatorState extends State<NovaProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return widget.showLoader
        ? Column(
            children: [
              NovaVSpace(32),
              LinearProgressIndicator(
                backgroundColor: context.theme.primaryColor,
                valueColor: const AlwaysStoppedAnimation(NovaColors
                    .appSecondaryColorMain500),
                minHeight: 5,
              ),
              NovaVSpace(10)
            ],
          )
        : Container(child: NovaVSpace(42),);
  }
}
