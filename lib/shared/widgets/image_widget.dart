part of "package:peerlendly/shared/widgets/exports.dart";

class PLImageSvg extends StatelessWidget {
  final String svgPath;
  final double? width;
  final double? height;

  const PLImageSvg({super.key, required this.svgPath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    assert(svgPath.isNotEmpty);
    if (width != null && height != null) {
      return SvgPicture.asset(
        svgPath,
        width: width,
        height: height,
      );
    } else {
      return SvgPicture.asset(
        svgPath,
      );
    }
  }
}

class PLImagePng extends StatelessWidget {
  final String imgPath;
  final double? width;
  final double? height;
  final Color? color;

  final BoxFit? boxFit;

  const PLImagePng({super.key, required this.imgPath, this.height, this.width, this.color, this.boxFit});

  @override
  Widget build(BuildContext context) {
    assert(imgPath.isNotEmpty);
    if (width != null && height != null) {
      return Image.asset(
        imgPath,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.contain,
        color: color,
      );
    } else {
      return Image.asset(
        imgPath,
        fit: BoxFit.cover,
        color: color,
      );
    }
  }
}

class PLImageNetwork extends StatelessWidget {
  final String networkPath;
  final double? width;
  final double? height;
  final String? fallBackImage;
  final String? memoryImage;

  const PLImageNetwork({super.key, required this.networkPath, this.height, this.width, this.fallBackImage, this.memoryImage});

  @override
  Widget build(BuildContext context) {
    // assert(networkPath.isNotEmpty);
    return networkPath.isNotEmpty
        ? Image.network(
            networkPath,
            width: width,
            fit: BoxFit.cover,
            errorBuilder: (context, obj, st) {
              return memoryImage != null && memoryImage!.isNotEmpty
                  ? Image.file(
                      File(memoryImage!),
                      fit: BoxFit.cover,
                      width: width,
                    )
                  : Image.asset(
                      fallBackImage ?? PLAssets.editProfileIcon,
                      fit: BoxFit.cover,
                      width: width,
                    );
            },
          )
        : memoryImage != null && memoryImage!.isNotEmpty
            ? Image.file(
                File(memoryImage!),
                fit: BoxFit.cover,
                width: width,
              )
            : Image.asset(
                fallBackImage ?? PLAssets.editProfileIcon,
                fit: BoxFit.cover,
                width: width,
              );
  }
}
