// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorResponseModel _$$_ErrorResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_ErrorResponseModel(
      isSuccess: json['isSuccess'] as bool? ?? false,
      message: json['message'] as String,
      status: json['status'] as int? ?? 400,
      token: json['token'] as String? ?? "",
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [''],
    );

Map<String, dynamic> _$$_ErrorResponseModelToJson(
        _$_ErrorResponseModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'status': instance.status,
      'token': instance.token,
      'messages': instance.messages,
    };
