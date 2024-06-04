part of 'package:nova/modules/profile/exports.dart';


class TransactionPinScreen extends StatelessWidget {
  const TransactionPinScreen({Key? key}) : super(key: key);

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
                child: Form(
                  key: profileWatcher.transationPinFormKey,
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
                            title: "Transaction PIN",
                            isTitle: true,
                            textStyle: NovaTypography.textHeadlineMediumStyle,
                            textSize: NovaTypography.fontHeadlineSmall,
                          ),
                          NovaVSpace(4),
                          NovaTextWidget(
                            title: "Your 4-digit transaction PIN secures your transactions. \nDo not share your PIN with anyone",
                            textStyle: NovaTypography.textHeadlineMediumStyle,
                            textSize: NovaTypography.fontLabelSmall,
                          ),
                          NovaVSpace(24),
                          if((AppData.getUserProfileResponseModel?.transactionPin ?? "").isNotEmpty && (AppData.getUserProfileResponseModel?.transactionPin ?? "") != "N/A")
                          NovaPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.oldPin,
                            fillColor: NovaColors.appWhiteColor,
                            maxLength: 4,
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: "Current PIN",
                            // onChange: (val) => model.listenForCreatePinChanges(),
                          ),
                          NovaPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.newPin,
                            fillColor: NovaColors.appWhiteColor,
                            maxLength: 4,
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: "New PIN",
                            onChange: (val) => profileWatcher.listenForCreatePinChanges(),
                          ),
                          NovaPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.confirmNewPin,
                            fillColor: NovaColors.appWhiteColor,
                            maxLength: 4,
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: "Confirm New PIN",
                            onChange: (val) => profileWatcher.listenForCreatePinChanges(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          NovaButtonRound(
                            textTitle: (AppData.getUserProfileResponseModel?.transactionPin ?? "").isNotEmpty  && (AppData.getUserProfileResponseModel?.transactionPin ?? "") != "N/A" ? strResetPassword : strProceed,
                            borderRadius:
                            NovaDecorations.borderRadiusGeometryCircular8,
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
                          NovaVSpace(24),
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
