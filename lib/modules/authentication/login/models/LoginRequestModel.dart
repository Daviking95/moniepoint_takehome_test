import 'dart:convert';

class LoginRequestModel {
  final String emailAddress;
  final String securityPin;

  LoginRequestModel({
    required this.emailAddress,
    required this.securityPin,
  });

  LoginRequestModel copyWith({
    String? emailAddress,
    String? securityPin,
  }) =>
      LoginRequestModel(
        emailAddress: emailAddress ?? this.emailAddress,
        securityPin: securityPin ?? this.securityPin,
      );

  factory LoginRequestModel.fromRawJson(String str) => LoginRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
    emailAddress: json["emailAddress"],
    securityPin: json["securityPin"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "securityPin": securityPin,
  };
}
