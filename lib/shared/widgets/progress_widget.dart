part of "package:nova/shared/widgets/exports.dart";

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
                color: NovaColors.appPrimaryColorMain500,
                size: 50.0,
              ),
              const SizedBox(
                height: 20,
              ),
              NovaTextWidget(
                title: loadingString,
                textSize: NovaTypography.fontLabelMedium,
                isCenter: true,
                textAlign: TextAlign.center,
                textColor: NovaColors.appPrimaryText,
              ),
            ],
          ).paddingSymmetric(horizontal: 15, vertical: 5),
        ),
      ),
    );
  }
}
