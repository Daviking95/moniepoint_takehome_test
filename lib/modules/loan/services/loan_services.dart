import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nova/core/exports.dart';

import '../../../core/utils/helper_functions/exports.dart';
import '../../../shared/models/error_response_model.dart';
import '../../../shared/models/generic_response_model.dart';
import '../models/ActivePendingLoansResponseModel.dart';
import '../models/LenderOffersResponseModel.dart';
import '../models/LoanApplyRequestModel.dart';
import '../models/LoogedInUserLoanResponseModel.dart';
import '../models/MakeLoanOfferRequestModel.dart';
import '../models/MarketplaceResponseModel.dart';
import '../models/RepayLoanWithCardModel.dart';

abstract class PLLoanService {
  Future<Either<ErrorResponseModel, GenericResponseModel>> loanApplyService(
      LoanApplyRequestModel loanApplyRequestModel);

  Future<Either<ErrorResponseModel, MarketplaceResponseModel>>
      loanMarketplaceService();

  Future<Either<ErrorResponseModel, LenderOffersResponseModel>>
      getLoanOffersFromLendersService();

  Future<Either<ErrorResponseModel, ActivePendingLoansResponseModel>>
      getActivePendingLoanOffersService(int loanStatus);

  Future<Either<ErrorResponseModel, MarketplaceResponseModel>>
      getSingleLoanOfferDetailsService(String offerId);

  Future<Either<ErrorResponseModel, LoogedInUserLoanResponseModel>>
      getLoggedInUserLoanDetailsService();

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      repayLoanWitWalletService(int loanId, int loanAmount);

  Future<Either<ErrorResponseModel, LoogedInUserLoanResponseModel>>
      calculateLoanService(int loanId, int percentage);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      repayLoanWithCardService(RepayLoanWithCardModel repayLoanWithCardModel);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  acceptLoanOfferService(String offerId);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  cancelLoanOfferService(String loanId);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  cancelLoanRequestService(String loanId);

  Future<Either<ErrorResponseModel, MarketplaceResponseModel>>
  getBorrowerLoanHistoryService(int borrowerId);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  verifyPinService(String transactionPin);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  makeLoanOfferService(MakeLoanOfferRequestModel makeLoanOfferRequestModel);
}

class PLLoanRepository extends PLLoanService {
  PLLoanRepository._();

  static PLLoanRepository instance = PLLoanRepository._();

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> loanApplyService(
      LoanApplyRequestModel loanApplyRequestModel) async {
    // TODO: implement loanApplyService
    try {
      final Map<String, dynamic> requestData = {
        "loanAmount": loanApplyRequestModel.loanAmount,
        "loanReason": loanApplyRequestModel.loanReason,
        "tenor": loanApplyRequestModel.tenor,
        "repaymentDate": loanApplyRequestModel.repaymentDate
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      AppData.mixpanel!.timeEvent("LoanApplication");

      var responseData = await NetworkService.post(
          url: NetworkConstants.loanApplyUrl, data: encryptedData);

      "loanApplyService $responseData".logger();

      AppData.mixpanel!.track("LoanApplication", properties: {'user': AppData.getUserProfileResponseModel?.fullName ?? ""});

      return Right(GenericResponseModel(
          message: "Loan application successful", success: true));
    } catch (e) {
      "loanApplyServiceError $e".logger();

      var decryptedResponse = await decryptString(e.toString());

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, MarketplaceResponseModel>>
      loanMarketplaceService() async {
    // TODO: implement loanMarketplaceService
    try {
      var responseData =
          await NetworkService.get(url: NetworkConstants.loanMarketplaceUrl);

      "loanMarketplaceService ${responseData}".logger();

      var decryptedResponse = await decryptString(responseData);

      MarketplaceResponseModel marketplaceResponseModel =
          MarketplaceResponseModel.fromJson(jsonDecode(decryptedResponse));

      "loanMarketplaceService 1 ${marketplaceResponseModel}".logger();

      return Right(marketplaceResponseModel);
    } catch (e) {
      "loanMarketplaceServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, LenderOffersResponseModel>>
      getLoanOffersFromLendersService() async {
    // TODO: implement getLoanOffersFromLendersService
    try {
      var responseData =
          await NetworkService.get(url: NetworkConstants.offersFromLendersUrl);

      "getLoanOffersFromLendersService ${responseData}".logger();

      var decryptedResponse = await decryptString(responseData);

      LenderOffersResponseModel lenderOffersResponseModel =
      LenderOffersResponseModel.fromJson(jsonDecode(decryptedResponse));

      // "loanMarketplaceService 1 ${marketplaceResponseModel}".logger();
      //
      // UserData.marketplaceLoans = marketplaceResponseModel.loanDetails;

      return Right(lenderOffersResponseModel);
    } catch (e) {
      "getLoanOffersFromLendersServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, ActivePendingLoansResponseModel>>
      getActivePendingLoanOffersService(int loanStatus) async {
    // TODO: implement getMarketplaceLoansService
    try {
      var responseData = await NetworkService.get(
          url:
              "${NetworkConstants.activePendingLoanOffersUrl}/${encryptRequest(loanStatus.toString())}");

      "getActivePendingLoanOffersService ${responseData}".logger();

      var decryptedResponse = await decryptString(responseData);

      ActivePendingLoansResponseModel activePendingLoansResponseModel =
      ActivePendingLoansResponseModel.fromJson(jsonDecode(decryptedResponse));

      return Right(activePendingLoansResponseModel);
    } catch (e) {
      "getActivePendingLoanOffersServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, MarketplaceResponseModel>>
      getSingleLoanOfferDetailsService(String offerId) async {
    // TODO: implement getSingleLoanOfferDetailsService
    try {
      var responseData = await NetworkService.get(
          url:
              "${NetworkConstants.singleLoanOfferUrl}/${encryptRequest(offerId)}");

      "getSingleLoanOfferDetailsService ${responseData}".logger();

      var decryptedResponse = await decryptString(responseData);

      MarketplaceResponseModel marketplaceResponseModel =
          MarketplaceResponseModel.fromJson(jsonDecode(decryptedResponse));

      // "loanMarketplaceService 1 ${marketplaceResponseModel}".logger();
      //
      // UserData.activeOffers = marketplaceResponseModel.loanDetails;
      // UserData.pendingOffers = marketplaceResponseModel.loanDetails;

      return Right(marketplaceResponseModel);
    } catch (e) {
      "getSingleLoanOfferDetailsServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, LoogedInUserLoanResponseModel>>
      getLoggedInUserLoanDetailsService() async {
    // TODO: implement getSingleLoanDetailsService
    try {
      var responseData = await NetworkService.get(
          url:
              NetworkConstants.loggedInUserLoanDetailsUrl);

      "getSingleLoanDetailsService ${responseData}".logger();

      var decryptedResponse = await decryptString(responseData);

      LoogedInUserLoanResponseModel? loogedInUserLoanResponseModel;

      if(decryptedResponse != {}){
        loogedInUserLoanResponseModel =
        LoogedInUserLoanResponseModel.fromJson(jsonDecode(decryptedResponse));

        "loogedInUserLoanResponseModel 1 ${loogedInUserLoanResponseModel}".logger();
      }

      return Right(loogedInUserLoanResponseModel!);
    } catch (e) {
      "getSingleLoanDetailsServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> repayLoanWitWalletService(int loanId, int loanAmount) async {
    // TODO: implement loanApplyService
    try {
      final Map<String, dynamic> requestData = {
        "loanAmount": loanAmount,
        "loanId": loanId,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.repayLoanWithWalletUrl, data: encryptedData);

      "repayLoanWitWalletService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Loan repayment successful", success: true));
    } catch (e) {
      "repayLoanWitWalletServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> repayLoanWithCardService(RepayLoanWithCardModel repayLoanWithCardModel) async{
    // TODO: implement repayLoanWithCardService
    try {
      final Map<String, dynamic> requestData = {
        "loanId": repayLoanWithCardModel.loanId,
        "loanAmount": repayLoanWithCardModel.loanAmount,
        "cardNumber": repayLoanWithCardModel.cardNumber,
        "cvv": repayLoanWithCardModel.cvv,
        "expiryDate": repayLoanWithCardModel.expiryDate
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.repayLoanWithCardUrl, data: encryptedData);

      "repayLoanWithCardService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Loan repayment successful", success: true));
    } catch (e) {
      "repayLoanWithCardServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, LoogedInUserLoanResponseModel>> calculateLoanService(int loanId, int percentage) async{
    // TODO: implement calculateLoanService
    try {
      final Map<String, dynamic> requestData = {
        "percentage": percentage,
        "loanId": loanId,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.calculateLoanUrl, data: encryptedData);

      "calculateLoanService $responseData".logger();

      var decryptedResponse = await decryptString(responseData);

      LoogedInUserLoanResponseModel loogedInUserLoanResponseModel =
      LoogedInUserLoanResponseModel.fromJson(jsonDecode(decryptedResponse));

      "calculateLoanServiceloogedInUserLoanResponseModel 1 ${loogedInUserLoanResponseModel}".logger();

      return Right(loogedInUserLoanResponseModel);
    } catch (e) {
      "calculateLoanServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> acceptLoanOfferService(String offerId) async{
    // TODO: implement acceptLoanOfferService
    try {
      final Map<String, dynamic> requestData = {
        "offerId": offerId,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(offerId)
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.patch(
          url: NetworkConstants.acceptOfferUrl, data: encryptedData);

      "acceptLoanOfferService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Loan offer accepted successful", success: true));
    } catch (e) {
      "acceptLoanOfferServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> makeLoanOfferService(MakeLoanOfferRequestModel makeLoanOfferRequestModel) async{
    // TODO: implement makeLoanOfferService
    try {
      final Map<String, dynamic> requestData = {
        "loanId": makeLoanOfferRequestModel.loanId,
        "percentage": makeLoanOfferRequestModel.percentage,
        "lenderUserId": makeLoanOfferRequestModel.lenderUserId,
        "borrowerUserId": makeLoanOfferRequestModel.borrowerUserId
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.makeLoanOfferUrl, data: encryptedData);

      "makeLoanOfferService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Loan offer sent successful", success: true));
    } catch (e) {
      "makeLoanOfferServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> cancelLoanOfferService(String loanId) async{
    // TODO: implement cancelLoanOfferService
    try {
      final Map<String, dynamic> requestData = {
        "loanId": loanId,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(loanId)
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.patch(
          url: NetworkConstants.cancelLoanOfferUrl, data: encryptedData);

      "cancelLoanOfferService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Loan offer cancelled successful", success: true));
    } catch (e) {
      "cancelLoanOfferServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> cancelLoanRequestService(String loanId) async{
    // TODO: implement cancelLoanRequestService
    try {
      final Map<String, dynamic> requestData = {
        "loanId": loanId,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(loanId)
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.delete(
          url: NetworkConstants.cancelLoanRequestUrl, data: encryptedData);

      "cancelLoanRequestService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Loan request cancelled successful", success: true));
    } catch (e) {
      "cancelLoanRequestServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> verifyPinService(String transactionPin) async{
    // TODO: implement verifyPinService
    try {

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(transactionPin)
      };

      "requestData $encryptedData $transactionPin".log();

      // var responseData = await NetworkService.post(
      //     url: NetworkConstants.verifyPinUrl, data: encryptedData);
      //
      // "verifyPinService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Pin verification successful", success: true));
    } catch (e) {
      "verifyPinServiceError $e".logger();

      var decryptedResponse = await decryptString(e.toString());

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, MarketplaceResponseModel>> getBorrowerLoanHistoryService(int borrowerId) async{
    // TODO: implement getBorrowerLoanHistoryService
    try {

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(borrowerId.toString())
      };

      "requestData $encryptedData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.loanHistoryUrl, data: encryptedData);

      "getBorrowerLoanHistoryService $responseData".logger();

      var decryptedResponse = await decryptString(responseData);

      MarketplaceResponseModel marketplaceResponseModel =
      MarketplaceResponseModel.fromJson(jsonDecode(decryptedResponse));

      return Right(marketplaceResponseModel);
    } catch (e) {
      "getBorrowerLoanHistoryServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }
}
