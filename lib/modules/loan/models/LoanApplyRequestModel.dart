import 'dart:convert';

class LoanApplyRequestModel {
  final String loanAmount;
  final String loanReason;
  final int tenor;
  final String repaymentDate;

  LoanApplyRequestModel({
    required this.loanAmount,
    required this.loanReason,
    required this.tenor,
    required this.repaymentDate,
  });

  LoanApplyRequestModel copyWith({
    String? loanAmount,
    String? loanReason,
    int? tenor,
    String? repaymentDate,
  }) =>
      LoanApplyRequestModel(
        loanAmount: loanAmount ?? this.loanAmount,
        loanReason: loanReason ?? this.loanReason,
        tenor: tenor ?? this.tenor,
        repaymentDate: repaymentDate ?? this.repaymentDate,
      );

  factory LoanApplyRequestModel.fromRawJson(String str) => LoanApplyRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoanApplyRequestModel.fromJson(Map<String, dynamic> json) => LoanApplyRequestModel(
    loanAmount: json["loanAmount"],
    loanReason: json["loanReason"],
    tenor: json["tenor"],
    repaymentDate: json["repaymentDate"],
    // repaymentDate: DateTime.parse(json["repaymentDate"]),
  );

  Map<String, dynamic> toJson() => {
    "loanAmount": loanAmount,
    "loanReason": loanReason,
    "tenor": tenor,
    "repaymentDate": repaymentDate,
    // "repaymentDate": "${repaymentDate.year.toString().padLeft(4, '0')}-${repaymentDate.month.toString().padLeft(2, '0')}-${repaymentDate.day.toString().padLeft(2, '0')}",
  };
}
