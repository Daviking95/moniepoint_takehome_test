part of 'package:nova/modules/home/exports.dart';

class DashboardProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;
  final bool shouldLoadDashboardData;

  DashboardProvider({this.context, this.shouldInitialize = false, this.shouldLoadDashboardData = false});

  @override
  FutureOr<void> initState() {
    "initState DashboardProvider Called".logger();

    // if (shouldInitialize) {
    //   walletWatcher?.getShowBalance();
    //
    //   getUserProfile();
    // }

    if(shouldLoadDashboardData){
      WalletProvider walletProvider = Provider.of<WalletProvider>(context!, listen: false);
      ProfileProvider profileProvider = Provider.of<ProfileProvider>(context!, listen: false);

      loadData();
      walletProvider.getShowBalance();
      profileProvider.getNigeriaBanks();
      profileProvider.getBankDetails();
    }
  }

  loadData(){
      getUserProfile();
      getLendlyScoreProfile();
      getProfilePic();
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  getUserProfile() async {
    final dartz.Either<ErrorResponseModel, GetUserProfileResponseModel> responseData =
        await PLProfileRepository.instance.getUserProfileService();

    return responseData.fold((errorResponse) async {

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppData.getUserProfileResponseModel = successResponse;

      AppData.mixpanel!.identify(AppData.getUserProfileResponseModel?.fullName ?? "");

      AppPreferences.isUserBvnVerified = (AppData.getUserProfileResponseModel?.bvnVerified ?? false);
      "responseDataGetUserProfile $responseData ${AppData.getUserProfileResponseModel?.bvnVerified}".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });

  }


  createWallet(BuildContext context, String accountName, String email) async {
      await changeLoaderStatus(true, "Creating wallet");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, CreateWalletResponseModel>
      responseData = await PLSignupRepository.instance
          .createWalletService(accountName, email);

      "responseDatacreateWallet $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        showSnackAtTheTop(
            message: successResponse.responseMessage, isSuccess: true);

        await changeLoaderStatus(false, "");
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

      AppData.lendlyScoreResponseModel = successResponse;

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

      AppData.profilePicture = successResponse.message;

      await changeLoaderStatus(false, "");
      notifyListeners();
    });

  }

  refreshDashboard() {}
}
