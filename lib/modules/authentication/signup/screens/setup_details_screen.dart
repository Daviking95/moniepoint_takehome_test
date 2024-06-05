part of 'package:nova/modules/authentication/signup/exports.dart';

class SetupDetailsScreen extends StatelessWidget {
  final bool isExisting;
  const SetupDetailsScreen({Key? key, this.isExisting = false}) : super(key: key);

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
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
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
                          title: "Set Your Details",
                        ),
                        NovaVSpace(16),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Fill the forms to open your ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: NovaTypography.fontLabelLarge,
                                      fontFamily:
                                          NovaTypography.fontFamilyLight)),
                              TextSpan(
                                text: dotenv.env['APP_NAME'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: NovaTypography.fontLabelLarge,
                                    color: NovaColors.appPrimaryColorMain500),
                              ),
                              TextSpan(
                                  text: " account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: NovaTypography.fontLabelLarge,
                                      fontFamily:
                                          NovaTypography.fontFamilyLight)),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                        ),
                        NovaVSpace(32),
                        NovaPrimaryTextField(
                          textInputType: TextInputType.text,
                          controller: signUpWatcher.username,
                          onChange: (val) =>
                              signUpWatcher.listenForDetailsSetupChanges(),
                          validation: (val) =>
                              val.validateString(strEmailError),
                          hintText: "Username",
                          innerHintText: "",
                        ),
                        NovaPasswordTextField(
                          controller: model.password,
                          textInputTitle: strPassword,
                          hintText: strPassword,
                          onChange: (val) =>
                              signUpWatcher.listenForDetailsSetupChanges(),
                          validation: (value) => value!.passwordError(),
                          textInputAction: TextInputAction.next,
                        ),
                        NovaPasswordTextField(
                          controller: model.confirmPassword,
                          textInputTitle: strConfirmPassword,
                          hintText: strConfirmPassword,
                          onChange: (val) =>
                              signUpWatcher.listenForDetailsSetupChanges(),
                          validation: (value) =>
                              value!.comparePassword(model.password.text),
                          textInputAction: TextInputAction.next,
                        ),
                        NovaPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: signUpWatcher.transactionPin,
                            textInputAction: TextInputAction.done,
                            validation: (val) =>
                                val.validateLength(strFieldRequiredError, 4),
                            onChange: (val) =>
                                model.listenForEmailVerifyChanges(),
                            formatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4)
                            ],
                            innerHintText: "",
                            hintText: "Transaction Pin"),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: NovaTextWidget(
                            title: "Register a 4 digit pin of your choice",
                            textColor: NovaColors.appBlackColor,
                            textSize: NovaTypography.fontLabelSmall,
                            fontFamily: NovaTypography.fontFamilyMedium,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        NovaVSpace(40),
                        NovaButtonRound(
                            textTitle: isExisting ? "Continue" : "Open Account",
                            loadingString: model.loadingString,
                            isLoader: model.isLoading,
                            hasBgImg: true,
                            // isFormValidated: model.isDetailsSetupFormValidated,
                            functionToRun: () {
                              signUpWatcher.openNovaAccount(context, isExisting);
                            }),
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
