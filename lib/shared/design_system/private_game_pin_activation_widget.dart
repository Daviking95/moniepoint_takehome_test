part of "package:nova/shared/design_system/exports.dart";

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
          NovaVSpace(8),
          NovaBackIcon(onTap: () => Navigator.pop(context), isBtmNavWithNoTitle: true),
          NovaVSpace(24),
          NovaTextWidget(
            title: "Enter code",
            isTitle: true,
            textStyle: NovaTypography.textHeadlineSmallStyle,
          ),
          NovaVSpace(8),
          NovaTextWidget(
            title: "This is a private game. Kindly enter the game pin to view it",
            textSize: NovaTypography.fontBodySmall,
            textColor: NovaColors.appSecondaryText,
          ),
          NovaVSpace(24),
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
          NovaVSpace(8),
        ],
      ),
    );
  }
}
