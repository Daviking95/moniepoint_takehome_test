import 'package:meta/meta.dart';
import 'dart:convert';

class NigeriaBankResponseModel {
  final String name;
  final String slug;
  final String code;
  final String ussd;
  final String logo;

  NigeriaBankResponseModel({
    required this.name,
    required this.slug,
    required this.code,
    required this.ussd,
    required this.logo,
  });

  NigeriaBankResponseModel copyWith({
    String? name,
    String? slug,
    String? code,
    String? ussd,
    String? logo,
  }) =>
      NigeriaBankResponseModel(
        name: name ?? this.name,
        slug: slug ?? this.slug,
        code: code ?? this.code,
        ussd: ussd ?? this.ussd,
        logo: logo ?? this.logo,
      );

  factory NigeriaBankResponseModel.fromRawJson(String str) => NigeriaBankResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NigeriaBankResponseModel.fromJson(Map<String, dynamic> json) => NigeriaBankResponseModel(
    name: json["name"],
    slug: json["slug"],
    code: json["code"],
    ussd: json["ussd"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "code": code,
    "ussd": ussd,
    "logo": logo,
  };
}
