import 'dart:convert';

class GetUserProfileResponseModel {
  final String fullName;
  final int userId;
  final String emailAddress;
  final String phoneNumber;
  final String address;
  final String lga;
  final String referralCode;
  final String state;
  final String employmentStatus;
  final String companyName;
  final DateTime startDate;
  final String monthlyEarnings;

  final String transactionPin;
  final String proofOfEmployment;
  final String borrowerLimit;
  final String lendingLimit;
  final bool bvnVerified;

  GetUserProfileResponseModel({
    required this.fullName,
    required this.userId,
    required this.emailAddress,
    required this.phoneNumber,
    required this.address,
    required this.lga,
    required this.referralCode,
    required this.state,
    required this.employmentStatus,
    required this.companyName,
    required this.startDate,
    required this.monthlyEarnings,
    required this.transactionPin,
    required this.proofOfEmployment,
    required this.bvnVerified,
    required this.borrowerLimit,
    required this.lendingLimit,
  });

  GetUserProfileResponseModel copyWith({
    String? fullName,
    int? userId,
    String? emailAddress,
    String? phoneNumber,
    String? address,
    String? lga,
    String? referralCode,
    String? state,
    String? employmentStatus,
    String? companyName,
    DateTime? startDate,
    String? monthlyEarnings,
    String? transactionPin,
    String? proofOfEmployment,
    String? lendingLimit,
    String? borrowerLimit,
    bool? bvnVerified,
  }) =>
      GetUserProfileResponseModel(
        fullName: fullName ?? this.fullName,
        userId: userId ?? this.userId,
        emailAddress: emailAddress ?? this.emailAddress,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        lga: lga ?? this.lga,
        referralCode: referralCode ?? this.referralCode,
        state: state ?? this.state,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        companyName: companyName ?? this.companyName,
        startDate: startDate ?? this.startDate,
        monthlyEarnings: monthlyEarnings ?? this.monthlyEarnings,
        transactionPin: transactionPin ?? this.transactionPin,
        proofOfEmployment: proofOfEmployment ?? this.proofOfEmployment,
        bvnVerified: bvnVerified ?? this.bvnVerified,
        lendingLimit: lendingLimit ?? this.lendingLimit,
        borrowerLimit: borrowerLimit ?? this.borrowerLimit,
      );

  factory GetUserProfileResponseModel.fromRawJson(String str) => GetUserProfileResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetUserProfileResponseModel.fromJson(Map<String, dynamic> json) => GetUserProfileResponseModel(
    fullName: json["FullName"] ?? "",
    userId: json["UserId"] ?? 0,
    emailAddress: json["EmailAddress"] ?? "",
    phoneNumber: json["PhoneNumber"] ?? "",
    address: json["Address"] ?? "",
    lga: json["LGA"] ?? "",
    referralCode: json["ReferralCode"] ?? "",
    state: json["State"] ?? "",
    employmentStatus: json["EmploymentStatus"] ?? "",
    companyName: json["CompanyName"] ?? "",
    startDate: DateTime.parse(json["StartDate"]),
    monthlyEarnings: json["MonthlyEarnings"] ?? "",
    transactionPin: json["TransactionPin"] ?? "",
    proofOfEmployment: json["ProofOfEmployment"] ?? "",
    bvnVerified: json["BvnVerified"],
    lendingLimit: json["LendingLimit"] ?? "",
    borrowerLimit: json["BorrowingLimit"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "FullName": fullName,
    "UserId": userId,
    "EmailAddress": emailAddress,
    "PhoneNumber": phoneNumber,
    "Address": address,
    "LGA": lga,
    "ReferralCode": referralCode,
    "State": state,
    "EmploymentStatus": employmentStatus,
    "CompanyName": companyName,
    "StartDate": startDate.toIso8601String(),
    "MonthlyEarnings": monthlyEarnings,
    "TransactionPin": transactionPin,
    "ProofOfEmployment": proofOfEmployment,
    "BvnVerified": bvnVerified,
    "BorrowerLimit": borrowerLimit,
    "LendingLimit": lendingLimit,
  };
}
