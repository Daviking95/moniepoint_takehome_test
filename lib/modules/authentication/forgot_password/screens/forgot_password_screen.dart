part of 'package:nova/modules/authentication/forgot_password/exports.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordProvider>(
      vmBuilder: (context) => ForgotPasswordProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ForgotPasswordProvider model) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: NovaPaddedWidget(
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
                        title: "Forgot Password",
                      ),
                      NovaVSpace(16),
                      NovaTextWidget(
                        title: "No worries! Enter your email address below and we will send you a code to reset password.",
                        textColor: NovaColors.appBlackColor,
                        textSize: NovaTypography.fontLabelLarge,
                        textAlign: TextAlign.center,
                      ),
                      NovaVSpace(32),
                      NovaPrimaryTextField(
                        textInputType: TextInputType.emailAddress,
                        controller: model.email,
                        onChange: (val) => model.listenForChanges(),
                        validation: (val) => val.validateEmail(strEmailError),
                        hintText: strEmail,
                        textInputAction: TextInputAction.done,

                      ),
                    ],
                  ),
                  Column(
                    children: [
                      NovaVSpace(40),
                      NovaButtonRound(
                          textTitle: "Send Code",
                          loadingString: model.loadingString,
                          isLoader: model.isLoading,
                          hasBgImg: true,
                          isFormValidated: model.isFormValidated,
                          functionToRun: () {
                            model.validateForm(context);
                          }
                      ),
                      NovaVSpace(32)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
