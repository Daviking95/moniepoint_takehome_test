import 'package:meta/meta.dart';
import 'dart:convert';

class ActivePendingLoansResponseModel {
  final List<ActivePendingLoansResponseModelLoanDetail> loanDetails;

  ActivePendingLoansResponseModel({
    required this.loanDetails,
  });

  ActivePendingLoansResponseModel copyWith({
    List<ActivePendingLoansResponseModelLoanDetail>? loanDetails,
  }) =>
      ActivePendingLoansResponseModel(
        loanDetails: loanDetails ?? this.loanDetails,
      );

  factory ActivePendingLoansResponseModel.fromRawJson(String str) => ActivePendingLoansResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivePendingLoansResponseModel.fromJson(Map<String, dynamic> json) => ActivePendingLoansResponseModel(
    loanDetails: List<ActivePendingLoansResponseModelLoanDetail>.from(json["loanDetails"].map((x) => ActivePendingLoansResponseModelLoanDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "loanDetails": List<dynamic>.from(loanDetails.map((x) => x.toJson())),
  };
}

class ActivePendingLoansResponseModelLoanDetail {
  final num id;
  final num offerId;
  final num loanAmount;
  final num loanStatus;
  final num duration;
  final num interestRate;
  final String purpose;
  final String borrowerName;
  final String lendlyScore;
  final num amountToPay;
  final num interestValue;
  final double platformFee;
  final double amountToRecieve;
  final DateTime repaymentDate;

  ActivePendingLoansResponseModelLoanDetail({
    required this.id,
    required this.loanAmount,
    required this.loanStatus,
    required this.duration,
    required this.interestRate,
    required this.purpose,
    required this.amountToPay,
    required this.interestValue,
    required this.platformFee,
    required this.amountToRecieve,
    required this.repaymentDate,
    required this.offerId,
    required this.borrowerName,
    required this.lendlyScore,
  });

  ActivePendingLoansResponseModelLoanDetail copyWith({
    num? id,
    num? loanAmount,
    num? loanStatus,
    num? duration,
    num? interestRate,
    String? purpose,
    String? borrowerName,
    String? lendlyScore,
    num? amountToPay,
    num? interestValue,
    num? offerId,
    double? platformFee,
    double? amountToRecieve,
    DateTime? repaymentDate,
  }) =>
      ActivePendingLoansResponseModelLoanDetail(
        id: id ?? this.id,
        loanAmount: loanAmount ?? this.loanAmount,
        loanStatus: loanStatus ?? this.loanStatus,
        duration: duration ?? this.duration,
        interestRate: interestRate ?? this.interestRate,
        purpose: purpose ?? this.purpose,
        amountToPay: amountToPay ?? this.amountToPay,
        interestValue: interestValue ?? this.interestValue,
        platformFee: platformFee ?? this.platformFee,
        amountToRecieve: amountToRecieve ?? this.amountToRecieve,
        repaymentDate: repaymentDate ?? this.repaymentDate,
        lendlyScore: lendlyScore ?? this.lendlyScore,
        borrowerName: borrowerName ?? this.borrowerName,
        offerId: offerId ?? this.offerId,
      );

  factory ActivePendingLoansResponseModelLoanDetail.fromRawJson(String str) => ActivePendingLoansResponseModelLoanDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivePendingLoansResponseModelLoanDetail.fromJson(Map<String, dynamic> json) => ActivePendingLoansResponseModelLoanDetail(
    id: json["Id"] ?? 0,
    loanAmount: json["LoanAmount"] ?? 0,
    loanStatus: json["LoanStatus"] ?? 0,
    duration: json["Duration"] ?? 0,
    interestRate: json["InterestRate"] ?? 0,
    offerId: json["OfferId"] ?? 0,
    purpose: json["Purpose"] ?? "",
    lendlyScore: json["LendlyScore"] ?? "",
    borrowerName: json["borrowerName"] ?? "",
    amountToPay: json["AmountToPay"] ?? 0,
    interestValue: json["InterestValue"] ?? 0,
    platformFee: json["PlatformFee"]?.toDouble() ?? 0,
    amountToRecieve: json["AmountToRecieve"]?.toDouble() ?? 0,
    repaymentDate: DateTime.parse(json["RepaymentDate"]),
  );

  Map<String, dynamic> toJson() => {
    "LoanAmount": loanAmount,
    "LoanStatus": loanStatus,
    "Duration": duration,
    "InterestRate": interestRate,
    "Purpose": purpose,
    "AmountToPay": amountToPay,
    "InterestValue": interestValue,
    "PlatformFee": platformFee,
    "AmountToRecieve": amountToRecieve,
    "LendlyScore": lendlyScore,
    "borrowerName": borrowerName,
    "OfferId": offerId,
    "RepaymentDate": repaymentDate.toIso8601String(),
  };
}
