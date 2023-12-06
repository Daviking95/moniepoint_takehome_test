part of "package:peerlendly/shared/widgets/exports.dart";

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
            borderRadius: PLDecorations.borderRadiusGeometryCircular100,
            border: Border.all(
              color: PLColors.neutralColor300,
              width: 1.0,
            )),
        child: ClipRRect(
          borderRadius: PLDecorations.borderRadiusGeometryCircular100,
          child: imageFile!.isNotEmpty
              ? Image.memory(base64.decode(imageFile ?? ""))
              : PLImageNetwork(
                  networkPath: imageFile ?? "", memoryImage: memoryImage),
          // child: PLImageNetwork(networkPath: imageFile ?? "", memoryImage: memoryImage)),
        ));
  }
}
