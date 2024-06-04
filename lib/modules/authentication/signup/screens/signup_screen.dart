part of 'package:nova/modules/authentication/signup/exports.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupProvider>(
      vmBuilder: (context) =>
          SignupProvider(context: context, shouldInitialize: true),
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
                      title: "Get Started",
                    ),
                    NovaVSpace(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: NovaPrimaryTextField(
                            textInputType: TextInputType.text,
                            controller: signUpWatcher.firstName,
                            textInputAction: TextInputAction.next,
                            onChange: (val) => signUpWatcher.listenForSignupChanges(),
                            validation: (val) =>
                                val.validateString(strEmailError),
                            hintText: "First Name",
                            innerHintText: "John",
                          ),
                        ),
                        NovaHSpace(16),
                        Expanded(
                          child: NovaPrimaryTextField(
                            textInputType: TextInputType.text,
                            controller: signUpWatcher.lastName,
                            textInputAction: TextInputAction.next,
                            onChange: (val) => signUpWatcher.listenForSignupChanges(),
                            validation: (val) =>
                                val.validateString(strEmailError),
                            hintText: "Last Name",
                            innerHintText: "Doe",
                          ),
                        ),
                      ],
                    ),
                    NovaPrimaryTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: signUpWatcher.email,
                        textInputAction: TextInputAction.next,
                      onChange: (val) => signUpWatcher.listenForSignupChanges(),
                      validation: (val) => val.validateEmail(strEmailError),
                      innerHintText: "Enter your email",
                      hintText: "E-mail",
                        prefixIcon: NovaImageSvg(
                          svgPath: NovaAssets.emailIcon,
                          height: 12.h,
                          width: 12.w,
                        ).paddingAll(5)
                    ),
                    NovaPrimaryTextField(
                        textInputType: TextInputType.number,
                        controller: signUpWatcher.phoneNumber,
                        textInputAction: TextInputAction.next,
                        validation: (val) => val.validatePhoneNumber(strFieldRequiredError),
                        onChange: (val) => model.listenForSignupChanges(),
                        formatter: [FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(11)
                        ],
                        innerHintText: "XXXX-XXX-XXXX",
                        hintText: "Phone Number"),
                    NovaPrimaryTextField(
                        textInputType: TextInputType.number,
                        controller: signUpWatcher.bvn,
                        textInputAction: TextInputAction.next,
                        validation: (val) => val.validateLength(strFieldRequiredError, 11),
                        onChange: (val) => model.listenForSignupChanges(),
                        formatter: [FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(11)
                        ],
                        innerHintText: "11111111111",
                        hintText: "BVN Number"),

                    PLDropDownButtonWithIcon(
                      list: const [
                        {"": "Savings Account"},
                        {"": "Current Account"},
                      ],
                      title: "Account Type",
                      value: signUpWatcher.accountType,
                      callBack: (val) =>
                          signUpWatcher.listenForSignupChanges(),
                        prefixIcon: NovaImageSvg(
                          svgPath: NovaAssets.accountTypeIcon,
                          height: 12.h,
                          width: 12.w,
                        ).paddingAll(5)
                    ),
                    NovaDatePickerTextField(
                        datePickerController: signUpWatcher.dateOfBirth,
                        noOfYears: 18,
                        // textInputAction: TextInputAction.done,
                        isTodayLastDate: true,
                        hint: "DD/MM/YY",
                        onChange: (val) {
                          model.listenForSignupChanges();
                        },
                        text: "Date of birth"),
                    NovaVSpace(40),
                    NovaButtonRound(
                      textTitle: "Continue",
                      loadingString: model.loadingString,
                      isLoader: model.isLoading,
                      hasBgImg: true,
                      // isFormValidated: signUpWatcher.isSignupFormValidated,
                      functionToRun: () =>
                          signUpWatcher.signupNewAccount(context),
                    ),
                    NovaVSpace(16),
                    TermsAndConditionTextWidget(
                      isChecked: (val) {},
                    ),
                    NovaVSpace(32)
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
