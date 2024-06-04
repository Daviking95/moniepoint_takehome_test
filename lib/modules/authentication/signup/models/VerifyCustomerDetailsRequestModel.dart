import 'dart:convert';

class VerifyCustomerDetailsRequestModel {
  final String otp;
  final String customerImage;
  final int meansOfId;
  final String idNumber;
  final String idImage;

  VerifyCustomerDetailsRequestModel({
    required this.otp,
    required this.customerImage,
    required this.meansOfId,
    required this.idNumber,
    required this.idImage,
  });

  VerifyCustomerDetailsRequestModel copyWith({
    String? otp,
    String? customerImage,
    int? meansOfId,
    String? idNumber,
    String? idImage,
  }) =>
      VerifyCustomerDetailsRequestModel(
        otp: otp ?? this.otp,
        customerImage: customerImage ?? this.customerImage,
        meansOfId: meansOfId ?? this.meansOfId,
        idNumber: idNumber ?? this.idNumber,
        idImage: idImage ?? this.idImage,
      );

  factory VerifyCustomerDetailsRequestModel.fromRawJson(String str) => VerifyCustomerDetailsRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyCustomerDetailsRequestModel.fromJson(Map<String, dynamic> json) => VerifyCustomerDetailsRequestModel(
    otp: json["otp"],
    customerImage: json["customerImage"],
    meansOfId: json["meansOfId"],
    idNumber: json["idNumber"],
    idImage: json["idImage"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "customerImage": customerImage,
    "meansOfId": meansOfId,
    "idNumber": idNumber,
    "idImage": idImage,
  };
}
