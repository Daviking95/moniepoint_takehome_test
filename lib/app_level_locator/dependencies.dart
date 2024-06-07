part of 'package:moniepoint_mobile/app_level_locator/exports.dart';

class MonieEstateDependencies extends StatelessWidget {
  final Widget child;

  const MonieEstateDependencies({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: child,
    );
  }
}
