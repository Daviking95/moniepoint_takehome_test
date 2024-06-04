part of 'package:nova/modules/profile/exports.dart';

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
            NovaVSpace(24),

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
            NovaVSpace(24),
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
            NovaVSpace(24),
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
            NovaVSpace(24),
            Container(
              decoration: BoxDecoration(
                  borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                  color: NovaColors.appPrimaryColorMain500.withOpacity(.05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NovaImageSvg(svgPath: NovaAssets.infoIcon),
                  NovaHSpace(8),
                  Expanded(
                    child: NovaTextWidget(
                      title:
                          'Kindly note: Max file size 5MB and supported document types are pdf, jpg and png.',
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
              textTitle: strSave,
              isFormValidated: model.isDocumentFormValidated,
              isLoader: model.isLoading,
              loadingString: model.loadingString,
              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
              functionToRun: () =>
                  model.updateProfileInfo(context, 4)
                  // model.confirmProfileSavePersonalInfo(context, 4, model),
            ),
            NovaVSpace(16),
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
          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
          color: NovaColors.appWhiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NovaImageSvg(svgPath: NovaAssets.uploadIcon),
          NovaHSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NovaTextWidget(
                  title: title,
                  textStyle: NovaTypography.textTitleLargeStyle,
                  textColor: NovaColors.appPrimaryText,
                  fontWeight: FontWeight.w600,
                  textSize: NovaTypography.fontLabelMedium,
                ),
                NovaVSpace(4),
                NovaTextWidget(
                  title: 'Click here to upload file',
                  textStyle: NovaTypography.textTitleLargeStyle,
                  textColor: NovaColors.appGrayText,
                  textSize: NovaTypography.fontLabelSmall,
                ),
              ],
            ),
          ),
          if(hasBeenUploaded)
          const NovaImageSvg(svgPath: NovaAssets.blueCheckIcon),
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
            borderRadius: NovaDecorations.borderRadiusGeometryCircular20,
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
