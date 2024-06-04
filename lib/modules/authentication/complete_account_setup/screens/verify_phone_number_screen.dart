part of 'package:nova/modules/authentication/complete_account_setup/exports.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  final String bvnValue;
  final String phoneNumber;

  const VerifyPhoneNumberScreen(this.bvnValue, this.phoneNumber, {Key? key})
      : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final completeAccountWatcher =
        context.watch<CompleteAccountSetupProvider>();

    return AppBaseWidget(
      iconSet: Container(),
      buildWidget: NovaOverlayLoader(
        startLoader: completeAccountWatcher.isLoading,
        loadingString: completeAccountWatcher.loadingString,
        child: VerifyPhoneWidget(
            completeAccountWatcher: completeAccountWatcher,
            bvn: widget.bvnValue,
            phoneNumber: widget.phoneNumber),
      ),
      topHeight: 80.h,
    );
  }
}

class VerifyPhoneWidget extends StatefulWidget {
  final CompleteAccountSetupProvider completeAccountWatcher;
  final String bvn;
  final String phoneNumber;

  const VerifyPhoneWidget({
    super.key,
    required this.completeAccountWatcher,
    required this.bvn,
    required this.phoneNumber,
  });

  @override
  State<VerifyPhoneWidget> createState() => _VerifyPhoneWidgetState();
}

class _VerifyPhoneWidgetState extends State<VerifyPhoneWidget> {
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: widget.completeAccountWatcher.phoneNumberVerifyFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaVSpace(32),
                      NovaBackIcon(
                        onTap: () => Navigator.pop(context),
                        isCancel: true,
                      ),
                      NovaVSpace(40),
                      NovaTextWidget(
                        title: "Phone Verification",
                        isTitle: true,
                        textStyle: NovaTypography.textHeadlineMediumStyle,
                        textSize: NovaTypography.fontHeadlineSmall,
                      ),
                      NovaVSpace(5),
                      NovaTextWidget(
                        title: "Please enter the 4-digit code send to you at",
                        textColor: NovaColors.appPrimaryText,
                        textSize: NovaTypography.fontLabelMedium,
                      ),
                      NovaVSpace(4),
                      NovaTextWidget(
                        title: widget.phoneNumber,
                        textColor: NovaColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: NovaTypography.fontLabelMedium,
                      ),
                      NovaVSpace(62),
                      SizedBox(
                        width: context.width,
                        child: PinTextField(
                          obscureText: false,
                          fieldCount: 4,
                          controller: otp,
                          onChange: (value) {
                            // model.checkIfPhoneNumberOtpisFilled();
                            if (value.length == 4) {
                              widget.completeAccountWatcher
                                  .validatePhoneNumberForm(
                                context,
                                otp,
                              );
                            }
                          },
                          validation: (val) =>
                              val.validateString(strFieldRequiredError),
                        ),
                      ),
                      NovaVSpace(32),
                      ResentOtpWidget(context, () {
                        widget.completeAccountWatcher
                            .validateBvnForm(context, widget.bvn, true);
                      }, () {}),
                      NovaVSpace(16),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
