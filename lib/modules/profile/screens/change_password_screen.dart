part of 'package:peerlendly/modules/profile/exports.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

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
            key: profileWatcher.formKeyForChangePassword,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PLVSpace(48),
                    PLBackIcon(
                      onTap: () => Navigator.pop(context),
                      title: strChangePassword,
                    ),
                    PLVSpace(16),
                    PLPasswordTextField(
                      controller: profileWatcher.oldPassword,
                      textInputTitle: strOldPassword,
                      hintText: strOldPassword,
                      validation: (value) => value!.passwordError(),
                      onChange: (val) =>
                          profileWatcher.listenForChangePasswordChanges(),
                      textInputAction: TextInputAction.next,
                    ),
                    PLPasswordTextField(
                      controller: profileWatcher.newPassword,
                      textInputTitle: strNewPassword,
                      hintText: strNewPassword,
                      validation: (value) => value!.passwordError(),
                      onChange: (val) =>
                          profileWatcher.listenForChangePasswordChanges(),
                      textInputAction: TextInputAction.done,
                    ),
                    PLVSpace(32),
                    PLButtonRound(
                      textTitle: strSubmit,
                      isFormValidated:
                          profileWatcher.isChangePasswordFormValidated,
                      isLoader: profileWatcher.isLoading,
                      loadingString: profileWatcher.loadingString,
                      functionToRun: () =>
                          profileWatcher.validateChangePasswordForm(context),
                    ),
                  ]),
            ),
          ),
        )),
      ),
    );
  }
}
