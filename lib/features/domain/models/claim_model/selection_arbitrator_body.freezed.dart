// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_arbitrator_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectionArbitratorRequest _$SelectionArbitratorRequestFromJson(
    Map<String, dynamic> json) {
  return _SelectionArbitratorRequest.fromJson(json);
}

/// @nodoc
mixin _$SelectionArbitratorRequest {
  String? get requestId => throw _privateConstructorUsedError;
  List<ArbitratorNominationListRequestItems>?
      get arbitratorNominationListRequestItems =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectionArbitratorRequestCopyWith<SelectionArbitratorRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionArbitratorRequestCopyWith<$Res> {
  factory $SelectionArbitratorRequestCopyWith(SelectionArbitratorRequest value,
          $Res Function(SelectionArbitratorRequest) then) =
      _$SelectionArbitratorRequestCopyWithImpl<$Res,
          SelectionArbitratorRequest>;
  @useResult
  $Res call(
      {String? requestId,
      List<ArbitratorNominationListRequestItems>?
          arbitratorNominationListRequestItems});
}

/// @nodoc
class _$SelectionArbitratorRequestCopyWithImpl<$Res,
        $Val extends SelectionArbitratorRequest>
    implements $SelectionArbitratorRequestCopyWith<$Res> {
  _$SelectionArbitratorRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? arbitratorNominationListRequestItems = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      arbitratorNominationListRequestItems: freezed ==
              arbitratorNominationListRequestItems
          ? _value.arbitratorNominationListRequestItems
          : arbitratorNominationListRequestItems // ignore: cast_nullable_to_non_nullable
              as List<ArbitratorNominationListRequestItems>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectionArbitratorRequestImplCopyWith<$Res>
    implements $SelectionArbitratorRequestCopyWith<$Res> {
  factory _$$SelectionArbitratorRequestImplCopyWith(
          _$SelectionArbitratorRequestImpl value,
          $Res Function(_$SelectionArbitratorRequestImpl) then) =
      __$$SelectionArbitratorRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? requestId,
      List<ArbitratorNominationListRequestItems>?
          arbitratorNominationListRequestItems});
}

/// @nodoc
class __$$SelectionArbitratorRequestImplCopyWithImpl<$Res>
    extends _$SelectionArbitratorRequestCopyWithImpl<$Res,
        _$SelectionArbitratorRequestImpl>
    implements _$$SelectionArbitratorRequestImplCopyWith<$Res> {
  __$$SelectionArbitratorRequestImplCopyWithImpl(
      _$SelectionArbitratorRequestImpl _value,
      $Res Function(_$SelectionArbitratorRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? arbitratorNominationListRequestItems = freezed,
  }) {
    return _then(_$SelectionArbitratorRequestImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      arbitratorNominationListRequestItems: freezed ==
              arbitratorNominationListRequestItems
          ? _value._arbitratorNominationListRequestItems
          : arbitratorNominationListRequestItems // ignore: cast_nullable_to_non_nullable
              as List<ArbitratorNominationListRequestItems>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectionArbitratorRequestImpl implements _SelectionArbitratorRequest {
  _$SelectionArbitratorRequestImpl(
      {this.requestId,
      final List<ArbitratorNominationListRequestItems>?
          arbitratorNominationListRequestItems})
      : _arbitratorNominationListRequestItems =
            arbitratorNominationListRequestItems;

  factory _$SelectionArbitratorRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SelectionArbitratorRequestImplFromJson(json);

  @override
  final String? requestId;
  final List<ArbitratorNominationListRequestItems>?
      _arbitratorNominationListRequestItems;
  @override
  List<ArbitratorNominationListRequestItems>?
      get arbitratorNominationListRequestItems {
    final value = _arbitratorNominationListRequestItems;
    if (value == null) return null;
    if (_arbitratorNominationListRequestItems is EqualUnmodifiableListView)
      return _arbitratorNominationListRequestItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SelectionArbitratorRequest(requestId: $requestId, arbitratorNominationListRequestItems: $arbitratorNominationListRequestItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionArbitratorRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            const DeepCollectionEquality().equals(
                other._arbitratorNominationListRequestItems,
                _arbitratorNominationListRequestItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      const DeepCollectionEquality()
          .hash(_arbitratorNominationListRequestItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionArbitratorRequestImplCopyWith<_$SelectionArbitratorRequestImpl>
      get copyWith => __$$SelectionArbitratorRequestImplCopyWithImpl<
          _$SelectionArbitratorRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectionArbitratorRequestImplToJson(
      this,
    );
  }
}

abstract class _SelectionArbitratorRequest
    implements SelectionArbitratorRequest {
  factory _SelectionArbitratorRequest(
          {final String? requestId,
          final List<ArbitratorNominationListRequestItems>?
              arbitratorNominationListRequestItems}) =
      _$SelectionArbitratorRequestImpl;

  factory _SelectionArbitratorRequest.fromJson(Map<String, dynamic> json) =
      _$SelectionArbitratorRequestImpl.fromJson;

  @override
  String? get requestId;
  @override
  List<ArbitratorNominationListRequestItems>?
      get arbitratorNominationListRequestItems;
  @override
  @JsonKey(ignore: true)
  _$$SelectionArbitratorRequestImplCopyWith<_$SelectionArbitratorRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ArbitratorNominationListRequestItems
    _$ArbitratorNominationListRequestItemsFromJson(Map<String, dynamic> json) {
  return _ArbitratorNominationListRequestItems.fromJson(json);
}

/// @nodoc
mixin _$ArbitratorNominationListRequestItems {
  String? get arbitratorListId => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArbitratorNominationListRequestItemsCopyWith<
          ArbitratorNominationListRequestItems>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArbitratorNominationListRequestItemsCopyWith<$Res> {
  factory $ArbitratorNominationListRequestItemsCopyWith(
          ArbitratorNominationListRequestItems value,
          $Res Function(ArbitratorNominationListRequestItems) then) =
      _$ArbitratorNominationListRequestItemsCopyWithImpl<$Res,
          ArbitratorNominationListRequestItems>;
  @useResult
  $Res call({String? arbitratorListId, int? priority});
}

/// @nodoc
class _$ArbitratorNominationListRequestItemsCopyWithImpl<$Res,
        $Val extends ArbitratorNominationListRequestItems>
    implements $ArbitratorNominationListRequestItemsCopyWith<$Res> {
  _$ArbitratorNominationListRequestItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arbitratorListId = freezed,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      arbitratorListId: freezed == arbitratorListId
          ? _value.arbitratorListId
          : arbitratorListId // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArbitratorNominationListRequestItemsImplCopyWith<$Res>
    implements $ArbitratorNominationListRequestItemsCopyWith<$Res> {
  factory _$$ArbitratorNominationListRequestItemsImplCopyWith(
          _$ArbitratorNominationListRequestItemsImpl value,
          $Res Function(_$ArbitratorNominationListRequestItemsImpl) then) =
      __$$ArbitratorNominationListRequestItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? arbitratorListId, int? priority});
}

/// @nodoc
class __$$ArbitratorNominationListRequestItemsImplCopyWithImpl<$Res>
    extends _$ArbitratorNominationListRequestItemsCopyWithImpl<$Res,
        _$ArbitratorNominationListRequestItemsImpl>
    implements _$$ArbitratorNominationListRequestItemsImplCopyWith<$Res> {
  __$$ArbitratorNominationListRequestItemsImplCopyWithImpl(
      _$ArbitratorNominationListRequestItemsImpl _value,
      $Res Function(_$ArbitratorNominationListRequestItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arbitratorListId = freezed,
    Object? priority = freezed,
  }) {
    return _then(_$ArbitratorNominationListRequestItemsImpl(
      arbitratorListId: freezed == arbitratorListId
          ? _value.arbitratorListId
          : arbitratorListId // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArbitratorNominationListRequestItemsImpl
    implements _ArbitratorNominationListRequestItems {
  _$ArbitratorNominationListRequestItemsImpl(
      {this.arbitratorListId, this.priority});

  factory _$ArbitratorNominationListRequestItemsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ArbitratorNominationListRequestItemsImplFromJson(json);

  @override
  final String? arbitratorListId;
  @override
  final int? priority;

  @override
  String toString() {
    return 'ArbitratorNominationListRequestItems(arbitratorListId: $arbitratorListId, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArbitratorNominationListRequestItemsImpl &&
            (identical(other.arbitratorListId, arbitratorListId) ||
                other.arbitratorListId == arbitratorListId) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, arbitratorListId, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArbitratorNominationListRequestItemsImplCopyWith<
          _$ArbitratorNominationListRequestItemsImpl>
      get copyWith => __$$ArbitratorNominationListRequestItemsImplCopyWithImpl<
          _$ArbitratorNominationListRequestItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArbitratorNominationListRequestItemsImplToJson(
      this,
    );
  }
}

abstract class _ArbitratorNominationListRequestItems
    implements ArbitratorNominationListRequestItems {
  factory _ArbitratorNominationListRequestItems(
      {final String? arbitratorListId,
      final int? priority}) = _$ArbitratorNominationListRequestItemsImpl;

  factory _ArbitratorNominationListRequestItems.fromJson(
          Map<String, dynamic> json) =
      _$ArbitratorNominationListRequestItemsImpl.fromJson;

  @override
  String? get arbitratorListId;
  @override
  int? get priority;
  @override
  @JsonKey(ignore: true)
  _$$ArbitratorNominationListRequestItemsImplCopyWith<
          _$ArbitratorNominationListRequestItemsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
