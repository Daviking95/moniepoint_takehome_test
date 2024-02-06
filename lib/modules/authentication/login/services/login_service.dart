
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:peerlendly/core/exports.dart';
import 'package:peerlendly/modules/authentication/login/models/LoginRequestModel.dart';

import '../../../../core/utils/helper_functions/exports.dart';
import '../../../../shared/models/error_response_model.dart';
import '../../../../shared/models/generic_response_model.dart';
import '../models/SwitchAccountRequestModel.dart';

abstract class PLLoginService {
  Future<Either<ErrorResponseModel, GenericResponseModel>>
  loginService(LoginRequestModel loginRequestModel);
  Future<Either<ErrorResponseModel, GenericResponseModel>> switchAccountService(
      SwitchAccountRequestModel switchAccountRequestModel);
}

class PLLoginRepository extends PLLoginService {

  PLLoginRepository._();

  static PLLoginRepository instance = PLLoginRepository._();

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> loginService(LoginRequestModel loginRequestModel) async{
    // TODO: implement loginService
    try {
      final Map<String, dynamic> requestData = {
        "emailAddress": loginRequestModel.emailAddress,
        "securityPin": loginRequestModel.securityPin,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      AppData.mixpanel!.timeEvent("LoginService");

      var responseData = await NetworkService.post(
          url: NetworkConstants.loginUrl, data: encryptedData);

      // "responseDataLoginService ${await decryptString(responseData)}"
      //     .log();
      //
      // var decryptedResponse = await decryptString(responseData);
      //
      // "decryptedResponse $decryptedResponse".log();

      AppPreferences.bearerToken = responseData;

      AppData.mixpanel!.track("LoginService");

      return Right(
          GenericResponseModel(message: "Login Successful", success: true));
    } catch (e) {
      "LoginServiceError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> switchAccountService(
      SwitchAccountRequestModel switchAccountRequestModel) async {
    // TODO: implement switchAccountService
    try {
      final Map<String, dynamic> requestData = {
        "emailAddress": switchAccountRequestModel.emailAddress,
        "securityPin": switchAccountRequestModel.securityPin,
        "otpCode": switchAccountRequestModel.otpCode
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.switchAccountUrl, data: encryptedData);

      // var decryptedResponse = await decryptString(responseData);
      //
      // "responseDataSwitchAccountService $decryptedResponse".log();

      AppPreferences.bearerToken = responseData;

      return Right(
          GenericResponseModel(message: "Login Successful", success: true));
    } catch (e) {
      "OnboardCustomerError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }
}
