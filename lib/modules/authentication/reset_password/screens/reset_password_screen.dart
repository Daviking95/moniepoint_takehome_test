part of 'package:peerlendly/modules/authentication/reset_password/exports.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordProvider>(
      vmBuilder: (context) => ResetPasswordProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ResetPasswordProvider model) {

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
                            title: strResetPassword,
                            isTitle: true,
                            textColor: PLColors.appWhiteColor,
                            textStyle: PLTypography.textHeadlineSmallStyle,
                          ),
                          const SizedBox(height: 10.0),
                          PLTextWidget(
                            title: strResetPasswordDesc,
                            textColor: PLColors.appWhiteColor,
                          ),
                          PLVSpace(24),
                          SizedBox(
                            width: context.width,
                            child: PinTextField(
                              obscureText: false,
                              fieldCount: 4,
                              controller: model.otp,
                              onChange: (value) {
                                model.listenForChanges();
                              },
                              validation: (val) => val.validateString(strFieldRequiredError),
                            ),
                          ),
                          PLVSpace(32),
                          PLButtonRound(
                            textTitle: strContinue,
                            isFormValidated: model.isFormValidated,
                            isLoader: model.isLoading,
                            loadingString: model.loadingString,
                            functionToRun: () => model.validateForm(context),
                          ),
                          PLVSpace(14),
                          ResentOtpWidget(context, (){}, (){}, true),
                          PLVSpace(16),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, AppRoutes.login),
                            child: Center(
                              child: PLTextWidget(
                                title: strBackToLogin,
                                textColor: PLColors.appSecondaryColorMain500,
                              ),
                            ).paddingAll(10),
                          ),
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
