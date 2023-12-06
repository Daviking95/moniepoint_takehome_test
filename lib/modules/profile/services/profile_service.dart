import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:peerlendly/core/exports.dart';

import '../../../core/network/exports.dart';
import '../../../core/utils/helper_functions/exports.dart';
import '../../../shared/models/error_response_model.dart';
import '../../../shared/models/generic_response_model.dart';
import '../models/BankDetailsResponseModel.dart';
import '../models/CardDetailsRequestModel.dart';
import '../models/CardDetailsResponseModel.dart';
import '../models/GetUserProfileResponseModel.dart';
import '../models/LendlyScoreResponseModel.dart';
import '../models/NigeriaBankResponseModel.dart';
import '../models/UpdateProfileRequestModel.dart';

abstract class PLProfileService {
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      getUserProfileService();

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      getLendlyScoreService();

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      getProfilePicService();

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      sendForgotPinMailService(String email);

  Future<Either<ErrorResponseModel, GenericResponseModel>> forgotPinService(
      String email, String pin);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      createBankDetailsService(String bankName, String accountNumber);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
      createCardDetailsService(List<CardDetailsRequestModel> cardList);

  Future<Either<ErrorResponseModel, GenericResponseModel>> updateProfileService(
      UpdateProfileRequestModel updateProfileRequestModel);

  Future<Either<ErrorResponseModel, BankDetailsResponseModel>>
      getBankDetailsService();

  Future<Either<ErrorResponseModel, CardDetailsResponseModel>>
      getCardDetailsService();

  Future<Either<ErrorResponseModel, List<NigeriaBankResponseModel>>>
  getNigeriaBanksService();

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  deleteBankOrCardService(String id, bool isCard);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  verifyBankDetailsService(String bankName, String accountNumber);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  deleteCustomerService(String id);

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  updateProfilePicService(String base64Pic);
}

class PLProfileRepository extends PLProfileService {
  PLProfileRepository._();
  static PLProfileRepository instance = PLProfileRepository._();

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      getUserProfileService() async {
    // TODO: implement loginService
    try {
      var responseData =
          await NetworkService.get(url: NetworkConstants.getUserProfileUrl);

      "getUserProfileService ${responseData}".logger();

      var decryptedResponse = await decryptString(responseData);

      GetUserProfileResponseModel getUserProfileResponseModel =
          GetUserProfileResponseModel.fromJson(jsonDecode(decryptedResponse));

      UserData.getUserProfileResponseModel = getUserProfileResponseModel;

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "GetUserProfileError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
  getLendlyScoreService() async {
    // TODO: implement loginService
    try {
      var responseData =
          await NetworkService.get(url: NetworkConstants.lendlyScoreUrl);

      "getLendlyScoreService ${responseData}".logger();

      var decryptedResponse = await decryptString(responseData);

      LendlyScoreResponseModel lendlyScoreResponseModel =
      LendlyScoreResponseModel.fromJson(jsonDecode(decryptedResponse));

      UserData.lendlyScoreResponseModel = lendlyScoreResponseModel;

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "GetLendlyScoreError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
  getProfilePicService() async {
    // TODO: implement loginService
    try {
      var responseData =
          await NetworkService.get(url: NetworkConstants.profilePictureUrl);

      "getProfilePicService ${responseData}".logger();

      // var decryptedResponse = await decryptString(responseData);

      Uint8List decodedImage = base64.decode(responseData);

      UserData.profilePicture = responseData;

      return Right(
          GenericResponseModel(message: "", success: true));
    } catch (e) {
      "GetProfilePicError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> forgotPinService(
      String email, String pin) async {
    // TODO: implement forgotPinService
    try {
      final Map<String, dynamic> requestData = {
        "emailAddress": email,
        "pin": pin,
        "confirmPin": pin
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.forgotPinUrl, data: encryptedData);

      return Right(GenericResponseModel(
          message: "Pin change is successful", success: true));
    } catch (e) {
      "OnboardCustomerError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      sendForgotPinMailService(String email) async {
    // TODO: implement sendForgotPinMailService
    try {
      final Map<String, dynamic> requestData = {
        "email": email,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(email)
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.sendForgotPinMailUrl, data: encryptedData);

      "responseDataForgotPinMailService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "ForgotPinMailError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> updateProfileService(
      UpdateProfileRequestModel updateProfileRequestModel) async {
    // TODO: implement updateProfileService
    try {
      final Map<String, dynamic> requestData = {
        "profileSection": updateProfileRequestModel.profileSection,
        "firstName": updateProfileRequestModel.firstName,
        "lastName": updateProfileRequestModel.lastName,
        "mobileNumber": updateProfileRequestModel.mobileNumber,
        "dateOfBirth": updateProfileRequestModel.dateOfBirth,
        "identityTypeID": updateProfileRequestModel.identityTypeId,
        "identificationIdNumber":
            updateProfileRequestModel.identificationIdNumber,
        "gender": updateProfileRequestModel.gender,
        "maritalStatus": updateProfileRequestModel.maritalStatus,
        "meansOfAddressVerifications":
            updateProfileRequestModel.meansOfAddressVerifications,
        "homeAddress": updateProfileRequestModel.homeAddress,
        "nameOfNextOfKin": updateProfileRequestModel.nameOfNextOfKin,
        "relationshipWithNextOfKin":
            updateProfileRequestModel.relationshipWithNextOfKin,
        "emailOfNextOfKin": updateProfileRequestModel.emailOfNextOfKin,
        "phoneNumberOfNextOfKin":
            updateProfileRequestModel.phoneNumberOfNextOfKin,
        "homeAddressOfNextOfKin":
            updateProfileRequestModel.homeAddressOfNextOfKin,
        "employmentType": updateProfileRequestModel.employmentType,
        "monthlyEarnings": updateProfileRequestModel.monthlyEarnings,
        "salaryDay": updateProfileRequestModel.salaryDay,
        "jobTitle": updateProfileRequestModel.jobTitle,
        "companyName": updateProfileRequestModel.companyName,
        "officeEmail": updateProfileRequestModel.officeEmail,
        "officeAddress": updateProfileRequestModel.officeAddress,
        "officeLocalGovernment":
            updateProfileRequestModel.officeLocalGovernment,
        "officeState": updateProfileRequestModel.officeState,
        "governmentIssuedID": updateProfileRequestModel.governmentIssuedId,
        "proofOfAddress": updateProfileRequestModel.proofOfAddress,
        "proofOfEmployment": updateProfileRequestModel.proofOfEmployment,
        "additionalDocument": updateProfileRequestModel.additionalDocument
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(jsonEncode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.updateUserProfileUrl, data: encryptedData);

      "responseDataUpdateProfileService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "UpdateProfileError $e".logger();

      var decryptedResponse = await decryptString(e.toString());

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      createBankDetailsService(String bankName, String accountNumber) async {
    // TODO: implement createBankDetailsService
    try {
      final Map<String, dynamic> requestData = {
        "bankName": bankName,
        "accountNumber": accountNumber
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.bankDetailsUrl, data: encryptedData);

      "responseDataCreateBankDetailsService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "CreateBankDetailsError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      verifyBankDetailsService(String bankName, String accountNumber) async {
    // TODO: implement createBankDetailsService
    try {
      final Map<String, dynamic> requestData = {
        "bankName": bankName,
        "accountNumber": accountNumber
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.validateBankDetailsUrl, data: encryptedData);

      "responseDataValidateBankDetailsService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "ValidateBankDetailsError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, BankDetailsResponseModel>>
      getBankDetailsService() async {
    // TODO: implement getBankDetailsService
    try {
      var responseData =
          await NetworkService.get(url: NetworkConstants.bankDetailsUrl);

      "responseDataGetBankDetailsService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      BankDetailsResponseModel bankDetailsResponseModel =
          BankDetailsResponseModel.fromJson(jsonDecode(decryptedResponse));

      return Right(bankDetailsResponseModel);
    } catch (e) {
      "GetBankDetailsError $e".logger();

      var decryptedResponse = await decryptString(e.toString());

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, CardDetailsResponseModel>> getCardDetailsService() async{
    // TODO: implement getCardDetailsService
    try {
      var responseData =
      await NetworkService.get(url: NetworkConstants.cardDetailsUrl);

      "responseDataGetCardDetailsService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      CardDetailsResponseModel cardDetailsResponseModel =
      CardDetailsResponseModel.fromJson(jsonDecode(decryptedResponse));

      return Right(cardDetailsResponseModel);
    } catch (e) {
      "GetBankDetailsError $e".logger();

      var decryptedResponse = await decryptString(e.toString());

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: decryptedResponse,
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, List<NigeriaBankResponseModel>>>
      getNigeriaBanksService() async {
    // TODO: implement getNigeriaBanksService
    try {
      var responseData =
          await NetworkService.get(url: NetworkConstants.getNigeriaBanksUrl, customBaseUrl: "");

      List<NigeriaBankResponseModel> nigeriaBanks = jsonDecode(responseData)
          .map<NigeriaBankResponseModel>((data) => NigeriaBankResponseModel.fromJson(data))
          .toList();

      return Right(nigeriaBanks);
    } catch (e) {
      "GetNigeriaBanksError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      deleteBankOrCardService(String id, bool isCard) async {
    // TODO: implement getNigeriaBanksService
    try {
      final Map<String, dynamic> requestData = {
        "bvn": id,
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(id)
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.delete(
          url: isCard ? NetworkConstants.cardDetailsUrl : NetworkConstants.bankDetailsUrl, data: encryptedData);

      "responseDataDeleteBankOrCardService ${await decryptString(responseData)}".log();

      var decryptedResponse = await decryptString(responseData);


      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "DeleteBankOrCardError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      deleteCustomerService(String id) async {
    // TODO: implement getNigeriaBanksService
    try {

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(id)
      };

      var responseData = await NetworkService.delete(
          url: NetworkConstants.customerUrl, data: encryptedData);

      "responseDataDeleteCustomerService ${await decryptString(responseData)}".log();

      var decryptedResponse = await decryptString(responseData);


      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "DeleteCustomerError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>>
      createCardDetailsService(List<CardDetailsRequestModel> cardList) async {
    // TODO: implement createCardDetailsService
    try {
      final Map<String, dynamic> requestData = {
        "cardDetails": cardList
      };

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(requestData))
      };

      "requestData $encryptedData $requestData".log();

      var responseData = await NetworkService.post(
          url: NetworkConstants.cardDetailsUrl, data: encryptedData);

      "responseDataCreateCardDetailsService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "CreateCardDetailsError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> updateProfilePicService(String base64Pic) async{
    // TODO: implement updateProfilePicService
    try {

      final Map<String, dynamic> encryptedData = {
        "requestBody": await cryptString(json.encode(base64Pic))
      };

      "requestData $encryptedData".log();

      var responseData = await NetworkService.patch(
          url: NetworkConstants.profilePictureUrl, data: encryptedData);

      "responseDataUpdateProfilePicService ${await decryptString(responseData)}"
          .log();

      var decryptedResponse = await decryptString(responseData);

      return Right(
          GenericResponseModel(message: decryptedResponse, success: true));
    } catch (e) {
      "UpdateProfilePicError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }
}
