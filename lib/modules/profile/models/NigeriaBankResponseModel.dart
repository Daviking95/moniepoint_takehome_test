import 'dart:convert';

class NigeriaBankResponseModel {
  final String bankCode;
  final String bankName;
  final String logo;

  NigeriaBankResponseModel({
    required this.bankCode,
    required this.bankName,
    required this.logo,
  });

  NigeriaBankResponseModel copyWith({
    String? bankCode,
    String? bankName,
    String? logo,
  }) =>
      NigeriaBankResponseModel(
        bankCode: bankCode ?? this.bankCode,
        bankName: bankName ?? this.bankName,
        logo: logo ?? this.logo,
      );

  factory NigeriaBankResponseModel.fromRawJson(String str) => NigeriaBankResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NigeriaBankResponseModel.fromJson(Map<String, dynamic> json) => NigeriaBankResponseModel(
    bankCode: json["BankCode"],
    bankName: json["BankName"],
    logo: json["logo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "BankCode": bankCode,
    "BankName": bankName,
    "logo": logo,
  };
}
