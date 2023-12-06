part of 'package:peerlendly/modules/authentication/complete_account_setup/exports.dart';

class VerifyEmailAddress extends StatelessWidget {

  final String emailAddress;
  const VerifyEmailAddress({Key? key, this.emailAddress = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseWidget(
      iconSet: Container(),
      buildWidget: VerifyEmailWidget(emailAddress: emailAddress,),
      topHeight: 80.h,
    );
  }
}

class VerifyEmailWidget extends StatefulWidget {
  final String emailAddress;
  const VerifyEmailWidget({Key? key, required this.emailAddress}) : super(key: key);

  @override
  State<VerifyEmailWidget> createState() => _VerifyEmailWidgetState();
}

class _VerifyEmailWidgetState extends State<VerifyEmailWidget> {
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<CompleteAccountSetupProvider>(
      vmBuilder: (context) => CompleteAccountSetupProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, CompleteAccountSetupProvider model) {
    final completeAccountWatcher =
        context.watch<CompleteAccountSetupProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          backgroundColor: PLColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLOverlayLoader(
                startLoader: model.isLoading,
                loadingString: model.loadingString,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(40),
                      PLBackIcon(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.signUp),
                          isCancel: true),
                      PLVSpace(40),
                      PLTextWidget(
                        title: "Email Verification",
                        textStyle: PLTypography.textHeadlineSmallStyle,
                        textSize: PLTypography.fontTitleLarge,
                        fontWeight: FontWeight.w500,
                        fontFamily: PLTypography.fontFamilyMedium,
                      ),
                      PLVSpace(10),
                      const PLTextWidget(
                        title: "Please enter the 4-digit code send to you at",
                        textColor: PLColors.appGrayText,
                      ),
                      PLVSpace(4),
                      PLTextWidget(
                        title: widget.emailAddress,
                        textColor: PLColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                      ),
                      PLVSpace(64),
                      SizedBox(
                        width: context.width,
                        child:
                        PinTextField(
                          obscureText: false,
                          fieldCount: 4,
                          controller: otp,
                          onChange: (value) {
                            if (value.length == 4) {
                              completeAccountWatcher.validateEmailVerifyForm(context, value, widget.emailAddress);
                            }
                          },
                          validation: (val) =>
                              val.validateString(strFieldRequiredError),
                        ),
                      ),
                      PLVSpace(32),
                      ResentOtpWidget(context, () {}, () {}),
                      PLVSpace(16),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
