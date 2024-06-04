part of 'package:nova/modules/authentication/signup/exports.dart';

class SetSecurityQuestionScreen extends StatelessWidget {
  const SetSecurityQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupProvider>(
      vmBuilder: (context) =>
          SignupProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SignupProvider model) {
    final signUpWatcher = context.watch<SignupProvider>();

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
                        title: "Secret Question",
                      ),
                      NovaVSpace(16),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Enter the Answer in case of ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: NovaTypography.fontLabelLarge,
                                    fontFamily: NovaTypography.fontFamilyLight)),
                            TextSpan(
                              text: "recovery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: NovaTypography.fontLabelLarge,
                                  color: NovaColors.appPrimaryColorMain500),
                            ),
                            TextSpan(
                                text: " of your account",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: NovaTypography.fontLabelLarge,
                                    fontFamily: NovaTypography.fontFamilyLight)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 2,
                      ),
                      NovaVSpace(8),
                      NovaTextWidget(
                        title: "Fill only one.",
                        textColor: NovaColors.appBlackColor,
                        textSize: NovaTypography.fontLabelLarge,
                        fontFamily: NovaTypography.fontFamilyMedium,
                      ),
                      NovaVSpace(32),
                      NovaPrimaryTextField(
                        textInputType: TextInputType.text,
                        controller: signUpWatcher.setQuestion1,
                        textInputAction: TextInputAction.next,
                        onChange: (val) => signUpWatcher.listenForSecurityQuestionChanges(),
                        validation: (val) =>
                            val.validateString(strEmailError),
                        hintText: "Mother's maiden name",
                        innerHintText: "",
                      ),
                      NovaPrimaryTextField(
                        textInputType: TextInputType.text,
                        controller: signUpWatcher.setQuestion2,
                        textInputAction: TextInputAction.next,
                        onChange: (val) => signUpWatcher.listenForSecurityQuestionChanges(),
                        validation: (val) =>
                            val.validateString(strEmailError),
                        hintText: "Your Pet name",
                        innerHintText: "",
                      ),
                      NovaPrimaryTextField(
                        textInputType: TextInputType.text,
                        controller: signUpWatcher.setQuestion3,
                        textInputAction: TextInputAction.done,
                        onChange: (val) => signUpWatcher.listenForSecurityQuestionChanges(),
                        validation: (val) =>
                            val.validateString(strEmailError),
                        hintText: "Your favourite food",
                        innerHintText: "",
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      NovaVSpace(40),
                      NovaButtonRound(
                          textTitle: "Continue",
                          loadingString: model.loadingString,
                          isLoader: model.isLoading,
                          hasBgImg: true,
                          isFormValidated: model.isSecQuestionFormValidated,
                          functionToRun: () {
                            signUpWatcher.setSecurityQuestions(context);
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
