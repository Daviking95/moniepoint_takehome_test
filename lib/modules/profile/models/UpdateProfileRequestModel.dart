import 'dart:convert';

class UpdateProfileRequestModel {
  final String profileSection;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;
  final int identityTypeId;
  final String identificationIdNumber;
  final int gender;
  final int maritalStatus;
  final String meansOfAddressVerifications;
  final String homeAddress;
  final String nameOfNextOfKin;
  final int relationshipWithNextOfKin;
  final String emailOfNextOfKin;
  final String phoneNumberOfNextOfKin;
  final String homeAddressOfNextOfKin;
  final int employmentType;
  final String monthlyEarnings;
  final String salaryDay;
  final String jobTitle;
  final String companyName;
  final String officeEmail;
  final String officeAddress;
  final String officeLocalGovernment;
  final String officeState;
  final String governmentIssuedId;
  final String proofOfAddress;
  final String proofOfEmployment;
  final String additionalDocument;

  UpdateProfileRequestModel({
    required this.profileSection,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.identityTypeId,
    required this.identificationIdNumber,
    required this.gender,
    required this.maritalStatus,
    required this.meansOfAddressVerifications,
    required this.homeAddress,
    required this.nameOfNextOfKin,
    required this.relationshipWithNextOfKin,
    required this.emailOfNextOfKin,
    required this.phoneNumberOfNextOfKin,
    required this.homeAddressOfNextOfKin,
    required this.employmentType,
    required this.monthlyEarnings,
    required this.salaryDay,
    required this.jobTitle,
    required this.companyName,
    required this.officeEmail,
    required this.officeAddress,
    required this.officeLocalGovernment,
    required this.officeState,
    required this.governmentIssuedId,
    required this.proofOfAddress,
    required this.proofOfEmployment,
    required this.additionalDocument,
  });

  UpdateProfileRequestModel copyWith({
    String? profileSection,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? dateOfBirth,
    int? identityTypeId,
    String? identificationIdNumber,
    int? gender,
    int? maritalStatus,
    String? meansOfAddressVerifications,
    String? homeAddress,
    String? nameOfNextOfKin,
    int? relationshipWithNextOfKin,
    String? emailOfNextOfKin,
    String? phoneNumberOfNextOfKin,
    String? homeAddressOfNextOfKin,
    int? employmentType,
    String? monthlyEarnings,
    String? salaryDay,
    String? jobTitle,
    String? companyName,
    String? officeEmail,
    String? officeAddress,
    String? officeLocalGovernment,
    String? officeState,
    String? governmentIssuedId,
    String? proofOfAddress,
    String? proofOfEmployment,
    String? additionalDocument,
  }) =>
      UpdateProfileRequestModel(
        profileSection: profileSection ?? this.profileSection,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        identityTypeId: identityTypeId ?? this.identityTypeId,
        identificationIdNumber: identificationIdNumber ?? this.identificationIdNumber,
        gender: gender ?? this.gender,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        meansOfAddressVerifications: meansOfAddressVerifications ?? this.meansOfAddressVerifications,
        homeAddress: homeAddress ?? this.homeAddress,
        nameOfNextOfKin: nameOfNextOfKin ?? this.nameOfNextOfKin,
        relationshipWithNextOfKin: relationshipWithNextOfKin ?? this.relationshipWithNextOfKin,
        emailOfNextOfKin: emailOfNextOfKin ?? this.emailOfNextOfKin,
        phoneNumberOfNextOfKin: phoneNumberOfNextOfKin ?? this.phoneNumberOfNextOfKin,
        homeAddressOfNextOfKin: homeAddressOfNextOfKin ?? this.homeAddressOfNextOfKin,
        employmentType: employmentType ?? this.employmentType,
        monthlyEarnings: monthlyEarnings ?? this.monthlyEarnings,
        salaryDay: salaryDay ?? this.salaryDay,
        jobTitle: jobTitle ?? this.jobTitle,
        companyName: companyName ?? this.companyName,
        officeEmail: officeEmail ?? this.officeEmail,
        officeAddress: officeAddress ?? this.officeAddress,
        officeLocalGovernment: officeLocalGovernment ?? this.officeLocalGovernment,
        officeState: officeState ?? this.officeState,
        governmentIssuedId: governmentIssuedId ?? this.governmentIssuedId,
        proofOfAddress: proofOfAddress ?? this.proofOfAddress,
        proofOfEmployment: proofOfEmployment ?? this.proofOfEmployment,
        additionalDocument: additionalDocument ?? this.additionalDocument,
      );

  factory UpdateProfileRequestModel.fromRawJson(String str) => UpdateProfileRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) => UpdateProfileRequestModel(
    profileSection: json["profileSection"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    dateOfBirth: json["dateOfBirth"],
    identityTypeId: json["identityTypeID"],
    identificationIdNumber: json["identificationIdNumber"],
    gender: json["gender"],
    maritalStatus: json["maritalStatus"],
    meansOfAddressVerifications: json["meansOfAddressVerifications"],
    homeAddress: json["homeAddress"],
    nameOfNextOfKin: json["nameOfNextOfKin"],
    relationshipWithNextOfKin: json["relationshipWithNextOfKin"],
    emailOfNextOfKin: json["emailOfNextOfKin"],
    phoneNumberOfNextOfKin: json["phoneNumberOfNextOfKin"],
    homeAddressOfNextOfKin: json["homeAddressOfNextOfKin"],
    employmentType: json["employmentType"],
    monthlyEarnings: json["monthlyEarnings"],
    salaryDay: json["salaryDay"],
    jobTitle: json["jobTitle"],
    companyName: json["companyName"],
    officeEmail: json["officeEmail"],
    officeAddress: json["officeAddress"],
    officeLocalGovernment: json["officeLocalGovernment"],
    officeState: json["officeState"],
    governmentIssuedId: json["governmentIssuedID"],
    proofOfAddress: json["proofOfAddress"],
    proofOfEmployment: json["proofOfEmployment"],
    additionalDocument: json["additionalDocument"],
  );

  Map<String, dynamic> toJson() => {
    "profileSection": profileSection,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "mobileNumber": mobileNumber,
    "dateOfBirth": dateOfBirth,
    "identityTypeID": identityTypeId,
    "identificationIdNumber": identificationIdNumber,
    "gender": gender,
    "maritalStatus": maritalStatus,
    "meansOfAddressVerifications": meansOfAddressVerifications,
    "homeAddress": homeAddress,
    "nameOfNextOfKin": nameOfNextOfKin,
    "relationshipWithNextOfKin": relationshipWithNextOfKin,
    "emailOfNextOfKin": emailOfNextOfKin,
    "phoneNumberOfNextOfKin": phoneNumberOfNextOfKin,
    "homeAddressOfNextOfKin": homeAddressOfNextOfKin,
    "employmentType": employmentType,
    "monthlyEarnings": monthlyEarnings,
    "salaryDay": salaryDay,
    "jobTitle": jobTitle,
    "companyName": companyName,
    "officeEmail": officeEmail,
    "officeAddress": officeAddress,
    "officeLocalGovernment": officeLocalGovernment,
    "officeState": officeState,
    "governmentIssuedID": governmentIssuedId,
    "proofOfAddress": proofOfAddress,
    "proofOfEmployment": proofOfEmployment,
    "additionalDocument": additionalDocument,
  };
}
