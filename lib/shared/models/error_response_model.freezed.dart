// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) {
  return _ErrorResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponseModel {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  List<String?>? get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseModelCopyWith<ErrorResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseModelCopyWith<$Res> {
  factory $ErrorResponseModelCopyWith(
          ErrorResponseModel value, $Res Function(ErrorResponseModel) then) =
      _$ErrorResponseModelCopyWithImpl<$Res, ErrorResponseModel>;
  @useResult
  $Res call(
      {bool isSuccess,
      String message,
      int status,
      String token,
      List<String?>? messages});
}

/// @nodoc
class _$ErrorResponseModelCopyWithImpl<$Res, $Val extends ErrorResponseModel>
    implements $ErrorResponseModelCopyWith<$Res> {
  _$ErrorResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? message = null,
    Object? status = null,
    Object? token = null,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorResponseModelCopyWith<$Res>
    implements $ErrorResponseModelCopyWith<$Res> {
  factory _$$_ErrorResponseModelCopyWith(_$_ErrorResponseModel value,
          $Res Function(_$_ErrorResponseModel) then) =
      __$$_ErrorResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuccess,
      String message,
      int status,
      String token,
      List<String?>? messages});
}

/// @nodoc
class __$$_ErrorResponseModelCopyWithImpl<$Res>
    extends _$ErrorResponseModelCopyWithImpl<$Res, _$_ErrorResponseModel>
    implements _$$_ErrorResponseModelCopyWith<$Res> {
  __$$_ErrorResponseModelCopyWithImpl(
      _$_ErrorResponseModel _value, $Res Function(_$_ErrorResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? message = null,
    Object? status = null,
    Object? token = null,
    Object? messages = freezed,
  }) {
    return _then(_$_ErrorResponseModel(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorResponseModel
    with DiagnosticableTreeMixin
    implements _ErrorResponseModel {
  const _$_ErrorResponseModel(
      {this.isSuccess = false,
      required this.message,
      this.status = 400,
      this.token = "",
      final List<String?>? messages = const ['']})
      : _messages = messages;

  factory _$_ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorResponseModelFromJson(json);

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String message;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final String token;
  final List<String?>? _messages;
  @override
  @JsonKey()
  List<String?>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorResponseModel(isSuccess: $isSuccess, message: $message, status: $status, token: $token, messages: $messages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorResponseModel'))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('messages', messages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorResponseModel &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, message, status,
      token, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorResponseModelCopyWith<_$_ErrorResponseModel> get copyWith =>
      __$$_ErrorResponseModelCopyWithImpl<_$_ErrorResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorResponseModelToJson(
      this,
    );
  }
}

abstract class _ErrorResponseModel implements ErrorResponseModel {
  const factory _ErrorResponseModel(
      {final bool isSuccess,
      required final String message,
      final int status,
      final String token,
      final List<String?>? messages}) = _$_ErrorResponseModel;

  factory _ErrorResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ErrorResponseModel.fromJson;

  @override
  bool get isSuccess;
  @override
  String get message;
  @override
  int get status;
  @override
  String get token;
  @override
  List<String?>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorResponseModelCopyWith<_$_ErrorResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
