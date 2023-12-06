part of 'package:peerlendly/modules/profile/exports.dart';

class UploadTab extends StatelessWidget {
  const UploadTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileProvider>();

    return SingleChildScrollView(
      child: Form(
        key: model.uploadDocFormKey,
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  uploadFunction(model.uploadGovIssuedID, context, model);
                },
                child: model.uploadGovIssuedID.text.isNotEmpty
                    ? UploadedDocWidget(
                        controller: model.uploadGovIssuedID,
                      )
                    : const Center(
                        child: UploadWidget(
                            title: 'Government Issued ID',
                            hasBeenUploaded: true))),
            PLVSpace(24),

            GestureDetector(
                onTap: () {
                  uploadFunction(model.uploadProofOfAddress, context, model);
                },
                child: model.uploadProofOfAddress.text.isNotEmpty
                    ? UploadedDocWidget(
                  controller: model.uploadProofOfAddress,
                )
                    : const Center(
                    child: UploadWidget(
                        title: 'Proof of Address',
                        hasBeenUploaded: false))),
            PLVSpace(24),
            GestureDetector(
                onTap: () {
                  uploadFunction(model.uploadProofOfEmp, context, model);
                },
                child: model.uploadProofOfEmp.text.isNotEmpty
                    ? UploadedDocWidget(
                  controller: model.uploadProofOfEmp,
                )
                    : const Center(
                    child: UploadWidget(
                        title: 'Proof of Employment',
                        hasBeenUploaded: false))),
            PLVSpace(24),
            GestureDetector(
                onTap: () {
                  uploadFunction(model.uploadAdditionalDoc, context, model);
                },
                child: model.uploadAdditionalDoc.text.isNotEmpty
                    ? UploadedDocWidget(
                  controller: model.uploadAdditionalDoc,
                )
                    : const Center(
                    child: UploadWidget(
                        title: 'Additional Documents',
                        hasBeenUploaded: false))),
            PLVSpace(24),
            Container(
              decoration: BoxDecoration(
                  borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                  color: PLColors.appPrimaryColorMain500.withOpacity(.05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PLImageSvg(svgPath: PLAssets.infoIcon),
                  PLHSpace(8),
                  Expanded(
                    child: PLTextWidget(
                      title:
                          'Kindly note: Max file size 5MB and supported document types are pdf, jpg and png.',
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
              textTitle: strSave,
              isFormValidated: model.isDocumentFormValidated,
              isLoader: model.isLoading,
              loadingString: model.loadingString,
              borderRadius: PLDecorations.borderRadiusGeometryCircular8,
              functionToRun: () =>
                  model.updateProfileInfo(context, 4)
                  // model.confirmProfileSavePersonalInfo(context, 4, model),
            ),
            PLVSpace(16),
          ],
        ),
      ),
    );
  }

  void uploadFunction(TextEditingController controller, BuildContext context,
      ProfileProvider model) {
    modalBottomSheet(
        context,
        ImageCameraPickerWidget(
            controller: controller,
            callBack: (imagePath, file, base64Image) {
              controller.text = imagePath;
              model.listenForDocumentTabChanges();
            }, removePhotoCallBack: () {  },),
        true,
        context.height / 3.1);
  }
}

class UploadWidget extends StatelessWidget {
  final String title;
  final bool hasBeenUploaded;

  const UploadWidget(
      {super.key, required this.title, required this.hasBeenUploaded});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
          color: PLColors.appWhiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PLImageSvg(svgPath: PLAssets.uploadIcon),
          PLHSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PLTextWidget(
                  title: title,
                  textStyle: PLTypography.textTitleLargeStyle,
                  textColor: PLColors.appPrimaryText,
                  fontWeight: FontWeight.w600,
                  textSize: PLTypography.fontLabelMedium,
                ),
                PLVSpace(4),
                PLTextWidget(
                  title: 'Click here to upload file',
                  textStyle: PLTypography.textTitleLargeStyle,
                  textColor: PLColors.appGrayText,
                  textSize: PLTypography.fontLabelSmall,
                ),
              ],
            ),
          ),
          if(hasBeenUploaded)
          const PLImageSvg(svgPath: PLAssets.blueCheckIcon),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}

class UploadedDocWidget extends StatelessWidget {
  final TextEditingController controller;

  const UploadedDocWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: PLDecorations.borderRadiusGeometryCircular20,
            child: Image(
              image: FileImage(File(controller.text)),
              width: context.width,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
