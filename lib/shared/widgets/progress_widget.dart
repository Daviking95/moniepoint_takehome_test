part of "package:peerlendly/shared/widgets/exports.dart";

class ProgressWidget extends StatelessWidget {
  final String loadingString;

  ProgressWidget({this.loadingString = ""});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: context.width / 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpinKitCircle(
                color: PLColors.appPrimaryColorMain500,
                size: 50.0,
              ),
              const SizedBox(
                height: 20,
              ),
              PLTextWidget(
                title: loadingString,
                textSize: PLTypography.fontLabelMedium,
                isCenter: true,
                textAlign: TextAlign.center,
                textColor: PLColors.appPrimaryText,
              ),
            ],
          ).paddingSymmetric(horizontal: 15, vertical: 5),
        ),
      ),
    );
  }
}
