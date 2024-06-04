part of 'package:nova/modules/profile/exports.dart';
class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({Key? key}) : super(key: key);


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
              child: Form(
                key: profileWatcher.formKeyForChangePin,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PLVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                          title: strChangePin,
                        ),
                        NovaVSpace(16),
                        NovaPrimaryTextField(
                            textInputType: TextInputType.number,
                            formatter: [FilteringTextInputFormatter.digitsOnly],
                            controller: profileWatcher.oldPin,
                            maxLength: 4,
                            onChange: (val) => profileWatcher.listenForChangePinChanges(),
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: strOldPin),
                        NovaPrimaryTextField(
                            textInputType: TextInputType.number,
                            formatter: [FilteringTextInputFormatter.digitsOnly],
                            controller: profileWatcher.newPin,
                            maxLength: 4,
                            onChange: (val) => profileWatcher.listenForChangePinChanges(),
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: strNewPin),
                        NovaVSpace(32),
                        NovaButtonRound(
                          textTitle: strSubmit,
                          isFormValidated:
                          profileWatcher.isChangePinFormValidated,
                          isLoader: profileWatcher.isLoading,
                          loadingString: profileWatcher.loadingString,
                          functionToRun: () =>
                              profileWatcher.validateChangePinForm(context),
                        ),
                      ]),
                ),
              ),
            )),
      ),
    );
  }
}
