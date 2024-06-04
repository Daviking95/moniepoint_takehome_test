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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          NovaAssets.loginBgPng,
                        ),
                        fit: BoxFit.cover)),
                child: NovaPaddedWidget(
                  child: Form(
                    key: model.formKey,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NovaVSpace(86),
                          NovaTextWidget(
                            title: strCreateNewPassword,
                            isTitle: true,
                            textColor: NovaColors.appWhiteColor,
                            textStyle: NovaTypography.textHeadlineSmallStyle,
                          ),
                          const SizedBox(height: 10.0),
                          NovaTextWidget(
                            title: strCreateNewPasswordDesc,
                            textColor: NovaColors.appWhiteColor,
                          ),
                          NovaVSpace(24),
                          NovaPasswordTextField(
                            controller: model.password,
                            textInputTitle: strPassword,
                            hintText: strPassword,
                            onChange: (val) => model.listenForChanges(),
                            validation: (value) => value!.passwordError(),
                            textInputAction: TextInputAction.done,
                          ),
                          NovaPasswordTextField(
                            controller: model.confirmPassword,
                            textInputTitle: strConfirmPassword,
                            hintText: strConfirmPassword,
                            onChange: (val) => model.listenForChanges(),
                            validation: (value) => value!.comparePassword(model.password.text),
                            textInputAction: TextInputAction.done,
                          ),
                          NovaVSpace(32),
                          NovaButtonRound(
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
