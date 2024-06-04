part of 'package:nova/modules/profile/exports.dart';


class LoginPinChangeScreen extends StatelessWidget {
  const LoginPinChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        NovaVSpace(8),
                        NovaTextWidget(
                          title: "Login PIN",
                          isTitle: true,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontHeadlineSmall,
                        ),
                        NovaVSpace(4),
                        NovaTextWidget(
                          title: "Your 4-digit login PIN secures your transactions. \nDo not share your PIN with anyone",
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontLabelSmall,
                        ),
                        NovaVSpace(24),
                        NovaPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.oldPin,
                          fillColor: NovaColors.appWhiteColor,
                          maxLength: 4,
                          validation: (val) => val.validateLength(strFieldRequiredError, 4),
                          hintText: "Current PIN",
                          // onChange: (val) => model.listenForLoanApplyChanges(),
                        ),
                        NovaPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.newPin,
                          fillColor: NovaColors.appWhiteColor,
                          maxLength: 4,
                          validation: (val) => val.validateLength(strFieldRequiredError, 4),
                          hintText: "New PIN",
                          // onChange: (val) => model.listenForLoanApplyChanges(),
                        ),
                        NovaPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.confirmNewPin,
                          fillColor: NovaColors.appWhiteColor,
                          maxLength: 4,
                          validation: (val) => val.validateLength(strFieldRequiredError, 4),
                          hintText: "Confirm New PIN",
                          // onChange: (val) => model.listenForLoanApplyChanges(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        NovaButtonRound(
                          textTitle: strProceed,
                          borderRadius:
                          NovaDecorations.borderRadiusGeometryCircular8,
                          loadingString: profileWatcher.loadingString,
                          isLoader: profileWatcher.isLoading,
                          functionToRun: () {
                            // profileWatcher.createTransactionPin();
                          },
                        ),
                        NovaVSpace(24),
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
