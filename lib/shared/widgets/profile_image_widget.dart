part of "package:nova/shared/widgets/exports.dart";

class ProfileImageWidget extends StatelessWidget {
  final String? imageFile;
  final String? memoryImage;
  final double size;

  const ProfileImageWidget(
      {super.key, this.imageFile, this.memoryImage, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: NovaDecorations.borderRadiusGeometryCircular100,
            border: Border.all(
              color: NovaColors.neutralColor300,
              width: 1.0,
            )),
        child: ClipRRect(
          borderRadius: NovaDecorations.borderRadiusGeometryCircular100,
          child: imageFile!.isNotEmpty && imageFile! != "N/A"
              ? Image.memory(base64.decode(imageFile ?? ""))
              : NovaImageNetwork(
                  networkPath: imageFile ?? "", memoryImage: memoryImage),
          // child: PLImageNetwork(networkPath: imageFile ?? "", memoryImage: memoryImage)),
        ));
  }
}
