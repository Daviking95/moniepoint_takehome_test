import 'dart:convert';

class LoogedInUserLoanResponseModel {
  final String bankAccount;
  final String lenderName;
  final String lenderImage;
  final num amount;
  final num loanId;
  final num interestRate;
  final num duration;
  final String purpose;
  final num amountToPay;
  final num interestValue;
  final num loanStatus;
  final num platformFee;
  final double amountToRecieve;
  final DateTime repaymentDate;
  final num numberOfDaysDelayed;

  LoogedInUserLoanResponseModel({
    required this.bankAccount,
    required this.lenderName,
    required this.loanId,
    required this.lenderImage,
    required this.amount,
    required this.interestRate,
    required this.duration,
    required this.purpose,
    required this.amountToPay,
    required this.interestValue,
    required this.loanStatus,
    required this.platformFee,
    required this.amountToRecieve,
    required this.repaymentDate,
    required this.numberOfDaysDelayed,
  });

  LoogedInUserLoanResponseModel copyWith({
    String? bankAccount,
    String? lenderName,
    String? lenderImage,
    num? amount,
    num? loanId,
    num? interestRate,
    num? duration,
    String? purpose,
    num? amountToPay,
    num? interestValue,
    num? loanStatus,
    num? platformFee,
    double? amountToRecieve,
    DateTime? repaymentDate,
    num? numberOfDaysDelayed,
  }) =>
      LoogedInUserLoanResponseModel(
        bankAccount: bankAccount ?? this.bankAccount,
        lenderName: lenderName ?? this.lenderName,
        loanId: loanId ?? this.loanId,
        lenderImage: lenderImage ?? this.lenderImage,
        amount: amount ?? this.amount,
        interestRate: interestRate ?? this.interestRate,
        duration: duration ?? this.duration,
        purpose: purpose ?? this.purpose,
        amountToPay: amountToPay ?? this.amountToPay,
        interestValue: interestValue ?? this.interestValue,
        loanStatus: loanStatus ?? this.loanStatus,
        platformFee: platformFee ?? this.platformFee,
        amountToRecieve: amountToRecieve ?? this.amountToRecieve,
        repaymentDate: repaymentDate ?? this.repaymentDate,
        numberOfDaysDelayed: numberOfDaysDelayed ?? this.numberOfDaysDelayed,
      );

  factory LoogedInUserLoanResponseModel.fromRawJson(String str) => LoogedInUserLoanResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoogedInUserLoanResponseModel.fromJson(Map<String, dynamic> json) => LoogedInUserLoanResponseModel(
    bankAccount: json["BankAccount"] ?? "",
    lenderName: json["LenderName"] ?? "",
    loanId: json["LoanId"] ?? 0,
    lenderImage: json["LenderImage"] ?? "",
    amount: json["Amount"] ?? 0,
    interestRate: json["InterestRate"] ?? 0,
    duration: json["Duration"] ?? 0,
    purpose: json["Purpose"] ?? "",
    amountToPay: json["AmountToPay"] ?? 0,
    interestValue: json["InterestValue"] ?? 0,
    loanStatus: json["LoanStatus"] ?? 0,
    platformFee: json["PlatformFee"] ?? 0,
    amountToRecieve: json["AmountToRecieve"]?.toDouble() ?? 0,
    repaymentDate: DateTime.parse(json["RepaymentDate"]),
    numberOfDaysDelayed: json["NumberOfDaysDelayed"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "BankAccount": bankAccount,
    "LenderName": lenderName,
    "LoanId": loanId,
    "LenderImage": lenderImage,
    "Amount": amount,
    "InterestRate": interestRate,
    "Duration": duration,
    "Purpose": purpose,
    "AmountToPay": amountToPay,
    "InterestValue": interestValue,
    "LoanStatus": loanStatus,
    "PlatformFee": platformFee,
    "AmountToRecieve": amountToRecieve,
    "RepaymentDate": repaymentDate.toIso8601String(),
    "NumberOfDaysDelayed": numberOfDaysDelayed,
  };
}
