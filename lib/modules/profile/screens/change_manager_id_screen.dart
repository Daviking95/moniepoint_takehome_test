part of 'package:peerlendly/modules/profile/exports.dart';

class ChangeManagerIdScreen extends StatelessWidget {
  const ChangeManagerIdScreen({Key? key}) : super(key: key);

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
                key: profileWatcher.formKeyForChangeManagerID,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                          title: strChangeManagerID,
                        ),
                        PLVSpace(16),
                        PLPrimaryTextField(
                            textInputType: TextInputType.text,
                            controller: profileWatcher.managerId,
                            onChange: (val) => profileWatcher.listenForManagerIDChanges(),
                            validation: (val) => val.validateString(strFieldRequiredError),
                            hintText: strManagerID),
                        PLPasswordTextField(
                          controller: profileWatcher.password,
                          textInputTitle: strPassword,
                          hintText: strPassword,
                          validation: (value) => value!.passwordError(),
                          onChange: (val) => profileWatcher.listenForManagerIDChanges(),
                          textInputAction: TextInputAction.done,
                        ),
                        PLVSpace(32),
                        PLButtonRound(
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
