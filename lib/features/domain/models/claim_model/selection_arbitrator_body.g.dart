// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_arbitrator_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionArbitratorRequestImpl _$$SelectionArbitratorRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectionArbitratorRequestImpl(
      requestId: json['requestId'] as String?,
      arbitratorNominationListRequestItems:
          (json['arbitratorNominationListRequestItems'] as List<dynamic>?)
              ?.map((e) => ArbitratorNominationListRequestItems.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$SelectionArbitratorRequestImplToJson(
        _$SelectionArbitratorRequestImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'arbitratorNominationListRequestItems':
          instance.arbitratorNominationListRequestItems,
    };

_$ArbitratorNominationListRequestItemsImpl
    _$$ArbitratorNominationListRequestItemsImplFromJson(
            Map<String, dynamic> json) =>
        _$ArbitratorNominationListRequestItemsImpl(
          arbitratorListId: json['arbitratorListId'] as String?,
          priority: (json['priority'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ArbitratorNominationListRequestItemsImplToJson(
        _$ArbitratorNominationListRequestItemsImpl instance) =>
    <String, dynamic>{
      'arbitratorListId': instance.arbitratorListId,
      'priority': instance.priority,
    };
