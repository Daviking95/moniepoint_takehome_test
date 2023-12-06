
import 'dart:convert';

class GenericResponseModel {
  final String message;
  final bool success;

  GenericResponseModel({
    required this.message,
    required this.success,
  });

  factory GenericResponseModel.fromRawJson(String str) => GenericResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) => GenericResponseModel(
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
  };
}
