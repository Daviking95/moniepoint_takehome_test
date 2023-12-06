part of "package:peerlendly/shared/design_system/exports.dart";

class PrivateGamePinActivationWidget extends StatelessWidget {
  final BuildContext? prevContext;
  final Function(String value) callBackFunc;
  final String gamePin;
  const PrivateGamePinActivationWidget({super.key, this.prevContext, required this.callBackFunc, required this.gamePin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PLVSpace(8),
          PLBackIcon(onTap: () => Navigator.pop(context), isBtmNavWithNoTitle: true),
          PLVSpace(24),
          PLTextWidget(
            title: "Enter code",
            isTitle: true,
            textStyle: PLTypography.textHeadlineSmallStyle,
          ),
          PLVSpace(8),
          PLTextWidget(
            title: "This is a private game. Kindly enter the game pin to view it",
            textSize: PLTypography.fontBodySmall,
            textColor: PLColors.appSecondaryText,
          ),
          PLVSpace(24),
          SizedBox(
            width: context.width,
            child: PinTextField(
              obscureText: true,
              fieldCount: 4,
              boxSize: 52,
              onChange: (value) {
                if (value.length == 4) {
                  Navigator.of(context).pop();
                  callBackFunc(value);
                  return;
                }
              },
              validation: (val) => val.validateString(strFieldRequiredError),
            ),
          ),
          PLVSpace(8),
        ],
      ),
    );
  }
}
