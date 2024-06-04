part of 'package:nova/modules/profile/exports.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

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
                key: profileWatcher.formKeyForChangePhoneNumber,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PLVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                          title: strChangePhoneNumber,
                        ),
                        NovaVSpace(16),
                        NovaPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: profileWatcher.newPhoneNumber,
                            onChange: (val) => profileWatcher.listenForChangePhoneNumberChanges(),
                            validation: (val) => val.validatePhoneNumber(strFieldRequiredError),
                            formatter: [FilteringTextInputFormatter.digitsOnly],
                            maxLength: 11,
                            hintText: strNewPhoneNumber),
                        NovaPasswordTextField(
                          controller: profileWatcher.password,
                          textInputTitle: strPassword,
                          hintText: strPassword,
                          validation: (value) => value!.passwordError(),
                          onChange: (val) => profileWatcher.listenForChangePhoneNumberChanges(),
                          textInputAction: TextInputAction.done,
                        ),
                        NovaVSpace(32),
                        NovaButtonRound(
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
