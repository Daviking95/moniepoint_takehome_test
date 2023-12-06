part of 'package:peerlendly/modules/authentication/reset_password/exports.dart';

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          PLAssets.loginBgPng,
                        ),
                        fit: BoxFit.cover)),
                child: PLPaddedWidget(
                  child: Form(
                    key: model.formKey,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PLVSpace(86),
                          PLTextWidget(
                            title: strCreateNewPassword,
                            isTitle: true,
                            textColor: PLColors.appWhiteColor,
                            textStyle: PLTypography.textHeadlineSmallStyle,
                          ),
                          const SizedBox(height: 10.0),
                          PLTextWidget(
                            title: strCreateNewPasswordDesc,
                            textColor: PLColors.appWhiteColor,
                          ),
                          PLVSpace(24),
                          PLPasswordTextField(
                            controller: model.password,
                            textInputTitle: strPassword,
                            hintText: strPassword,
                            onChange: (val) => model.listenForChanges(),
                            validation: (value) => value!.passwordError(),
                            textInputAction: TextInputAction.done,
                          ),
                          PLPasswordTextField(
                            controller: model.confirmPassword,
                            textInputTitle: strConfirmPassword,
                            hintText: strConfirmPassword,
                            onChange: (val) => model.listenForChanges(),
                            validation: (value) => value!.comparePassword(model.password.text),
                            textInputAction: TextInputAction.done,
                          ),
                          PLVSpace(32),
                          PLButtonRound(
                            textTitle: strCreate,
                            isLoader: model.isLoading,
                            loadingString: model.loadingString,
                            isFormValidated: model.isFormValidated,
                            functionToRun: () => model.validateForm(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
