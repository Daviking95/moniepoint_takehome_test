import 'package:meta/meta.dart';
import 'dart:convert';

class OnboardCustomerRequestModel {
  final String emailAddress;
  final String otp;
  final String pin;
  final String confirmPin;

  OnboardCustomerRequestModel({
    required this.emailAddress,
    required this.otp,
    required this.pin,
    required this.confirmPin,
  });

  OnboardCustomerRequestModel copyWith({
    String? emailAddress,
    String? otp,
    String? pin,
    String? confirmPin,
  }) =>
      OnboardCustomerRequestModel(
        emailAddress: emailAddress ?? this.emailAddress,
        otp: otp ?? this.otp,
        pin: pin ?? this.pin,
        confirmPin: confirmPin ?? this.confirmPin,
      );

  factory OnboardCustomerRequestModel.fromRawJson(String str) => OnboardCustomerRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OnboardCustomerRequestModel.fromJson(Map<String, dynamic> json) => OnboardCustomerRequestModel(
    emailAddress: json["emailAddress"],
    otp: json["otp"],
    pin: json["pin"],
    confirmPin: json["confirmPin"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "otp": otp,
    "pin": pin,
    "confirmPin": confirmPin,
  };
}
