// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      notViewedCount: (json['notViewedCount'] as num?)?.toInt(),
      notificationList: (json['notificationList'] as List<dynamic>?)
          ?.map((e) => NotificationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notViewedCount': instance.notViewedCount,
      'notificationList': instance.notificationList,
    };

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) =>
    NotificationList(
      requestTypeId: (json['requestTypeId'] as num?)?.toInt(),
      requestId: json['requestId'] as String?,
      notificationActorTypeId:
          (json['notificationActorTypeId'] as num?)?.toInt(),
      actorId: json['actorId'] as String?,
      message: json['message'] as String?,
      createdOn: json['createdOn'] as String?,
      isViewed: json['isViewed'] as bool?,
      viewedOn: json['viewedOn'] as String?,
      sysNotificationActorType: json['sysNotificationActorType'] as String?,
      sysRequestType: json['sysRequestType'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NotificationListToJson(NotificationList instance) =>
    <String, dynamic>{
      'requestTypeId': instance.requestTypeId,
      'requestId': instance.requestId,
      'notificationActorTypeId': instance.notificationActorTypeId,
      'actorId': instance.actorId,
      'message': instance.message,
      'createdOn': instance.createdOn,
      'isViewed': instance.isViewed,
      'viewedOn': instance.viewedOn,
      'sysNotificationActorType': instance.sysNotificationActorType,
      'sysRequestType': instance.sysRequestType,
      'id': instance.id,
    };
