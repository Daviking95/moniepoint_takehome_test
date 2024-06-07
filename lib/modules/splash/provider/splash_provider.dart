
part of 'package:moniepoint_mobile/modules/splash/exports.dart';

class SplashProvider extends BaseViewModel{

  final BuildContext? context;
  final bool shouldInitialize;

  SplashProvider(
      {this.context,
        this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState SplashProvider Called".logger();

    if (shouldInitialize) {
      loadNextPage();
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  void loadNextPage() {
    Future.delayed(const Duration(seconds: 2), () async {
      AppNavigator.pushAndRemoveUtil(const FloatingTab());
    });
  }
}