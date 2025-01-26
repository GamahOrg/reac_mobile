// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arbitration_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArbitrationRequestModel _$ArbitrationRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ArbitrationRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ArbitrationRequestModel {
  String? get litigationRequestId => throw _privateConstructorUsedError;
  String? get explanationRequests => throw _privateConstructorUsedError;
  List<String>? get litigationRequestArbitrationReportExplanationRequestFiles =>
      throw _privateConstructorUsedError;

  /// Serializes this ArbitrationRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArbitrationRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArbitrationRequestModelCopyWith<ArbitrationRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArbitrationRequestModelCopyWith<$Res> {
  factory $ArbitrationRequestModelCopyWith(ArbitrationRequestModel value,
          $Res Function(ArbitrationRequestModel) then) =
      _$ArbitrationRequestModelCopyWithImpl<$Res, ArbitrationRequestModel>;
  @useResult
  $Res call(
      {String? litigationRequestId,
      String? explanationRequests,
      List<String>? litigationRequestArbitrationReportExplanationRequestFiles});
}

/// @nodoc
class _$ArbitrationRequestModelCopyWithImpl<$Res,
        $Val extends ArbitrationRequestModel>
    implements $ArbitrationRequestModelCopyWith<$Res> {
  _$ArbitrationRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArbitrationRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? litigationRequestId = freezed,
    Object? explanationRequests = freezed,
    Object? litigationRequestArbitrationReportExplanationRequestFiles = freezed,
  }) {
    return _then(_value.copyWith(
      litigationRequestId: freezed == litigationRequestId
          ? _value.litigationRequestId
          : litigationRequestId // ignore: cast_nullable_to_non_nullable
              as String?,
      explanationRequests: freezed == explanationRequests
          ? _value.explanationRequests
          : explanationRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      litigationRequestArbitrationReportExplanationRequestFiles: freezed ==
              litigationRequestArbitrationReportExplanationRequestFiles
          ? _value.litigationRequestArbitrationReportExplanationRequestFiles
          : litigationRequestArbitrationReportExplanationRequestFiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArbitrationRequestModelImplCopyWith<$Res>
    implements $ArbitrationRequestModelCopyWith<$Res> {
  factory _$$ArbitrationRequestModelImplCopyWith(
          _$ArbitrationRequestModelImpl value,
          $Res Function(_$ArbitrationRequestModelImpl) then) =
      __$$ArbitrationRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? litigationRequestId,
      String? explanationRequests,
      List<String>? litigationRequestArbitrationReportExplanationRequestFiles});
}

/// @nodoc
class __$$ArbitrationRequestModelImplCopyWithImpl<$Res>
    extends _$ArbitrationRequestModelCopyWithImpl<$Res,
        _$ArbitrationRequestModelImpl>
    implements _$$ArbitrationRequestModelImplCopyWith<$Res> {
  __$$ArbitrationRequestModelImplCopyWithImpl(
      _$ArbitrationRequestModelImpl _value,
      $Res Function(_$ArbitrationRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArbitrationRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? litigationRequestId = freezed,
    Object? explanationRequests = freezed,
    Object? litigationRequestArbitrationReportExplanationRequestFiles = freezed,
  }) {
    return _then(_$ArbitrationRequestModelImpl(
      litigationRequestId: freezed == litigationRequestId
          ? _value.litigationRequestId
          : litigationRequestId // ignore: cast_nullable_to_non_nullable
              as String?,
      explanationRequests: freezed == explanationRequests
          ? _value.explanationRequests
          : explanationRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      litigationRequestArbitrationReportExplanationRequestFiles: freezed ==
              litigationRequestArbitrationReportExplanationRequestFiles
          ? _value._litigationRequestArbitrationReportExplanationRequestFiles
          : litigationRequestArbitrationReportExplanationRequestFiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArbitrationRequestModelImpl implements _ArbitrationRequestModel {
  _$ArbitrationRequestModelImpl(
      {this.litigationRequestId,
      this.explanationRequests,
      final List<String>?
          litigationRequestArbitrationReportExplanationRequestFiles})
      : _litigationRequestArbitrationReportExplanationRequestFiles =
            litigationRequestArbitrationReportExplanationRequestFiles;

  factory _$ArbitrationRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArbitrationRequestModelImplFromJson(json);

  @override
  final String? litigationRequestId;
  @override
  final String? explanationRequests;
  final List<String>?
      _litigationRequestArbitrationReportExplanationRequestFiles;
  @override
  List<String>? get litigationRequestArbitrationReportExplanationRequestFiles {
    final value = _litigationRequestArbitrationReportExplanationRequestFiles;
    if (value == null) return null;
    if (_litigationRequestArbitrationReportExplanationRequestFiles
        is EqualUnmodifiableListView)
      return _litigationRequestArbitrationReportExplanationRequestFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ArbitrationRequestModel(litigationRequestId: $litigationRequestId, explanationRequests: $explanationRequests, litigationRequestArbitrationReportExplanationRequestFiles: $litigationRequestArbitrationReportExplanationRequestFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArbitrationRequestModelImpl &&
            (identical(other.litigationRequestId, litigationRequestId) ||
                other.litigationRequestId == litigationRequestId) &&
            (identical(other.explanationRequests, explanationRequests) ||
                other.explanationRequests == explanationRequests) &&
            const DeepCollectionEquality().equals(
                other
                    ._litigationRequestArbitrationReportExplanationRequestFiles,
                _litigationRequestArbitrationReportExplanationRequestFiles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      litigationRequestId,
      explanationRequests,
      const DeepCollectionEquality()
          .hash(_litigationRequestArbitrationReportExplanationRequestFiles));

  /// Create a copy of ArbitrationRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArbitrationRequestModelImplCopyWith<_$ArbitrationRequestModelImpl>
      get copyWith => __$$ArbitrationRequestModelImplCopyWithImpl<
          _$ArbitrationRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArbitrationRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ArbitrationRequestModel implements ArbitrationRequestModel {
  factory _ArbitrationRequestModel(
          {final String? litigationRequestId,
          final String? explanationRequests,
          final List<String>?
              litigationRequestArbitrationReportExplanationRequestFiles}) =
      _$ArbitrationRequestModelImpl;

  factory _ArbitrationRequestModel.fromJson(Map<String, dynamic> json) =
      _$ArbitrationRequestModelImpl.fromJson;

  @override
  String? get litigationRequestId;
  @override
  String? get explanationRequests;
  @override
  List<String>? get litigationRequestArbitrationReportExplanationRequestFiles;

  /// Create a copy of ArbitrationRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArbitrationRequestModelImplCopyWith<_$ArbitrationRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
