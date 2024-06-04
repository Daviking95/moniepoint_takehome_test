part of 'package:nova/modules/wallet/exports.dart';

class TransferPinActivationWidget extends StatelessWidget {
  final BuildContext? prevContext;
  final Function(String value) callBackFunc;
  const TransferPinActivationWidget({super.key, this.prevContext, required this.callBackFunc});

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
            title: "Transaction Pin",
            isTitle: true,
            textSize: NovaTypography.fontHeadlineSmall,
            textStyle: NovaTypography.textHeadlineSmallStyle,
            textColor: NovaColors.appPrimaryText,
          ),
          NovaVSpace(10),
          NovaTextWidget(
            title: "Kindly enter your 4-digit code ",
            textSize: NovaTypography.fontLabelMedium,
            textColor: NovaColors.appGrayText,
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
                  callBackFunc(value);
                  Navigator.of(context).pop();
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
