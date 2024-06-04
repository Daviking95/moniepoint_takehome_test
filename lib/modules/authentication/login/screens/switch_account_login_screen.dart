part of 'package:nova/modules/authentication/login/exports.dart';

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
      iconSet: NovaImagePng(
        imgPath: NovaAssets.phoneWalletInHand,
        width: 150.w,
        height: 180.h,
        boxFit: BoxFit.contain,
      ),
      buildWidget: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
          onWillPop: () => Future.value(true),
          child: NovaScaffold(
            backgroundColor: NovaColors.appWhiteColor,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: loginWatcher.formKeySwitchAccount,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(40),
                    NovaTextWidget(
                      title: "Welcome Back!",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineMedium,
                    ),
                    NovaVSpace(4),
                    const NovaTextWidget(
                      title: "Long time no see! Let’s login to get started",
                      textColor: NovaColors.appGrayText,
                    ),
                    NovaVSpace(32),
                    NovaPrimaryTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: loginWatcher.switchAccountEmail,
                      onChange: (val) => loginWatcher.listenForEmailChanges(),
                      validation: (val) => val.validateEmail(strEmailError),
                      hintText: strEmail,
                    ),
                    NovaVSpace(40),
                    NovaButtonRound(
                      textTitle: strLogin,
                      loadingString: model.loadingString,
                      isLoader: model.isLoading,
                      isFormValidated: loginWatcher.isEmailFormValidated,
                      functionToRun: () => loginWatcher.validateSwitchAccountForm(context),
                    ),
                    NovaVSpace(24),
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
