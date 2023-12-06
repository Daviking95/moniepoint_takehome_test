import 'package:meta/meta.dart';
import 'dart:convert';

class CardDetailsRequestModel {
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cvv;

  CardDetailsRequestModel({
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.cvv,
  });

  CardDetailsRequestModel copyWith({
    String? cardNumber,
    String? cardName,
    String? expiryDate,
    String? cvv,
  }) =>
      CardDetailsRequestModel(
        cardNumber: cardNumber ?? this.cardNumber,
        cardName: cardName ?? this.cardName,
        expiryDate: expiryDate ?? this.expiryDate,
        cvv: cvv ?? this.cvv,
      );

  factory CardDetailsRequestModel.fromRawJson(String str) => CardDetailsRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardDetailsRequestModel.fromJson(Map<String, dynamic> json) => CardDetailsRequestModel(
    cardNumber: json["cardNumber"],
    cardName: json["cardName"],
    expiryDate: json["expiryDate"],
    cvv: json["cvv"],
  );

  Map<String, dynamic> toJson() => {
    "cardNumber": cardNumber,
    "cardName": cardName,
    "expiryDate": expiryDate,
    "cvv": cvv,
  };
}
