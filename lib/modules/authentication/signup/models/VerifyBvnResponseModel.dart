import 'dart:convert';

class VerifyBvnResponseModel {
  final String otp;
  final String phoneNumber;
  final String? message;

  VerifyBvnResponseModel({
    required this.otp,
    required this.phoneNumber,
    this.message,
  });

  VerifyBvnResponseModel copyWith({
    String? otp,
    String? phoneNumber,
    String? message,
  }) =>
      VerifyBvnResponseModel(
        otp: otp ?? this.otp,
        message: message ?? this.message,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory VerifyBvnResponseModel.fromRawJson(String str) => VerifyBvnResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyBvnResponseModel.fromJson(Map<String, dynamic> json) => VerifyBvnResponseModel(
    otp: json["Otp"],
    phoneNumber: json["PhoneNumber"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Otp": otp,
    "PhoneNumber": phoneNumber,
    "Message": message,
  };
}
