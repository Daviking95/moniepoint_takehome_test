

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:peerlendly/core/exports.dart';

import '../../../core/utils/helper_functions/exports.dart';
import '../../../shared/models/error_response_model.dart';
import '../../../shared/models/generic_response_model.dart';
import '../models/LoanApplyRequestModel.dart';

abstract class PLLoanService {

  Future<Either<ErrorResponseModel, GenericResponseModel>>
  loanApplyService(LoanApplyRequestModel loanApplyRequestModel);
}

class PLLoanRepository extends PLLoanService{

  PLLoanRepository._();
  static PLLoanRepository instance = PLLoanRepository._();

  @override
  Future<Either<ErrorResponseModel, GenericResponseModel>> loanApplyService(LoanApplyRequestModel loanApplyRequestModel) async{
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

      var responseData = await NetworkService.post(
          url: NetworkConstants.loanApplyUrl, data: encryptedData);

      "loanApplyService $responseData".logger();

      return Right(GenericResponseModel(
          message: "Loan application successful", success: true));
    } catch (e) {
      "OnboardCustomerError $e".logger();

      return Left(ErrorResponseModel(
        isSuccess: false,
        message: e.toString(),
      ));
    }
  }

}