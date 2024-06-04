part of 'package:nova/modules/authentication/complete_account_setup/exports.dart';


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
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: completeAccountWatcher.verifyIDFormKey,
                child: SingleChildScrollView(
                  child: NovaPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaVSpace(32),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        NovaVSpace(16),
                        NovaTextWidget(
                          title: "Setup Profile",
                          isTitle: true,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontHeadlineSmall,
                        ),
                        NovaVSpace(5),
                        NovaTextWidget(
                          title: "Create your profile",
                          textColor: NovaColors.appPrimaryText,
                          textSize: NovaTypography.fontLabelMedium,
                        ),
                        NovaVSpace(32),
                        PLDropDownButtonWithIcon(
                          list: AppData.meansOfId,
                          title: "Select means of ID verification",
                          value: completeAccountWatcher.meansOfId,
                          callBack: (val) {
                            completeAccountWatcher.checkIfDocumentFormIsFilled();
                            // completeAccountWatcher.meansOfId.text = val;
                          },

                        ),
                        NovaVSpace(16),
                        NovaPrimaryTextField(
                            textInputType: TextInputType.name,
                            controller: completeAccountWatcher.idNumber,
                            onChange: (val) => completeAccountWatcher.checkIfDocumentFormIsFilled(),
                            validation: (val) => val.validateString(strFieldRequiredError),
                            hintText: "ID Number"),
                        NovaVSpace(16),
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
                                    borderRadius: NovaDecorations
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
                                child: NovaImagePng(
                                  imgPath: NovaAssets.captureDocument,
                                  height: 120.h,
                                  width: context.width,
                                  boxFit: BoxFit.cover,
                                ))),
                        NovaVSpace(8),
                        GestureDetector(
                            onTap: (){
                              modalBottomSheet(
                                  context,
                                  ImageCameraPickerWidget(
                                      controller: completeAccountWatcher.signatureImageDocument,
                                      callBack: (imagePath, file, base64Image) {
                                        completeAccountWatcher.signatureImageDocument.text = imagePath;
                                        completeAccountWatcher.signatureDocImage = file;
                                        completeAccountWatcher.checkIfDocumentFormIsFilled();

                                      }, removePhotoCallBack: () {  },),
                                  true,
                                  context.height / 3.1);
                            },
                            child: completeAccountWatcher.signatureDocImage.path.isNotEmpty
                                ? Column(
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: NovaDecorations
                                        .borderRadiusGeometryCircular20,
                                    child: Image(
                                      image: FileImage(File(
                                          completeAccountWatcher
                                              .signatureDocImage.path)),
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : Center(
                                child: NovaImagePng(
                                  imgPath: NovaAssets.signatureDocument,
                                  height: 120.h,
                                  width: context.width,
                                  boxFit: BoxFit.cover,
                                ))),
                        NovaVSpace(32),
                        NovaButtonRound(
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
