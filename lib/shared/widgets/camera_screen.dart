part of "package:nova/shared/widgets/exports.dart";

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> camera;
  final Function callback;

  CameraScreen({required this.camera, required this.callback});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera.last,
      ResolutionPreset.ultraHigh,
    );

    _initializeControllerFuture = _controller.initialize();
    _controller.setFlashMode(FlashMode.off);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(
            _controller,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(color: NovaColors.appBlackColor.withOpacity(.4)),
                    width: context.width,
                    height: context.height / 4,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(color: NovaColors.appBlackColor.withOpacity(.4)),
                    width: context.width,
                    height: context.height / 4,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 189.5,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(color: NovaColors.appBlackColor.withOpacity(.4)),
                      width: context.width / 5,
                      height: context.height / 2,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 189.5,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(color: NovaColors.appBlackColor.withOpacity(.4)),
                      width: context.width / 5,
                      height: context.height / 2,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: SizedBox(
                    width: context.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NovaTextWidget(
                          title: "Take a picture of yourself and make sure your face is visible.",
                          textColor: NovaColors.appWhiteColor,
                          textStyle: NovaTypography.textLabelSmallStyle,
                          textSize: NovaTypography.fontLabelSmall,
                        ),
                        NovaVSpace(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: _switchTouch,
                              child: const Icon(Icons.flash_on, color: NovaColors.appWhiteColor, size: 30,).paddingAll(15),
                            ),
                            NovaHSpace(10),
                            GestureDetector(
                              onTap: _capture,
                              child: const Icon(Icons.camera, color: NovaColors.appWhiteColor, size: 30,).paddingAll(15),
                            ),
                            NovaHSpace(10),
                            GestureDetector(
                              onTap: _switchCamera,
                              child: const Icon(Icons.switch_access_shortcut, color: NovaColors.appWhiteColor, size: 30,).paddingAll(15),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: context.width,
                    height: context.height,
                    child: FractionallySizedBox(
                      widthFactor: .6,
                      heightFactor: 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: PLDecorations.borderRadiusGeometryCircular50,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _capture() async {
    try {
      await _initializeControllerFuture;

      // Take a picture and save it to the gallery
      final image = await _controller.takePicture();

      widget.callback(image);

      Navigator.pop(context);

      // You can process or display the taken image here
    } catch (e) {
      print('Error taking picture: $e');
    }
  }


  void _switchCamera() async {
    try {
      // Check if there are more than one cameras available
      if (widget.camera.length > 1) {
        // Get the lensDirection (front or back) of the current camera
        CameraLensDirection currentLensDirection = _controller.description.lensDirection;

        // Find the other camera with a different lens direction
        CameraDescription newCamera;
        if (currentLensDirection == CameraLensDirection.front) {
          newCamera = widget.camera.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);
        } else {
          newCamera = widget.camera.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
        }

        await _controller.dispose();
        setState(() {
          _controller = CameraController(
            newCamera,
            ResolutionPreset.medium,
          );
          _initializeControllerFuture = _controller.initialize();
        });
      }
    } catch (e) {
      print('Error switching camera: $e');
    }
  }

  void _switchTouch() async {
    try {
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
      _controller.setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    } catch (e) {
      print('Error switching touch: $e');
    }
  }
}

