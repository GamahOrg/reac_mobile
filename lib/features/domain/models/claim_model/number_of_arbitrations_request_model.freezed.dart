// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_of_arbitrations_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NumberOfArbitractionsRequestModel _$NumberOfArbitractionsRequestModelFromJson(
    Map<String, dynamic> json) {
  return _NumberOfArbitractionsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$NumberOfArbitractionsRequestModel {
  String? get requestId => throw _privateConstructorUsedError;
  int? get arbitratorCount => throw _privateConstructorUsedError;

  /// Serializes this NumberOfArbitractionsRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberOfArbitractionsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberOfArbitractionsRequestModelCopyWith<NumberOfArbitractionsRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberOfArbitractionsRequestModelCopyWith<$Res> {
  factory $NumberOfArbitractionsRequestModelCopyWith(
          NumberOfArbitractionsRequestModel value,
          $Res Function(NumberOfArbitractionsRequestModel) then) =
      _$NumberOfArbitractionsRequestModelCopyWithImpl<$Res,
          NumberOfArbitractionsRequestModel>;
  @useResult
  $Res call({String? requestId, int? arbitratorCount});
}

/// @nodoc
class _$NumberOfArbitractionsRequestModelCopyWithImpl<$Res,
        $Val extends NumberOfArbitractionsRequestModel>
    implements $NumberOfArbitractionsRequestModelCopyWith<$Res> {
  _$NumberOfArbitractionsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberOfArbitractionsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? arbitratorCount = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      arbitratorCount: freezed == arbitratorCount
          ? _value.arbitratorCount
          : arbitratorCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumberOfArbitractionsRequestModelImplCopyWith<$Res>
    implements $NumberOfArbitractionsRequestModelCopyWith<$Res> {
  factory _$$NumberOfArbitractionsRequestModelImplCopyWith(
          _$NumberOfArbitractionsRequestModelImpl value,
          $Res Function(_$NumberOfArbitractionsRequestModelImpl) then) =
      __$$NumberOfArbitractionsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? requestId, int? arbitratorCount});
}

/// @nodoc
class __$$NumberOfArbitractionsRequestModelImplCopyWithImpl<$Res>
    extends _$NumberOfArbitractionsRequestModelCopyWithImpl<$Res,
        _$NumberOfArbitractionsRequestModelImpl>
    implements _$$NumberOfArbitractionsRequestModelImplCopyWith<$Res> {
  __$$NumberOfArbitractionsRequestModelImplCopyWithImpl(
      _$NumberOfArbitractionsRequestModelImpl _value,
      $Res Function(_$NumberOfArbitractionsRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberOfArbitractionsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? arbitratorCount = freezed,
  }) {
    return _then(_$NumberOfArbitractionsRequestModelImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      arbitratorCount: freezed == arbitratorCount
          ? _value.arbitratorCount
          : arbitratorCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberOfArbitractionsRequestModelImpl
    implements _NumberOfArbitractionsRequestModel {
  _$NumberOfArbitractionsRequestModelImpl(
      {this.requestId, this.arbitratorCount});

  factory _$NumberOfArbitractionsRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NumberOfArbitractionsRequestModelImplFromJson(json);

  @override
  final String? requestId;
  @override
  final int? arbitratorCount;

  @override
  String toString() {
    return 'NumberOfArbitractionsRequestModel(requestId: $requestId, arbitratorCount: $arbitratorCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberOfArbitractionsRequestModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.arbitratorCount, arbitratorCount) ||
                other.arbitratorCount == arbitratorCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, arbitratorCount);

  /// Create a copy of NumberOfArbitractionsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberOfArbitractionsRequestModelImplCopyWith<
          _$NumberOfArbitractionsRequestModelImpl>
      get copyWith => __$$NumberOfArbitractionsRequestModelImplCopyWithImpl<
          _$NumberOfArbitractionsRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberOfArbitractionsRequestModelImplToJson(
      this,
    );
  }
}

abstract class _NumberOfArbitractionsRequestModel
    implements NumberOfArbitractionsRequestModel {
  factory _NumberOfArbitractionsRequestModel(
      {final String? requestId,
      final int? arbitratorCount}) = _$NumberOfArbitractionsRequestModelImpl;

  factory _NumberOfArbitractionsRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$NumberOfArbitractionsRequestModelImpl.fromJson;

  @override
  String? get requestId;
  @override
  int? get arbitratorCount;

  /// Create a copy of NumberOfArbitractionsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberOfArbitractionsRequestModelImplCopyWith<
          _$NumberOfArbitractionsRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
