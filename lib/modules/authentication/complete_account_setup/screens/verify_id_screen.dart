part of 'package:peerlendly/modules/authentication/complete_account_setup/exports.dart';


class VerifyIdScreen extends StatelessWidget {
  final String otp;
  final String base64Image;
  const VerifyIdScreen(this.otp, this.base64Image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Form(
                key: completeAccountWatcher.verifyIDFormKey,
                child: SingleChildScrollView(
                  child: PLPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLVSpace(32),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        PLVSpace(16),
                        PLTextWidget(
                          title: "Setup Profile",
                          isTitle: true,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontHeadlineSmall,
                        ),
                        PLVSpace(5),
                        PLTextWidget(
                          title: "Create your profile",
                          textColor: PLColors.appPrimaryText,
                          textSize: PLTypography.fontLabelMedium,
                        ),
                        PLVSpace(32),
                        PLDropDownButtonWithIcon(
                          list: UserData.meansOfId,
                          title: "Select means of ID verification",
                          value: completeAccountWatcher.meansOfId,
                          callBack: (val) {
                            completeAccountWatcher.checkIfDocumentFormIsFilled();
                            // completeAccountWatcher.meansOfId.text = val;
                          },

                        ),
                        PLVSpace(16),
                        PLPrimaryTextField(
                            textInputType: TextInputType.name,
                            controller: completeAccountWatcher.idNumber,
                            onChange: (val) => completeAccountWatcher.checkIfDocumentFormIsFilled(),
                            validation: (val) => val.validateString(strFieldRequiredError),
                            hintText: "ID Number"),
                        PLVSpace(16),
                        GestureDetector(
                            onTap: (){
                              modalBottomSheet(
                                  context,
                                  ImageCameraPickerWidget(
                                      controller: completeAccountWatcher.idImageDocument,
                                      callBack: (imagePath, file, base64Image) {
                                        completeAccountWatcher.idImageDocument.text = imagePath;
                                        completeAccountWatcher.idDocImage = file;
                                        completeAccountWatcher.checkIfDocumentFormIsFilled();

                                      }, removePhotoCallBack: () {  },),
                                  true,
                                  context.height / 3.1);
                            },
                            child: completeAccountWatcher.idDocImage.path.isNotEmpty
                                ? Column(
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: PLDecorations
                                        .borderRadiusGeometryCircular20,
                                    child: Image(
                                      image: FileImage(File(
                                          completeAccountWatcher
                                              .idDocImage.path)),
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : Center(
                                child: PLImagePng(
                                  imgPath: PLAssets.captureDocument,
                                  height: 120.h,
                                  width: context.width,
                                  boxFit: BoxFit.cover,
                                ))),
                        PLVSpace(32),
                        PLButtonRound(
                          textTitle: strProceed,
                          loadingString: completeAccountWatcher.loadingString,
                          isLoader: completeAccountWatcher.isLoading,
                          isFormValidated: completeAccountWatcher.isDocumentFormValidated,
                          functionToRun: () {
                            completeAccountWatcher.validateIDValidationForm(context, otp, base64Image);
                          },
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
