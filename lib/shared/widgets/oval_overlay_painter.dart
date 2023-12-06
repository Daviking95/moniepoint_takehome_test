part of "package:peerlendly/shared/widgets/exports.dart";

class OvalOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.1);
    final overlayRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final center = Offset(size.width / 2, size.height / 2);
    final ovalRect = Rect.fromCenter(center: center, width: 200, height: 300);

    // Draw the overlay covering the full screen
    canvas.drawRect(overlayRect, paint);

    // Draw an oval shape cutout at the center
    canvas.drawOval(ovalRect, paint..blendMode = BlendMode.clear);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

