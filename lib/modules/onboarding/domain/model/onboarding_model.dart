part of 'package:nova/modules/onboarding/exports.dart';

class OnBoardingModel {
  final String? imagePath;
  final String? imagePathBg;
  final String? onBoardingTitle1;
  final String? onBoardingTitle2;

  OnBoardingModel({this.imagePath, this.imagePathBg, this.onBoardingTitle1, this.onBoardingTitle2});

  List<OnBoardingModel> get onboardingList {
    return [
      OnBoardingModel(
        imagePath: NovaAssets.pageviewOnePng,
        imagePathBg: NovaAssets.pageviewOneBgPng,
        onBoardingTitle1: "Fast and Secure",
        onBoardingTitle2: "Get off to a swift and dependable start with your banking, hassle-free. Your money is securely Protected",
      ),
      OnBoardingModel(
        imagePath: NovaAssets.pageviewTwoPng,
        imagePathBg: NovaAssets.pageviewTwoBgPng,
        onBoardingTitle1: "Easy Transactions",
        onBoardingTitle2: "Experience Nova Bank’s effortless Banking",
      ),
      OnBoardingModel(
        imagePath: NovaAssets.pageviewThreePng,
        imagePathBg: NovaAssets.pageviewThreeBgPng,
        onBoardingTitle1: "Empower Your Finances",
        onBoardingTitle2: "Unlock the future  of banking with Nova Bank your trusted financial companion",
      ),
    ];
  }
}
