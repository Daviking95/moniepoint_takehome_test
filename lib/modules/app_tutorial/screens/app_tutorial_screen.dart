part of 'package:peerlendly/modules/app_tutorial/exports.dart';

class AppTutorialScreen extends StatelessWidget {
  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseStackedWidget(
      iconSet: PLAssets.peopleSmiling,
      buildWidget: const TutorialMainWidget(),
      topHeight: 200.h,
    );
  }
}
