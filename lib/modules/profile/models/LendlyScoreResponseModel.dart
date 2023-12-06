import 'package:meta/meta.dart';
import 'dart:convert';

class LendlyScoreResponseModel {
  final int lendlyScore;

  LendlyScoreResponseModel({
    required this.lendlyScore,
  });

  LendlyScoreResponseModel copyWith({
    int? lendlyScore,
  }) =>
      LendlyScoreResponseModel(
        lendlyScore: lendlyScore ?? this.lendlyScore,
      );

  factory LendlyScoreResponseModel.fromRawJson(String str) => LendlyScoreResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LendlyScoreResponseModel.fromJson(Map<String, dynamic> json) => LendlyScoreResponseModel(
    lendlyScore: json["LendlyScore"],
  );

  Map<String, dynamic> toJson() => {
    "LendlyScore": lendlyScore,
  };
}
