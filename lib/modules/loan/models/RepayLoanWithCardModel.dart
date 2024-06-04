import 'dart:convert';

class RepayLoanWithCardModel {
  final int loanId;
  final int loanAmount;
  final String cardNumber;
  final String cvv;
  final String expiryDate;

  RepayLoanWithCardModel({
    required this.loanId,
    required this.loanAmount,
    required this.cardNumber,
    required this.cvv,
    required this.expiryDate,
  });

  RepayLoanWithCardModel copyWith({
    int? loanId,
    int? loanAmount,
    String? cardNumber,
    String? cvv,
    String? expiryDate,
  }) =>
      RepayLoanWithCardModel(
        loanId: loanId ?? this.loanId,
        loanAmount: loanAmount ?? this.loanAmount,
        cardNumber: cardNumber ?? this.cardNumber,
        cvv: cvv ?? this.cvv,
        expiryDate: expiryDate ?? this.expiryDate,
      );

  factory RepayLoanWithCardModel.fromRawJson(String str) => RepayLoanWithCardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepayLoanWithCardModel.fromJson(Map<String, dynamic> json) => RepayLoanWithCardModel(
    loanId: json["loanId"],
    loanAmount: json["loanAmount"],
    cardNumber: json["cardNumber"],
    cvv: json["cvv"],
    expiryDate: json["expiryDate"],
  );

  Map<String, dynamic> toJson() => {
    "loanId": loanId,
    "loanAmount": loanAmount,
    "cardNumber": cardNumber,
    "cvv": cvv,
    "expiryDate": expiryDate,
  };
}
