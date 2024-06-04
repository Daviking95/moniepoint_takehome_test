part of 'package:nova/modules/authentication/login/exports.dart';

class LoginScreen extends StatelessWidget {
  final bool isSwitchAccount;
  final String otp;
  final String email;

  const LoginScreen(
      {Key? key, this.isSwitchAccount = false, this.otp = "", this.email = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      vmBuilder: (context) => LoginProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoginProvider model) {
    final loginWatcher = context.watch<LoginProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appPrimaryColorMain500,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NovaImagePng(
                                imgPath: NovaAssets.logoWhitePng,
                                width: 150.w,
                                height: 50.h,
                              ),
                              NovaVSpace(2),
                              NovaImagePng(
                                imgPath: NovaAssets.licenceImageWhite,
                                width: 120.w,
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                        NovaVSpace(32),
                        NovaTextWidget(
                          title: "Sign In",
                          fontFamily: NovaTypography.fontFamilyBold,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontDisplaySmall,
                          textColor: NovaColors.appWhiteColor,
                        ),
                        NovaVSpace(32),
                        NovaPrimaryTextField(
                          textInputType: TextInputType.text,
                          controller: loginWatcher.username,
                          textColor: NovaColors.appWhiteColor,
                          onChange: (val) => loginWatcher.listenForChanges(),
                          validation: (val) =>
                              val.validateString(strEmailError),
                          hintText: "Username",
                          innerHintText: "",
                        ),
                        NovaPasswordTextField(
                          controller: model.password,
                          textInputTitle: strPassword,
                          hintText: strPassword,
                          textColor: NovaColors.appWhiteColor,
                          onChange: (val) => loginWatcher.listenForChanges(),
                          validation: (value) => value!.passwordError(),
                          textInputAction: TextInputAction.next,
                        ),
                        NovaVSpace(8),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.forgotPassword),
                              child: NovaTextWidget(
                                title: strForgotPassword,
                                textColor: Color(0xff25215E),
                                textSize: NovaTypography.fontTitleSmall,
                                fontFamily: NovaTypography.fontFamilyMedium,
                              ).paddingAll(5),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        NovaVSpace(12),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: NovaButtonRound(
                                  textTitle: "Log In",
                                  bgColor: Color(0xff25215E),
                                  loadingString: model.loadingString,
                                  isLoader: model.isLoading,
                                  // isFormValidated: model.isDetailsSetupFormValidated,
                                  functionToRun: () {
                                    // loginWatcher.openNovaAccount(context);
                                  }),
                            ),
                            NovaHSpace(8),
                            NovaImageSvg(
                              svgPath: NovaAssets.biometricsIcon,
                              width: 65.w,
                              height: 65.h,
                            ),

                          ],
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
      ),
    );
  }
}
