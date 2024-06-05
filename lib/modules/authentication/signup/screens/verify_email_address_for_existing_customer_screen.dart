part of 'package:nova/modules/authentication/signup/exports.dart';


class VerifyEmailAddressForExistingCustomerScreen extends StatelessWidget {
  final String emailAddress;

  const VerifyEmailAddressForExistingCustomerScreen({Key? key, this.emailAddress = ""})
      : super(key: key);

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
                        title: "Verify Account",
                      ),
                      NovaVSpace(16),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Code has been sent to ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: NovaTypography.fontLabelLarge,
                                    fontFamily:
                                    NovaTypography.fontFamilyLight)),
                            TextSpan(
                              text: "johndoe@gmail.com.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: NovaTypography.fontLabelLarge,
                                  color: NovaColors.appPrimaryColorMain500),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 2,
                      ),
                      NovaVSpace(2),
                      NovaTextWidget(
                        title: "Enter the code to verify your account.",
                        textColor: NovaColors.appBlackColor,
                        textSize: NovaTypography.fontLabelLarge,
                      ),
                      NovaVSpace(32),
                      NovaPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: signUpWatcher.emailOtpCode,
                          textInputAction: TextInputAction.done,
                          validation: (val) =>
                              val.validateLength(strFieldRequiredError, 6),
                          onChange: (val) =>
                              model.listenForEmailVerifyChanges(),
                          formatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            new LengthLimitingTextInputFormatter(6)
                          ],
                          innerHintText: "6 Digit Code",
                          hintText: "Enter code"),
                      // NovaVSpace(12),
                      ResentOtpWidget(context, () {
                        // widget.completeAccountWatcher
                        //     .validateBvnForm(context, widget.bvn, true);
                      }, () {}),
                    ],
                  ),
                  Column(
                    children: [
                      NovaVSpace(40),
                      NovaButtonRound(
                          textTitle: "Verify Account",
                          loadingString: model.loadingString,
                          isLoader: model.isLoading,
                          hasBgImg: true,
                          isFormValidated: model.isEmailVerifyFormValidated,
                          functionToRun: () {
                            signUpWatcher.verifyEmailAddressForExistingCustomer(context);
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
    );
  }
}
