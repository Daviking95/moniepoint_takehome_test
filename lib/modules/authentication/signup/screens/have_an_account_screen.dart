part of 'package:nova/modules/authentication/signup/exports.dart';

class HaveAnAccountScreen extends StatelessWidget {
  const HaveAnAccountScreen({Key? key}) : super(key: key);

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
                      title: "Verification",
                    ),
                    NovaVSpace(8),
                    NovaTextWidget(
                      title: "Personal information is used for registration and validation of Nova bank",
                      textSize: NovaTypography.fontBodyLarge,
                      textAlign: TextAlign.center,
                      textColor: Color(0xff717E95),
                    ),
                    NovaVSpace(32),

                    NovaPrimaryTextField(
                        textInputType: TextInputType.number,
                        controller: signUpWatcher.novaAccountNumber,
                        textInputAction: TextInputAction.next,
                        validation: (val) => val.validateLength(strFieldRequiredError, 10),
                        onChange: (val) => model.listenForExistingAccountChanges(),
                        formatter: [FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(10)
                        ],
                        innerHintText: "1234321211",
                        hintText: "Nova Account Number"),
                    NovaPrimaryTextField(
                        textInputType: TextInputType.number,
                        controller: signUpWatcher.bvn,
                        textInputAction: TextInputAction.next,
                        validation: (val) => val.validateLength(strFieldRequiredError, 11),
                        onChange: (val) => model.listenForExistingAccountChanges(),
                        formatter: [FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(11)
                        ],
                        innerHintText: "11111111111",
                        hintText: "Bank Verification Number"),
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
                    NovaVSpace(56),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "By submitting this application you confirm that you are authorized to share this information and agree with our\n ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: NovaTypography.fontLabelMedium,
                                  fontFamily:
                                  NovaTypography.fontFamilyLight)),
                          TextSpan(
                            text: "Term and Conditions",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: NovaTypography.fontLabelMedium,
                                color: NovaColors.appPrimaryColorMain500),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 3,
                    ),
                    NovaVSpace(16),
                    NovaButtonRound(
                      textTitle: "Send Verification Code",
                      loadingString: model.loadingString,
                      isLoader: model.isLoading,
                      hasBgImg: true,
                      // isFormValidated: signUpWatcher.isSignupFormValidated,
                      functionToRun: () =>
                          signUpWatcher.signupExistingAccount(context),
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
