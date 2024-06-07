part of 'package:moniepoint_mobile/modules/splash/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashProvider>(
      vmBuilder: (context) =>
          SplashProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SplashProvider model) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(color: MonieEstateColors.appWhiteColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MonieEstateImagePng(
                imgPath: MonieEstateAssets.logoPng,
                width: 200.w,
                height: 150.h,
              ).animate().fade(
                duration: const Duration(milliseconds: 1500),
              ).slideY(duration: const Duration(milliseconds: 800)),
              MonieEstateVSpace(4),
              const SizedBox(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
