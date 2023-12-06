part of 'package:peerlendly/modules/authentication/login/exports.dart';

class SwitchAccountLoginScreen extends StatelessWidget {
  const SwitchAccountLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      vmBuilder: (context) =>
          LoginProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoginProvider model) {
    final loginWatcher = context.watch<LoginProvider>();

    return AppBaseWidget(
      iconSet: PLImagePng(
        imgPath: PLAssets.phoneWalletInHand,
        width: 150.w,
        height: 180.h,
        boxFit: BoxFit.contain,
      ),
      buildWidget: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
          onWillPop: () => Future.value(true),
          child: PLScaffold(
            backgroundColor: PLColors.appWhiteColor,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: loginWatcher.formKeySwitchAccount,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(40),
                    PLTextWidget(
                      title: "Welcome Back!",
                      isTitle: true,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontHeadlineMedium,
                    ),
                    PLVSpace(4),
                    const PLTextWidget(
                      title: "Long time no see! Let’s login to get started",
                      textColor: PLColors.appGrayText,
                    ),
                    PLVSpace(32),
                    PLPrimaryTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: loginWatcher.switchAccountEmail,
                      onChange: (val) => loginWatcher.listenForEmailChanges(),
                      validation: (val) => val.validateEmail(strEmailError),
                      hintText: strEmail,
                    ),
                    PLVSpace(40),
                    PLButtonRound(
                      textTitle: strLogin,
                      loadingString: model.loadingString,
                      isLoader: model.isLoading,
                      isFormValidated: loginWatcher.isEmailFormValidated,
                      functionToRun: () => loginWatcher.validateSwitchAccountForm(context),
                    ),
                    PLVSpace(24),
                    const Center(child: DontHaveAccountWidget())
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      topHeight: 250.h,
    );
  }
}
