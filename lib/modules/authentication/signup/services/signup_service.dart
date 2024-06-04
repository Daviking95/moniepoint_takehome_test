import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nova/core/exports.dart';
import 'package:nova/shared/models/generic_response_model.dart';

import '../../../../core/network/exports.dart';
import '../../../../shared/models/error_response_model.dart';
import '../models/CreateWalletResponseModel.dart';
import '../models/OnboardCustomerRequestModel.dart';
import '../models/VerifyBvnResponseModel.dart';
import '../models/VerifyCustomerDetailsRequestModel.dart';

abstract class PLSignupService {
  Future<Either<ErrorResponseModel, GenericResponseModel>> confirmEmailDoesNotExistService(
      String emailAddress);

  Future<Either<ErrorResponseModel, GenericResponseModel>> getOtpService(
      String emailAddress);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      onboardCustomerService(
          OnboardCustomerRequestModel onboardCustomerRequestModel);

  Future<Either<ErrorResponseModel, VerifyBvnResponseModel>> verifyBvnService(
      String bvn);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      verifyCustomerDetailsService(
          VerifyCustomerDetailsRequestModel verifyCustomerDetailsRequestModel);

  Future<Either<ErrorResponseModel, CreateWalletResponseModel>>
      createWalletService(String accountName, String email);
}

class PLSignupRepository extends PLSignupService {
  PLSignupRepository._();

  static PLSignupRepository instance = PLSignupRepository._();

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> confirmEmailDoesNotExistService(
      String emailAddress) async {
    // TODO: implement confirmEmailDoesNotExistService
    try {
      final Map<String, dynamic> requestData = {"emailAddress": emailAddress};

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.emailEExistUrl, data: encryptedData);

      "responseDatagConfirmEmailIsUniqueService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "confirmEmailDoesNotExistServiceError $e".logger();
      var decryptedResponse = await decryptString(e.toString());

      "confirmEmailDoesNotExistServiceError $decryptedResponse".logger();
      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> getOtpService(
      String emailAddress) async {
    // TODO: implement getOtpForSignupService
    try {
      final Map<String, dynamic> requestData = {"emailAddress": emailAddress};

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.getOtpForSignupUrl, data: encryptedData);

      "responseDatagetOtpForSignupService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "getOtpServiceError $e".logger();

      Map<String, dynamic> error = e as Map<String, dynamic>;

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: error['message'],
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      onboardCustomerService(
          OnboardCustomerRequestModel onboardCustomerRequestModel) async {
    // TODO: implement onboardCustomerService
    try {
      final Map<String, dynamic> requestData = {
        "emailAddress": onboardCustomerRequestModel.emailAddress,
        "otp": onboardCustomerRequestModel.otp,
        "pin": onboardCustomerRequestModel.pin,
        "confirmPin": onboardCustomerRequestModel.confirmPin
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.onboardCustomerUrl, data: encryptedData);

      AppPreferences.bearerToken = responseData;

      return Right(GenericResponseModel(
          message: "Welcome !!!. Your account has been created",
          success: true));
    } catch (e) {
      "OnboardCustomerError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, VerifyBvnResponseModel>> verifyBvnService(
      String bvn) async {
    // TODO: implement verifyBvnService
    try {
      final Map<String, dynamic> requestData = {
        "bvn": bvn,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(bvn)
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.verifyBvnUrl, data: encryptedData);

      "responseDataVerifyBVNService ${await decryptString(responseData)}".log();

      var decryptedResponse = await decryptString(responseData);

      VerifyBvnResponseModel getUserProfileResponseModel =
          VerifyBvnResponseModel.fromJson(jsonDecode(decryptedResponse));

      return Right(getUserProfileResponseModel.copyWith(message: getUserProfileResponseModel.otp)
          );
    } catch (e) {
      "VerifyBVNError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      verifyCustomerDetailsService(
          VerifyCustomerDetailsRequestModel
              verifyCustomerDetailsRequestModel) async {
    // TODO: implement verifyCustomerDetailsService
    try {
      final Map<String, dynamic> requestData = {
        "otp": verifyCustomerDetailsRequestModel.otp,
        "customerImage": verifyCustomerDetailsRequestModel.customerImage,
        "meansOfId": verifyCustomerDetailsRequestModel.meansOfId,
        "idNumber": verifyCustomerDetailsRequestModel.idNumber,
        "idImage": verifyCustomerDetailsRequestModel.idImage
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.verifyCustomerDetailsUrl, data: encryptedData);

      "responseDataVerifyCustomerDetailsService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "VerifyCustomerDetailsError $e".logger();

      var decryptedResponse = await decryptString(e.toString());

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, CreateWalletResponseModel>> createWalletService(String accountName, String email) async{

    // TODO: implement createWalletService
    try {
      final Map<String, dynamic> requestData = {
        "accountName": accountName,
        "email": email,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.createWalletUrl, data: encryptedData);

      "responseDataVerifyCustomerDetailsService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      CreateWalletResponseModel createWalletResponseModel =
      CreateWalletResponseModel.fromJson(jsonDecode(decryptedResponse));

      return Right(createWalletResponseModel);
    } catch (e) {
      "createWalletServiceError $e".logger();

      var decryptedResponse = await decryptString(e.toString());

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }
}
