part of 'package:nova/modules/authentication/reset_password/exports.dart';

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
                            title: strResetPassword,
                            isTitle: true,
                            textColor: NovaColors.appWhiteColor,
                            textStyle: NovaTypography.textHeadlineSmallStyle,
                          ),
                          const SizedBox(height: 10.0),
                          NovaTextWidget(
                            title: strResetPasswordDesc,
                            textColor: NovaColors.appWhiteColor,
                          ),
                          NovaVSpace(24),
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
                          NovaVSpace(32),
                          NovaButtonRound(
                            textTitle: strContinue,
                            isFormValidated: model.isFormValidated,
                            isLoader: model.isLoading,
                            loadingString: model.loadingString,
                            functionToRun: () => model.validateForm(context),
                          ),
                          NovaVSpace(14),
                          ResentOtpWidget(context, (){}, (){}, true),
                          NovaVSpace(16),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, AppRoutes.login),
                            child: Center(
                              child: NovaTextWidget(
                                title: strBackToLogin,
                                textColor: NovaColors.appSecondaryColorMain500,
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
