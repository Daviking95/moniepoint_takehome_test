part of 'package:peerlendly/modules/onboarding/exports.dart';

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
    return PLScaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Container(
        decoration:  const BoxDecoration(
            color: PLColors.appWhiteColor),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PLImagePng(
                imgPath: PLAssets.logoWithNamePng,
                width: 186.w,
                height: 182.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _callingCrypto() async{
  //   "Encrypt ${await cryptString("Checking if this works")}".log();
  // }
}