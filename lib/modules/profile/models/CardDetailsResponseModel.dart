import 'dart:convert';

class CardDetailsResponseModel {
  final List<CustomerCard> customerCards;

  CardDetailsResponseModel({
    required this.customerCards,
  });

  CardDetailsResponseModel copyWith({
    List<CustomerCard>? customerCards,
  }) =>
      CardDetailsResponseModel(
        customerCards: customerCards ?? this.customerCards,
      );

  factory CardDetailsResponseModel.fromRawJson(String str) => CardDetailsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardDetailsResponseModel.fromJson(Map<String, dynamic> json) => CardDetailsResponseModel(
    customerCards: List<CustomerCard>.from(json["customerCards"].map((x) => CustomerCard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customerCards": List<dynamic>.from(customerCards.map((x) => x.toJson())),
  };
}

class CustomerCard {
  final int cardId;
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cvv;

  CustomerCard({
    required this.cardId,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.cvv,
  });

  CustomerCard copyWith({
    int? cardId,
    String? cardNumber,
    String? cardName,
    String? expiryDate,
    String? cvv,
  }) =>
      CustomerCard(
        cardId: cardId ?? this.cardId,
        cardNumber: cardNumber ?? this.cardNumber,
        cardName: cardName ?? this.cardName,
        expiryDate: expiryDate ?? this.expiryDate,
        cvv: cvv ?? this.cvv,
      );

  factory CustomerCard.fromRawJson(String str) => CustomerCard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerCard.fromJson(Map<String, dynamic> json) => CustomerCard(
    cardId: json["Id"],
    cardNumber: json["CardNumber"] ?? "",
    cardName: json["CardName"] ?? "",
    expiryDate: json["ExpiryDate"] ?? "",
    cvv: json["CVV"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "Id": cardId,
    "CardNumber": cardNumber,
    "CardName": cardName,
    "ExpiryDate": expiryDate,
    "CVV": cvv,
  };
}
