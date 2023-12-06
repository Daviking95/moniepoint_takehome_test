part of 'package:peerlendly/modules/onboarding/exports.dart';

class OnBoardingModel {
  final String? imagePath;
  final String? onBoardingTitle1;
  final String? onBoardingTitle2;
  final String? onBoardingTitle3;
  final String? description;

  OnBoardingModel({this.imagePath, this.onBoardingTitle1, this.onBoardingTitle2, this.onBoardingTitle3, this.description});

  List<OnBoardingModel> get onboardingList {
    return [
      OnBoardingModel(
        imagePath: PLAssets.pageviewOnePng,
        onBoardingTitle1: "Request for",
        onBoardingTitle2: "loans",
        onBoardingTitle3: "with confidence",
        description: strOnboardingDesc1,
      ),
      OnBoardingModel(
        imagePath: PLAssets.pageviewTwoPng,
        onBoardingTitle1: "Build your",
        onBoardingTitle2: "wealth",
        onBoardingTitle3: "today",
        description: strOnboardingDesc2,
      ),
      OnBoardingModel(
        imagePath: PLAssets.pageviewThreePng,
        onBoardingTitle1: "Let your",
        onBoardingTitle2: "money",
        onBoardingTitle3: "work for you",
        description: strOnboardingDesc3,
      ),
    ];
  }
}
