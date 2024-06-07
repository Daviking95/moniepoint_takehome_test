part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class ProfileImageWidget extends StatelessWidget {
  final String? imageFile;
  final String? memoryImage;
  final String? fallBackImage;
  final double size;

  const ProfileImageWidget(
      {super.key, this.imageFile, this.memoryImage, this.fallBackImage, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: MonieEstateDecorations.borderRadiusGeometryCircular100,
            border: Border.all(
              color: MonieEstateColors.neutralColor300,
              width: 1.0,
            )),
        child: ClipRRect(
          borderRadius: MonieEstateDecorations.borderRadiusGeometryCircular100,
          child: imageFile!.isNotEmpty && imageFile! != "N/A"
              ? Image.memory(base64.decode(imageFile ?? ""))
              : MonieEstateImageNetwork(
                  networkPath: imageFile ?? "", memoryImage: memoryImage, fallBackImage: fallBackImage),
          // child: PLImageNetwork(networkPath: imageFile ?? "", memoryImage: memoryImage)),
        ));
  }
}
