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
    final dartz.Either<ErrorResponseModel, GetUserProfileResponseModel> responseData =
        await PLProfileRepository.instance.getUserProfileService();

    return responseData.fold((errorResponse) async {

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      UserData.getUserProfileResponseModel = successResponse;

      "responseDataGetUserProfile $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });

  }

  void getLendlyScoreProfile() async {
    final dartz.Either<ErrorResponseModel, LendlyScoreResponseModel> responseData =
        await PLProfileRepository.instance.getLendlyScoreService();

    return responseData.fold((errorResponse) async {

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      UserData.lendlyScoreResponseModel = successResponse;

      "responseDataGetLendlyScore $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });

  }

  void getProfilePic() async {
    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.getProfilePicService();

    return responseData.fold((errorResponse) async {

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      "responseDataGetProfilePic $responseData".logger();

      UserData.profilePicture = successResponse.message;

      await changeLoaderStatus(false, "");
      notifyListeners();
    });

  }
}
