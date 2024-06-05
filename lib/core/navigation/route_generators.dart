part of 'package:nova/core/navigation/exports.dart';

class RouteGenerator {
  static const String initialRoute = AppRoutes.splash;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(const SplashScreen(), settings: settings);
      case AppRoutes.onboarding:
        return buildRoute(const OnboardingScreen(), settings: settings);
      case AppRoutes.login:
        return buildRoute(const LoginScreen(), settings: settings);
      case AppRoutes.signUp:
        return buildRoute(const SignupScreen(), settings: settings);
      case AppRoutes.forgotPassword:
        return buildRoute(const ForgotPasswordScreen(), settings: settings);
      case AppRoutes.biometrics:
        return buildRoute(const BiometricScreen(), settings: settings);
      case AppRoutes.resetPassword:
        return buildRoute(const ResetPasswordScreen(), settings: settings);
      case AppRoutes.createNewPassword:
        return buildRoute(const CreateNewPasswordScreen(), settings: settings);
      case AppRoutes.verifyEmailAddress:
        return buildRoute(const VerifyEmailAddressScreen(), settings: settings);
      case AppRoutes.dashboard:
        return buildRoute(const DashboardScreen(), settings: settings);
      case AppRoutes.persistentTab:
        return buildRoute(const PersistentTab(), settings: settings);
      default:
        return buildRoute(const SplashScreen(), settings: settings);
    }
  }

  static popScreen(BuildContext context) {
    Navigator.pop(context);
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }
}
