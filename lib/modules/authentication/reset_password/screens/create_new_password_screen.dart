part of 'package:nova/modules/authentication/reset_password/exports.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<ChangePasswordProvider>(
      vmBuilder: (context) => ChangePasswordProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ChangePasswordProvider model) {
    final changePasswordWatcher = context.watch<ChangePasswordProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: NovaPaddedWidget(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        NovaVSpace(60),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        NovaVSpace(4),
                        NovaImagePng(
                          imgPath: NovaAssets.logoPng,
                          width: 98.w,
                          height: 31.h,
                        ),
                        NovaVSpace(32),
                        const NovaTitleHeader(
                          title: "Create New Password",
                        ),
                        NovaVSpace(16),
                        NovaTextWidget(
                          title: "Please enter and confirm your new password.",
                          textColor: NovaColors.appBlackColor,
                          textSize: NovaTypography.fontLabelLarge,
                          textAlign: TextAlign.center,
                        ),
                        NovaTextWidget(
                          title: "You will need to login after you reset.",
                          textColor: NovaColors.appBlackColor,
                          textSize: NovaTypography.fontLabelLarge,
                          textAlign: TextAlign.center,
                        ),
                        NovaVSpace(32),
                        NovaPasswordTextField(
                          controller: model.password,
                          textInputTitle: strPassword,
                          hintText: strPassword,
                          onChange: (val) =>
                              changePasswordWatcher.listenForChanges(),
                          validation: (value) => value!.passwordError(),
                          textInputAction: TextInputAction.next,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: NovaTextWidget(
                            title: "Must contain 8 characters",
                            textColor: NovaColors.appBlackColor,
                            textSize: NovaTypography.fontLabelSmall,
                            fontFamily: NovaTypography.fontFamilyMedium,
                          ),
                        ),
                        NovaVSpace(16),
                        NovaPasswordTextField(
                          controller: model.confirmPassword,
                          textInputTitle: strConfirmPassword,
                          hintText: strConfirmPassword,
                          onChange: (val) =>
                              changePasswordWatcher.listenForChanges(),
                          validation: (value) =>
                              value!.comparePassword(model.password.text),
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        NovaVSpace(40),
                        NovaButtonRound(
                            textTitle: "Reset Password",
                            loadingString: model.loadingString,
                            isLoader: model.isLoading,
                            hasBgImg: true,
                            // isFormValidated: model.isDetailsSetupFormValidated,
                            functionToRun: () {
                              changePasswordWatcher.validateForm(context);
                            }),
                        NovaVSpace(32)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
