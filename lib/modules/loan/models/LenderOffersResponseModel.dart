import 'package:meta/meta.dart';
import 'dart:convert';

class LenderOffersResponseModel {
  final List<LenderOffersResponseModelLoanDetail> loanDetails;

  LenderOffersResponseModel({
    required this.loanDetails,
  });

  LenderOffersResponseModel copyWith({
    List<LenderOffersResponseModelLoanDetail>? loanDetails,
  }) =>
      LenderOffersResponseModel(
        loanDetails: loanDetails ?? this.loanDetails,
      );

  factory LenderOffersResponseModel.fromRawJson(String str) => LenderOffersResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LenderOffersResponseModel.fromJson(Map<String, dynamic> json) => LenderOffersResponseModel(
    loanDetails: List<LenderOffersResponseModelLoanDetail>.from(json["loanDetails"].map((x) => LenderOffersResponseModelLoanDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "loanDetails": List<dynamic>.from(loanDetails.map((x) => x.toJson())),
  };
}

class LenderOffersResponseModelLoanDetail {
  final int offerId;
  final int loanPercentage;
  final int lenderUserId;
  final String image;
  final String name;

  LenderOffersResponseModelLoanDetail({
    required this.offerId,
    required this.loanPercentage,
    required this.lenderUserId,
    required this.image,
    required this.name,
  });

  LenderOffersResponseModelLoanDetail copyWith({
    int? offerId,
    int? loanPercentage,
    int? lenderUserId,
    String? image,
    String? name,
  }) =>
      LenderOffersResponseModelLoanDetail(
        offerId: offerId ?? this.offerId,
        loanPercentage: loanPercentage ?? this.loanPercentage,
        lenderUserId: lenderUserId ?? this.lenderUserId,
        image: image ?? this.image,
        name: name ?? this.name,
      );

  factory LenderOffersResponseModelLoanDetail.fromRawJson(String str) => LenderOffersResponseModelLoanDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LenderOffersResponseModelLoanDetail.fromJson(Map<String, dynamic> json) => LenderOffersResponseModelLoanDetail(
    offerId: json["OfferId"],
    loanPercentage: json["LoanPercentage"],
    lenderUserId: json["LenderUserId"],
    image: json["Image"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "OfferId": offerId,
    "LoanPercentage": loanPercentage,
    "LenderUserId": lenderUserId,
    "Image": image,
    "Name": name,
  };
}
