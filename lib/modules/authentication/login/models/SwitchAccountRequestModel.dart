import 'dart:convert';

class SwitchAccountRequestModel {
  final String emailAddress;
  final String securityPin;
  final String otpCode;

  SwitchAccountRequestModel({
    required this.emailAddress,
    required this.securityPin,
    required this.otpCode,
  });

  SwitchAccountRequestModel copyWith({
    String? emailAddress,
    String? securityPin,
    String? otpCode,
  }) =>
      SwitchAccountRequestModel(
        emailAddress: emailAddress ?? this.emailAddress,
        securityPin: securityPin ?? this.securityPin,
        otpCode: otpCode ?? this.otpCode,
      );

  factory SwitchAccountRequestModel.fromRawJson(String str) => SwitchAccountRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SwitchAccountRequestModel.fromJson(Map<String, dynamic> json) => SwitchAccountRequestModel(
    emailAddress: json["emailAddress"],
    securityPin: json["securityPin"],
    otpCode: json["otpCode"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "securityPin": securityPin,
    "otpCode": otpCode,
  };
}
