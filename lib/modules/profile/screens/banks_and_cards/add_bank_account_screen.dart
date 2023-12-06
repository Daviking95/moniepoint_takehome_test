part of 'package:peerlendly/modules/profile/exports.dart';

class AddBankAccountScreen extends StatelessWidget {
  const AddBankAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: PLPaddedWidget(
                  child: Form(
                    key: profileWatcher.addBankFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        PLVSpace(8),
                        PLTextWidget(
                          title: "Add Your Bank Account",
                          isTitle: true,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontHeadlineSmall,
                        ),
                        PLVSpace(24),
                        PLDropDownButtonWithIcon(
                          list: profileWatcher.nigeriaBanks
                              .map((e) => {e.logo: e.name})
                              .toList(),
                          title: "Select Your Bank",
                          value: profileWatcher.addBankName,
                          isNetworkImage: true,
                          callBack: (val){
                            profileWatcher.listenForAddBankChanges();
                            profileWatcher.listenForVerifyAccount();
                          },
                        ),
                        PLPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.addBankAccountNumber,
                          fillColor: PLColors.appWhiteColor,
                          maxLength: 10,
                          onChange: (val) {
                            profileWatcher.listenForAddBankChanges();
                            profileWatcher.listenForVerifyAccount();
                          },
                          validation: (val) =>
                              val.validateNumber(strFieldRequiredError),
                          hintText: "Account Number",
                        ),
                        PLVSpace(8),
                        PLTextWidget(
                          title: profileWatcher.verifiedAccount.text,
                          textColor: PLColors.appPrimaryColorMain500,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontBodyMedium,
                          fontFamily: PLTypography.fontFamilyMedium,
                        ),
                        PLVSpace(24),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  PLDecorations.borderRadiusGeometryCircular8,
                              color: PLColors.appPrimaryColorMain500
                                  .withOpacity(.05)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const PLImageSvg(svgPath: PLAssets.infoIcon),
                              PLHSpace(8),
                              Expanded(
                                child: PLTextWidget(
                                  title:
                                      'Kindly note: This should preferably be your current salary account',
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appGrayText,
                                  textSize: PLTypography.fontLabelSmall,
                                ),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        PLVSpace(32),
                        PLButtonRound(
                          textTitle: "Add Bank",
                          isFormValidated:
                              profileWatcher.isAddBankFormValidated,
                          isLoader: profileWatcher.isLoading,
                          loadingString: profileWatcher.loadingString,
                          borderRadius:
                              PLDecorations.borderRadiusGeometryCircular8,
                          functionToRun: () =>
                              profileWatcher.addBankDetails(context),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
