part of 'package:nova/modules/authentication/complete_account_setup/exports.dart';

class BvnImageCapture extends StatelessWidget {
  final String otp;
  const BvnImageCapture({Key? key, required this.otp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final completeAccountWatcher =
        context.watch<CompleteAccountSetupProvider>();

    return AppBaseWidget(
      iconSet: Container(),
      buildWidget: NovaOverlayLoader(
        startLoader: completeAccountWatcher.isLoading,
        loadingString: completeAccountWatcher.loadingString,
        child: BvnImageWidget(completeAccountWatcher: completeAccountWatcher, otp : otp),
      ),
      topHeight: 80.h,
    );
  }
}

class BvnImageWidget extends StatelessWidget {
  final CompleteAccountSetupProvider completeAccountWatcher;
  final String otp;

  const BvnImageWidget({
    super.key,
    required this.completeAccountWatcher,
    required this.otp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(48),
                    NovaTextWidget(
                      title: "Setup Profile",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(5),
                    NovaTextWidget(
                      title: "Take a headshot",
                      textColor: NovaColors.appGrayText,
                      textSize: NovaTypography.fontLabelMedium,
                    ),
                    NovaVSpace(64),

                    GestureDetector(
                        onTap: _capture,
                        child: completeAccountWatcher.bvnImage.path.isNotEmpty
                            ? Column(
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: NovaDecorations
                                          .borderRadiusGeometryCircular20,
                                      child: Image(
                                        image: FileImage(File(
                                            completeAccountWatcher
                                                .bvnImage.path)),
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  NovaVSpace(32),
                                  NovaTextWidget(
                                    title: "Great! You’re all set.",
                                    textColor: NovaColors.appGrayText,
                                    textSize: NovaTypography.fontBodyMedium,
                                  ),
                                ],
                              )
                            : Center(
                                child: NovaImagePng(
                                imgPath: NovaAssets.takeSelfie,
                                height: 156.h,
                                width: 156.w,
                              ))),
                    NovaVSpace(40),
                    if (completeAccountWatcher.bvnImage.path.isNotEmpty)
                      PLButtonOutline(
                          borderColor: NovaColors.appPrimaryColorMain500,
                          textTitle: "Retake Photo",
                          functionToRun: _capture),

                    NovaButtonRound(
                      textTitle: strProceed,
                      functionToRun: () => completeAccountWatcher
                              .bvnImage.path.isEmpty
                          ? _capture()
                          : completeAccountWatcher.validateBvnDataForm(context, otp),
                    ),
                    // PLVSpace(32),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _capture() async {
    List<CameraDescription> cameras;
    cameras = await availableCameras();
    AppNavigator.push(CameraScreen(
      camera: cameras,
      callback: (XFile xfile) {
        completeAccountWatcher.bvnImage = xfile;
      },
    ));
  }
}
