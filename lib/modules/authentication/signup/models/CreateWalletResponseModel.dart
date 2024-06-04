import 'dart:convert';

class CreateWalletResponseModel {
  final bool requestSuccessful;
  final String accountNumber;
  final String accountName;
  final String responseMessage;
  final int responseCode;


  CreateWalletResponseModel({
    required this.requestSuccessful,
    required this.accountNumber,
    required this.accountName,
    required this.responseMessage,
    required this.responseCode,
  });

  CreateWalletResponseModel copyWith({
    bool? requestSuccessful,
    String? accountNumber,
    String? accountName,
    String? responseMessage,
    int? responseCode,
  }) =>
      CreateWalletResponseModel(
        requestSuccessful: requestSuccessful ?? this.requestSuccessful,
        accountNumber: accountNumber ?? this.accountNumber,
        accountName: accountName ?? this.accountName,
        responseMessage: responseMessage ?? this.responseMessage,
        responseCode: responseCode ?? this.responseCode,
      );

  factory CreateWalletResponseModel.fromRawJson(String str) => CreateWalletResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateWalletResponseModel.fromJson(Map<String, dynamic> json) => CreateWalletResponseModel(
    requestSuccessful: json["requestSuccessful"],
    accountNumber: json["accountNumber"],
    accountName: json["accountName"],
    responseMessage: json["responseMessage"],
    responseCode: json["responseCode"],
  );

  Map<String, dynamic> toJson() => {
    "requestSuccessful": requestSuccessful,
    "accountNumber": accountNumber,
    "accountName": accountName,
    "responseMessage": responseMessage,
    "responseCode": responseCode,
  };
}
