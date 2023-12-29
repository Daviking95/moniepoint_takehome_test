import 'package:meta/meta.dart';
import 'dart:convert';

class MakeLoanOfferRequestModel {
  final int loanId;
  final int percentage;
  final int lenderUserId;
  final int borrowerUserId;

  MakeLoanOfferRequestModel({
    required this.loanId,
    required this.percentage,
    required this.lenderUserId,
    required this.borrowerUserId,
  });

  MakeLoanOfferRequestModel copyWith({
    int? loanId,
    int? percentage,
    int? lenderUserId,
    int? borrowerUserId,
  }) =>
      MakeLoanOfferRequestModel(
        loanId: loanId ?? this.loanId,
        percentage: percentage ?? this.percentage,
        lenderUserId: lenderUserId ?? this.lenderUserId,
        borrowerUserId: borrowerUserId ?? this.borrowerUserId,
      );

  factory MakeLoanOfferRequestModel.fromRawJson(String str) => MakeLoanOfferRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MakeLoanOfferRequestModel.fromJson(Map<String, dynamic> json) => MakeLoanOfferRequestModel(
    loanId: json["loanId"],
    percentage: json["percentage"],
    lenderUserId: json["lenderUserId"],
    borrowerUserId: json["borrowerUserId"],
  );

  Map<String, dynamic> toJson() => {
    "loanId": loanId,
    "percentage": percentage,
    "lenderUserId": lenderUserId,
    "borrowerUserId": borrowerUserId,
  };
}
