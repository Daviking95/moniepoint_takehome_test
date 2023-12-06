

import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageUtils {
  static Future<Map<String, dynamic>> compressAndResizeImage(File imageFile, {int maxSize = 300}) async {
    // Read the original image file as bytes
    Uint8List originalImageBytes = await imageFile.readAsBytes();

    // Get the original size
    int originalSize = originalImageBytes.length;

    // Compress the image using flutter_image_compress
    List<int> compressedBytes = await FlutterImageCompress.compressWithList(
      originalImageBytes,
      minHeight: 320,
      minWidth: 400,
      quality: 20,
    );

    // Get the compressed size
    int compressedSize = compressedBytes.length;

    Uint8List bytes = Uint8List.fromList(compressedBytes);

    // Resize the image using the image package
    img.Image originalImage = img.decodeImage(bytes)!;
    img.Image resizedImage = img.copyResize(originalImage, width: 800);

    // Convert the resized image to bytes
    Uint8List resizedBytes = Uint8List.fromList(img.encodePng(resizedImage));

    // Get the resized size
    int resizedSize = resizedBytes.length;

    return {
      'originalSize': originalSize,
      'compressedSize': compressedSize,
      'resizedSize': resizedSize,
      'bytes': bytes,
    };
  }
}