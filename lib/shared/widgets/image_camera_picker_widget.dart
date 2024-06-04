part of "package:nova/shared/widgets/exports.dart";

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
        NovaVSpace(16),
        InkWell(
          onTap: () => _openMedia(context, controller),
          child: Row(
            children: [
              const Icon(
                Icons.camera,
                size: 30,
                color: NovaColors.appGrayText,
              ),
              NovaHSpace(10),
              NovaTextWidget(
                title: strOpenCamera,
                textSize: NovaTypography.fontBodyMedium,
              ),
            ],
          ),
        ),
        NovaVSpace(16),
        Divider(
          color: NovaColors.appSecondaryText.withOpacity(.2),
        ),
        NovaVSpace(16),
        InkWell(
          onTap: () => _openMedia(context, controller, true),
          child: Row(
            children: [
              const Icon(
                Icons.photo,
                size: 30,
                color: NovaColors.appGrayText,
              ),
              NovaHSpace(10),
              NovaTextWidget(
                title: strOpenGallery,
                textSize: NovaTypography.fontBodyMedium,
              ),
            ],
          ),
        ),
        if (controller.text.isNotEmpty) ...[
          NovaVSpace(16),
          Divider(
            color: NovaColors.appSecondaryText.withOpacity(.2),
          ),
          NovaVSpace(16),
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
                  color: NovaColors.appErrorColor,
                ),
                NovaHSpace(10),
                NovaTextWidget(
                  title: "Remove Photo",
                  textSize: NovaTypography.fontBodyMedium,
                ),
              ],
            ),
          ),
        ],
        NovaVSpace(16),
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