part of 'package:peerlendly/modules/profile/exports.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

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
                key: profileWatcher.formKeyForChangePhoneNumber,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                          title: strChangePhoneNumber,
                        ),
                        PLVSpace(16),
                        PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.newPhoneNumber,
                            onChange: (val) => profileWatcher.listenForChangePhoneNumberChanges(),
                            validation: (val) => val.validatePhoneNumber(strFieldRequiredError),
                            formatter: FilteringTextInputFormatter.digitsOnly,
                            maxLength: 11,
                            hintText: strNewPhoneNumber),
                        PLPasswordTextField(
                          controller: profileWatcher.password,
                          textInputTitle: strPassword,
                          hintText: strPassword,
                          validation: (value) => value!.passwordError(),
                          onChange: (val) => profileWatcher.listenForChangePhoneNumberChanges(),
                          textInputAction: TextInputAction.done,
                        ),
                        PLVSpace(32),
                        PLButtonRound(
                          textTitle: strSubmit,
                          isFormValidated:
                          profileWatcher.isChangePhoneNumberFormValidated,
                          isLoader: profileWatcher.isLoading,
                          loadingString: profileWatcher.loadingString,
                          functionToRun: () =>
                              profileWatcher.validateChangePhoneNumberForm(context),
                        ),
                      ]),
                ),
              ),
            )),
      ),
    );
  }
}
