part of "package:moniepoint_mobile/shared/widgets/exports.dart";

class MonieEstateImagePng extends StatelessWidget {final String imgPath;
  final double? width;
  final double? height;
  final Color? color;

  final BoxFit? boxFit;

  const MonieEstateImagePng({super.key, required this.imgPath, this.height, this.width, this.color, this.boxFit});

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

class MonieEstateImageNetwork extends StatelessWidget {
  final String networkPath;
  final double? width;
  final double? height;
  final String? fallBackImage;
  final String? memoryImage;

  const MonieEstateImageNetwork({super.key, required this.networkPath, this.height, this.width, this.fallBackImage, this.memoryImage});

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
                      fallBackImage ?? MonieEstateAssets.defaultProfile,
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
                fallBackImage ?? MonieEstateAssets.defaultProfile,
                fit: BoxFit.cover,
                width: width,
              );
  }
}
