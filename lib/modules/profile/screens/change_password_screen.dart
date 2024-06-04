part of 'package:nova/modules/profile/exports.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

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
            key: profileWatcher.formKeyForChangePassword,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PLVSpace(48),
                    NovaBackIcon(
                      onTap: () => Navigator.pop(context),
                      title: strChangePassword,
                    ),
                    NovaVSpace(16),
                    NovaPasswordTextField(
                      controller: profileWatcher.oldPassword,
                      textInputTitle: strOldPassword,
                      hintText: strOldPassword,
                      validation: (value) => value!.passwordError(),
                      onChange: (val) =>
                          profileWatcher.listenForChangePasswordChanges(),
                      textInputAction: TextInputAction.next,
                    ),
                    NovaPasswordTextField(
                      controller: profileWatcher.newPassword,
                      textInputTitle: strNewPassword,
                      hintText: strNewPassword,
                      validation: (value) => value!.passwordError(),
                      onChange: (val) =>
                          profileWatcher.listenForChangePasswordChanges(),
                      textInputAction: TextInputAction.done,
                    ),
                    NovaVSpace(32),
                    NovaButtonRound(
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
