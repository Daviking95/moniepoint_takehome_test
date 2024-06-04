part of 'package:nova/modules/onboarding/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final onboardingReader;

  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.unfocus();
    onboardingReader = AppNavigator.appContext!.read<OnboardingProvider>();
    onboardingReader.loadApp(context);

    // _callingCrypto();
  }

  @override
  Widget build(BuildContext context) {
    return NovaScaffold(
      backgroundColor: context.theme.primaryColor,
      body: Container(
        decoration:  const BoxDecoration(
            color: NovaColors.appPrimaryColorMain500),
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.5, end: 1),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 1000),
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: Transform.translate(
                  offset: Offset(0, -100 * (1 - value)),
                  child: NovaImagePng(
                    imgPath: NovaAssets.logoWhitePng,
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // void _callingCrypto() async{
  //   "Encrypt ${await cryptString("Checking if this works")}".log();
  // }
}