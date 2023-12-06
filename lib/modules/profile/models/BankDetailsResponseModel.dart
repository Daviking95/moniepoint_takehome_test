import 'package:meta/meta.dart';
import 'dart:convert';

class BankDetailsResponseModel {
  final String userId;
  final String bankName;
  final String accountNumber;
  final String accountName;
  final DateTime dateCreated;

  BankDetailsResponseModel({
    required this.userId,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.dateCreated,
  });

  BankDetailsResponseModel copyWith({
    String? userId,
    String? bankName,
    String? accountNumber,
    String? accountName,
    DateTime? dateCreated,
  }) =>
      BankDetailsResponseModel(
        userId: userId ?? this.userId,
        bankName: bankName ?? this.bankName,
        accountNumber: accountNumber ?? this.accountNumber,
        accountName: accountName ?? this.accountName,
        dateCreated: dateCreated ?? this.dateCreated,
      );

  factory BankDetailsResponseModel.fromRawJson(String str) => BankDetailsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BankDetailsResponseModel.fromJson(Map<String, dynamic> json) => BankDetailsResponseModel(
    userId: json["UserId"],
    bankName: json["BankName"],
    accountNumber: json["AccountNumber"],
    accountName: json["AccountName"],
    dateCreated: DateTime.parse(json["DateCreated"]),
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "BankName": bankName,
    "AccountNumber": accountNumber,
    "AccountName": accountName,
    "DateCreated": dateCreated.toIso8601String(),
  };
}
