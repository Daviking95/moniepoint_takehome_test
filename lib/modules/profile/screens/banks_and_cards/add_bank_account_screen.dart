part of 'package:nova/modules/profile/exports.dart';

class AddBankAccountScreen extends StatelessWidget {
  const AddBankAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: NovaPaddedWidget(
                  child: Form(
                    key: profileWatcher.addBankFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        NovaVSpace(8),
                        NovaTextWidget(
                          title: "Add Your Bank Account",
                          isTitle: true,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontHeadlineSmall,
                        ),
                        NovaVSpace(24),
                        PLDropDownButtonWithIcon(
                          list: profileWatcher.nigeriaBanks
                              .map((e) => {e.logo: e.bankName})
                              .toList(),
                          title: "Select Your Bank",
                          value: profileWatcher.addBankName,
                          isNetworkImage: true,
                          callBack: (val){
                            profileWatcher.listenForAddBankChanges();
                            profileWatcher.listenForVerifyAccount();
                          },
                        ),
                        NovaPrimaryTextField(
                          textInputType: TextInputType.number,
                          controller: profileWatcher.addBankAccountNumber,
                          fillColor: NovaColors.appWhiteColor,
                          maxLength: 10,
                          onChange: (val) {
                            profileWatcher.listenForAddBankChanges();
                            profileWatcher.listenForVerifyAccount();
                          },
                          validation: (val) =>
                              val.validateNumber(strFieldRequiredError),
                          hintText: "Account Number",
                        ),
                        NovaVSpace(8),
                        NovaTextWidget(
                          title: profileWatcher.verifiedAccount.text,
                          textColor: NovaColors.appPrimaryColorMain500,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontBodyMedium,
                          fontFamily: NovaTypography.fontFamilyMedium,
                        ),
                        NovaVSpace(24),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  NovaDecorations.borderRadiusGeometryCircular8,
                              color: NovaColors.appPrimaryColorMain500
                                  .withOpacity(.05)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const NovaImageSvg(svgPath: NovaAssets.infoIcon),
                              NovaHSpace(8),
                              Expanded(
                                child: NovaTextWidget(
                                  title:
                                      'Kindly note: This should preferably be your current salary account',
                                  textStyle: NovaTypography.textTitleLargeStyle,
                                  textColor: NovaColors.appGrayText,
                                  textSize: NovaTypography.fontLabelSmall,
                                ),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        NovaVSpace(32),
                        NovaButtonRound(
                          textTitle: "Add Bank",
                          isFormValidated:
                              profileWatcher.isAddBankFormValidated,
                          isLoader: profileWatcher.isLoading,
                          loadingString: profileWatcher.loadingString,
                          borderRadius:
                              NovaDecorations.borderRadiusGeometryCircular8,
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
