import 'dart:convert';

class MarketplaceResponseModel {
  final List<MarketplaceResponseModelLoanDetail> loanDetails;

  MarketplaceResponseModel({
    required this.loanDetails,
  });

  MarketplaceResponseModel copyWith({
    List<MarketplaceResponseModelLoanDetail>? loanDetails,
  }) =>
      MarketplaceResponseModel(
        loanDetails: loanDetails ?? this.loanDetails,
      );

  factory MarketplaceResponseModel.fromRawJson(String str) => MarketplaceResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarketplaceResponseModel.fromJson(Map<String, dynamic> json) => MarketplaceResponseModel(
    loanDetails: List<MarketplaceResponseModelLoanDetail>.from(json["loanDetails"].map((x) => MarketplaceResponseModelLoanDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "loanDetails": List<dynamic>.from(loanDetails.map((x) => x.toJson())),
  };
}

class MarketplaceResponseModelLoanDetail {
  final int lendlyScore;
  final String fullName;
  final int loanId;
  final int borrowerId;
  final String image;
  final DateTime createdDate;
  final int loanAmount;
  final String loanReason;
  final int loanStatus;
  final int duration;
  final DateTime endDate;

  MarketplaceResponseModelLoanDetail({
    required this.lendlyScore,
    required this.fullName,
    required this.loanId,
    required this.borrowerId,
    required this.image,
    required this.createdDate,
    required this.loanAmount,
    required this.loanReason,
    required this.loanStatus,
    required this.duration,
    required this.endDate,
  });

  MarketplaceResponseModelLoanDetail copyWith({
    int? lendlyScore,
    String? fullName,
    int? loanId,
    int? borrowerId,
    String? image,
    DateTime? createdDate,
    int? loanAmount,
    String? loanReason,
    int? loanStatus,
    int? duration,
    DateTime? endDate,
  }) =>
      MarketplaceResponseModelLoanDetail(
        lendlyScore: lendlyScore ?? this.lendlyScore,
        fullName: fullName ?? this.fullName,
        loanId: loanId ?? this.loanId,
        borrowerId: borrowerId ?? this.borrowerId,
        image: image ?? this.image,
        createdDate: createdDate ?? this.createdDate,
        loanAmount: loanAmount ?? this.loanAmount,
        loanReason: loanReason ?? this.loanReason,
        loanStatus: loanStatus ?? this.loanStatus,
        duration: duration ?? this.duration,
        endDate: endDate ?? this.endDate,
      );

  factory MarketplaceResponseModelLoanDetail.fromRawJson(String str) => MarketplaceResponseModelLoanDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarketplaceResponseModelLoanDetail.fromJson(Map<String, dynamic> json) => MarketplaceResponseModelLoanDetail(
    lendlyScore: json["LendlyScore"] ?? 0,
    fullName: json["FullName"] ?? "",
    loanId: json["LoanId"] ?? 0,
    borrowerId: json["BorrowerId"] ?? 0,
    image: json["Image"] ?? "",
    createdDate: DateTime.parse(json["CreatedDate"]),
    loanAmount: json["LoanAmount"] ?? 0,
    loanReason: json["LoanReason"] ?? "",
    loanStatus: json["LoanStatus"] ?? 0,
    duration: json["Duration"] ?? 0,
    endDate: DateTime.parse(json["EndDate"]),
  );

  Map<String, dynamic> toJson() => {
    "LendlyScore": lendlyScore,
    "FullName": fullName,
    "LoanId": loanId,
    "BorrowerId": borrowerId,
    "Image": image,
    "CreatedDate": createdDate.toIso8601String(),
    "LoanAmount": loanAmount,
    "LoanReason": loanReason,
    "LoanStatus": loanStatus,
    "Duration": duration,
    "EndDate": endDate.toIso8601String(),
  };
}

