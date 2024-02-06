part of 'package:peerlendly/modules/wallet/exports.dart';

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
          PLVSpace(8),
          PLBackIcon(onTap: () => Navigator.pop(context), isBtmNavWithNoTitle: true),
          PLVSpace(24),
          PLTextWidget(
            title: "Transaction Pin",
            isTitle: true,
            textSize: PLTypography.fontHeadlineSmall,
            textStyle: PLTypography.textHeadlineSmallStyle,
            textColor: PLColors.appPrimaryText,
          ),
          PLVSpace(10),
          PLTextWidget(
            title: "Kindly enter your 4-digit code ",
            textSize: PLTypography.fontLabelMedium,
            textColor: PLColors.appGrayText,
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
                  callBackFunc(value);
                  Navigator.of(context).pop();
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
