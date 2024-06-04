part of 'package:nova/modules/profile/exports.dart';

class ChangeManagerIdScreen extends StatelessWidget {
  const ChangeManagerIdScreen({Key? key}) : super(key: key);

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
                key: profileWatcher.formKeyForChangeManagerID,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PLVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                          title: strChangeManagerID,
                        ),
                        NovaVSpace(16),
                        NovaPrimaryTextField(
                            textInputType: TextInputType.text,
                            controller: profileWatcher.managerId,
                            onChange: (val) => profileWatcher.listenForManagerIDChanges(),
                            validation: (val) => val.validateString(strFieldRequiredError),
                            hintText: strManagerID),
                        NovaPasswordTextField(
                          controller: profileWatcher.password,
                          textInputTitle: strPassword,
                          hintText: strPassword,
                          validation: (value) => value!.passwordError(),
                          onChange: (val) => profileWatcher.listenForManagerIDChanges(),
                          textInputAction: TextInputAction.done,
                        ),
                        NovaVSpace(32),
                        NovaButtonRound(
                          textTitle: strSubmit,
                          isFormValidated:
                          profileWatcher.isChangeManagerIDFormValidated,
                          isLoader: profileWatcher.isLoading,
                          loadingString: profileWatcher.loadingString,
                          functionToRun: () =>
                              profileWatcher.validateChangeManagerIDForm(context),
                        ),
                      ]),
                ),
              ),
            )),
      ),
    );
  }
}
