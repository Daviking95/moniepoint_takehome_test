part of 'package:peerlendly/modules/profile/exports.dart';
class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({Key? key}) : super(key: key);


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
              child: Form(
                key: profileWatcher.formKeyForChangePin,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                          title: strChangePin,
                        ),
                        PLVSpace(16),
                        PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            formatter: FilteringTextInputFormatter.digitsOnly,
                            controller: profileWatcher.oldPin,
                            maxLength: 4,
                            onChange: (val) => profileWatcher.listenForChangePinChanges(),
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: strOldPin),
                        PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            formatter: FilteringTextInputFormatter.digitsOnly,
                            controller: profileWatcher.newPin,
                            maxLength: 4,
                            onChange: (val) => profileWatcher.listenForChangePinChanges(),
                            validation: (val) => val.validateLength(strFieldRequiredError, 4),
                            hintText: strNewPin),
                        PLVSpace(32),
                        PLButtonRound(
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
