part of 'package:peerlendly/modules/authentication/complete_account_setup/exports.dart';

class AddBvnScreen extends StatelessWidget {
  const AddBvnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseWidget(
      iconSet: PLImagePng(
        imgPath: PLAssets.verifyBvnBank,
        width: 138.w,
        height: 130.h,
        boxFit: BoxFit.contain,
      ).paddingAll(30),
      hasNoColumn: true,
      buildWidget: addBvnWidget(context),
      topHeight: 220.h,
    );
  }

  Widget addBvnWidget(BuildContext context) {
    final completeAccountWatcher = context.watch<CompleteAccountSetupProvider>();
    completeAccountWatcher.bvn.addListener(completeAccountWatcher.checkIfBvnFieldIsFilled);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          backgroundColor: PLColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: completeAccountWatcher.bvnValidationFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(32),
                      PLTextWidget(
                        title: "Verify Account",
                        isTitle: true,
                        textStyle: PLTypography.textHeadlineMediumStyle,
                        textSize: PLTypography.fontHeadlineSmall,
                      ),
                      PLVSpace(5),
                      PLTextWidget(
                        title:
                        "Kindly provide your BVN",
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(32),
                      PLPrimaryTextField(
                        textInputType: TextInputType.number,
                        controller: completeAccountWatcher.bvn,
                        maxLength: 11,
                        suffixIcon: const PLTooltip(
                          message: "Your BVN only gives us access to your Full name, Phone number, and Date of birth.",
                            child: Icon(Icons.info_outline, color: PLColors.appPrimaryColorMain500,)),
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                        validation: (val) => val.validateNumber(strFieldRequiredError),
                        hintText: strBVN,
                      ),
                      PLTextWidget(
                        title:
                        "Forgot BVN? Dial *565*0# from your registered phone number.",
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelSmall,
                      ),
                      PLVSpace(32),
                      PLButtonRound(
                        textTitle: strProceed,
                        loadingString: completeAccountWatcher.loadingString,
                        isLoader: completeAccountWatcher.isLoading,
                        isFormValidated: completeAccountWatcher.isBvnFormValidated,
                        functionToRun: () => completeAccountWatcher.validateBvnForm(context, completeAccountWatcher.bvn.text),
                      ),
                      PLVSpace(40),
                      const TermsAndConditionTextWidget(),
                      PLVSpace(32),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
