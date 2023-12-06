part of "package:peerlendly/shared/widgets/exports.dart";

class ImageCameraPickerWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String image, XFile file, String base64Image) callBack;
  final Function() removePhotoCallBack;

  const ImageCameraPickerWidget({Key? key, required this.controller, required this.callBack, required this.removePhotoCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PLVSpace(16),
        InkWell(
          onTap: () => _openMedia(context, controller),
          child: Row(
            children: [
              const Icon(
                Icons.camera,
                size: 30,
                color: PLColors.appGrayText,
              ),
              PLHSpace(10),
              PLTextWidget(
                title: strOpenCamera,
                textSize: PLTypography.fontBodyMedium,
              ),
            ],
          ),
        ),
        PLVSpace(16),
        Divider(
          color: PLColors.appSecondaryText.withOpacity(.2),
        ),
        PLVSpace(16),
        InkWell(
          onTap: () => _openMedia(context, controller, true),
          child: Row(
            children: [
              const Icon(
                Icons.photo,
                size: 30,
                color: PLColors.appGrayText,
              ),
              PLHSpace(10),
              PLTextWidget(
                title: strOpenGallery,
                textSize: PLTypography.fontBodyMedium,
              ),
            ],
          ),
        ),
        if (controller.text.isNotEmpty) ...[
          PLVSpace(16),
          Divider(
            color: PLColors.appSecondaryText.withOpacity(.2),
          ),
          PLVSpace(16),
          InkWell(
            onTap: () {
              controller.text = "";
              removePhotoCallBack();
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.delete,
                  size: 30,
                  color: PLColors.appErrorColor,
                ),
                PLHSpace(10),
                PLTextWidget(
                  title: "Remove Photo",
                  textSize: PLTypography.fontBodyMedium,
                ),
              ],
            ),
          ),
        ],
        PLVSpace(16),
      ],
    );
  }

  Future<XFile?> _openMedia(context, controller, [isGallery = false]) async {
    Navigator.pop(context);
    XFile? image = await ImagePicker().pickImage(source: isGallery ? ImageSource.gallery : ImageSource.camera, imageQuality: 30);
    if (image != null) {
      File file = File(image.path);
      String base64Image = base64Encode(file.readAsBytesSync());

      callBack(image.path, image, base64Image);
      // controller.text = image.path;

      return image;
    } else {
      return null;
    }
  }
}