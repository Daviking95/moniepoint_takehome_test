part of 'package:peerlendly/modules/authentication/signup/exports.dart';

class EmailAddressWidget extends StatelessWidget {
  const EmailAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupProvider>(
      vmBuilder: (context) => SignupProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SignupProvider model) {
    final signUpWatcher = context.watch<SignupProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          backgroundColor: PLColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Form(
              key: signUpWatcher.formKeyEmail,
              child: Column(
                children: [
                  PLVSpace(40),
                  PLTextWidget(
                    title: "Hi, Enter your email address",
                    isTitle: true,
                    textStyle: PLTypography.textHeadlineMediumStyle,
                    textSize: PLTypography.fontHeadlineMedium,
                  ),
                  PLVSpace(32),
                  PLPrimaryTextField(
                    textInputType: TextInputType.emailAddress,
                    controller: signUpWatcher.email,
                    onChange: (val) => signUpWatcher.listenForEmailChanges(),
                    validation: (val) => val.validateEmail(strEmailError),
                    hintText: strEmail,
                  ),
                  PLVSpace(40),
                  PLButtonRound(
                    textTitle: strCreateAnAccount,
                    loadingString: model.loadingString,
                    isLoader: model.isLoading,
                    isFormValidated: signUpWatcher.isEmailFormValidated,
                    functionToRun: () => signUpWatcher.validateForm(context),
                  ),
                  PLVSpace(16),
                  const TermsAndConditionTextWidget(),
                  PLVSpace(24),
                  const AlreadyHaveAccountWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
