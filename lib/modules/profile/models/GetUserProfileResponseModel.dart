import 'package:meta/meta.dart';
import 'dart:convert';

class GetUserProfileResponseModel {
  final String fullName;
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
  final String proofOfEmployment;
  final bool bvnVerified;

  GetUserProfileResponseModel({
    required this.fullName,
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
    required this.proofOfEmployment,
    required this.bvnVerified,
  });

  GetUserProfileResponseModel copyWith({
    String? fullName,
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
    String? proofOfEmployment,
    bool? bvnVerified,
  }) =>
      GetUserProfileResponseModel(
        fullName: fullName ?? this.fullName,
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
        proofOfEmployment: proofOfEmployment ?? this.proofOfEmployment,
        bvnVerified: bvnVerified ?? this.bvnVerified,
      );

  factory GetUserProfileResponseModel.fromRawJson(String str) => GetUserProfileResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetUserProfileResponseModel.fromJson(Map<String, dynamic> json) => GetUserProfileResponseModel(
    fullName: json["FullName"],
    emailAddress: json["EmailAddress"],
    phoneNumber: json["PhoneNumber"],
    address: json["Address"],
    lga: json["LGA"],
    referralCode: json["ReferralCode"],
    state: json["State"],
    employmentStatus: json["EmploymentStatus"],
    companyName: json["CompanyName"],
    startDate: DateTime.parse(json["StartDate"]),
    monthlyEarnings: json["MonthlyEarnings"],
    proofOfEmployment: json["ProofOfEmployment"],
    bvnVerified: json["BvnVerified"],
  );

  Map<String, dynamic> toJson() => {
    "FullName": fullName,
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
    "ProofOfEmployment": proofOfEmployment,
    "BvnVerified": bvnVerified,
  };
}
