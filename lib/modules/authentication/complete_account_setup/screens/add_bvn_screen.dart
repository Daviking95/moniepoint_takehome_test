part of 'package:nova/modules/authentication/complete_account_setup/exports.dart';

class AddBvnScreen extends StatelessWidget {
  const AddBvnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseWidget(
      iconSet: NovaImagePng(
        imgPath: NovaAssets.verifyBvnBank,
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
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: completeAccountWatcher.bvnValidationFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaVSpace(32),
                      NovaTextWidget(
                        title: "Verify Account",
                        isTitle: true,
                        textStyle: NovaTypography.textHeadlineMediumStyle,
                        textSize: NovaTypography.fontHeadlineSmall,
                      ),
                      NovaVSpace(5),
                      NovaTextWidget(
                        title:
                        "Kindly provide your BVN",
                        textColor: NovaColors.appGrayText,
                        textSize: NovaTypography.fontLabelMedium,
                      ),
                      NovaVSpace(32),
                      NovaPrimaryTextField(
                        textInputType: TextInputType.number,
                        controller: completeAccountWatcher.bvn,
                        maxLength: 11,
                        suffixIcon: const NovaTooltip(
                          message: "Your BVN only gives us access to your Full name, Phone number, and Date of birth.",
                            child: Icon(Icons.info_outline, color: NovaColors.appPrimaryColorMain500,)),
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                        validation: (val) => val.validateNumber(strFieldRequiredError),
                        hintText: strBVN,
                      ),
                      NovaTextWidget(
                        title:
                        "Forgot BVN? Dial *565*0# from your registered phone number.",
                        textColor: NovaColors.appGrayText,
                        textSize: NovaTypography.fontLabelSmall,
                      ),
                      NovaVSpace(32),
                      NovaButtonRound(
                        textTitle: strProceed,
                        loadingString: completeAccountWatcher.loadingString,
                        isLoader: completeAccountWatcher.isLoading,
                        isFormValidated: completeAccountWatcher.isBvnFormValidated,
                        functionToRun: () => completeAccountWatcher.validateBvnForm(context, completeAccountWatcher.bvn.text),
                      ),
                      NovaVSpace(40),
                      // const TermsAndConditionTextWidget(),
                      NovaVSpace(32),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
