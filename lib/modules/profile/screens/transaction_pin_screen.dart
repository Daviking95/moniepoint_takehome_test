part of 'package:peerlendly/modules/profile/exports.dart';


class TransactionPinScreen extends StatelessWidget {
  const TransactionPinScreen({Key? key}) : super(key: key);

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
                child: Form(
                  key: profileWatcher.transationPinFormKey,
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
                            title: "Transaction PIN",
                            isTitle: true,
                            textStyle: PLTypography.textHeadlineMediumStyle,
                            textSize: PLTypography.fontHeadlineSmall,
                          ),
                          PLVSpace(4),
                          PLTextWidget(
                            title: "Your 4-digit transaction PIN secures your transactions. \nDo not share your PIN with anyone",
                            textStyle: PLTypography.textHeadlineMediumStyle,
                            textSize: PLTypography.fontLabelSmall,
                          ),
                          PLVSpace(24),
                          if((AppData.getUserProfileResponseModel?.transactionPin ?? "").isNotEmpty && (AppData.getUserProfileResponseModel?.transactionPin ?? "") != "N/A")
                          PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.oldPin,
                            fillColor: PLColors.appWhiteColor,
                            maxLength: 4,
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: "Current PIN",
                            // onChange: (val) => model.listenForCreatePinChanges(),
                          ),
                          PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.newPin,
                            fillColor: PLColors.appWhiteColor,
                            maxLength: 4,
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: "New PIN",
                            onChange: (val) => profileWatcher.listenForCreatePinChanges(),
                          ),
                          PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.confirmNewPin,
                            fillColor: PLColors.appWhiteColor,
                            maxLength: 4,
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: "Confirm New PIN",
                            onChange: (val) => profileWatcher.listenForCreatePinChanges(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PLButtonRound(
                            textTitle: (AppData.getUserProfileResponseModel?.transactionPin ?? "").isNotEmpty  && (AppData.getUserProfileResponseModel?.transactionPin ?? "") != "N/A" ? strResetPassword : strProceed,
                            borderRadius:
                            PLDecorations.borderRadiusGeometryCircular8,
                            isFormValidated: profileWatcher.isChangePinFormValidated,
                            loadingString: profileWatcher.loadingString,
                            isLoader: profileWatcher.isLoading,
                            functionToRun: () {
                              if((AppData.getUserProfileResponseModel?.transactionPin ?? "").isNotEmpty && (AppData.getUserProfileResponseModel?.transactionPin ?? "") != "N/A")
                                profileWatcher.resetTransactionPin(context);
                              else
                              profileWatcher.createTransactionPin(context);
                            },
                          ),
                          PLVSpace(24),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
