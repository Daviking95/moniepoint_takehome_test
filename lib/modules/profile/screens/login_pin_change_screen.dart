part of 'package:peerlendly/modules/profile/exports.dart';


class LoginPinChangeScreen extends StatelessWidget {
  const LoginPinChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        PLVSpace(8),
                        PLTextWidget(
                          title: "Login PIN",
                          isTitle: true,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontHeadlineSmall,
                        ),
                        PLVSpace(4),
                        PLTextWidget(
                          title: "Your 4-digit login PIN secures your transactions. \nDo not share your PIN with anyone",
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontLabelSmall,
                        ),
                        PLVSpace(24),
                        PLPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.oldPin,
                          fillColor: PLColors.appWhiteColor,
                          maxLength: 4,
                          validation: (val) => val.validateLength(strFieldRequiredError, 4),
                          hintText: "Current PIN",
                          // onChange: (val) => model.listenForLoanApplyChanges(),
                        ),
                        PLPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.newPin,
                          fillColor: PLColors.appWhiteColor,
                          maxLength: 4,
                          validation: (val) => val.validateLength(strFieldRequiredError, 4),
                          hintText: "New PIN",
                          // onChange: (val) => model.listenForLoanApplyChanges(),
                        ),
                        PLPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.confirmNewPin,
                          fillColor: PLColors.appWhiteColor,
                          maxLength: 4,
                          validation: (val) => val.validateLength(strFieldRequiredError, 4),
                          hintText: "Confirm New PIN",
                          // onChange: (val) => model.listenForLoanApplyChanges(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: strProceed,
                          borderRadius:
                          PLDecorations.borderRadiusGeometryCircular8,
                          loadingString: profileWatcher.loadingString,
                          isLoader: profileWatcher.isLoading,
                          functionToRun: () {
                            // profileWatcher.createTransactionPin();
                          },
                        ),
                        PLVSpace(24),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
