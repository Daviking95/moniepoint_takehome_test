part of 'package:peerlendly/modules/home/exports.dart';

class DashboardProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  DashboardProvider({this.context, this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState DashboardProvider Called".logger();

    // if (shouldInitialize) {
    //   walletWatcher?.getShowBalance();
    //
    //   getUserProfile();
    // }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  void getUserProfile() async {
    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.getUserProfileService();

    "responseDataGetUserProfile $responseData".logger();
  }

  void getLendlyScoreProfile() async {
    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.getLendlyScoreService();

    "responseDataGetLendlyScore $responseData".logger();
  }

  void getProfilePic() async {
    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.getProfilePicService();

    "responseDataGetProfilePic $responseData".logger();
  }
}
