import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';
@JsonSerializable()
class NotificationModel {
  int? notViewedCount;
  List<NotificationList>? notificationList;
  NotificationModel({this.notViewedCount, this.notificationList});
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
@JsonSerializable()
class NotificationList {
  int? requestTypeId;
  String? requestId;
  int? notificationActorTypeId;
  String? actorId;
  String? message;
  String? createdOn;
  bool? isViewed;
  String? viewedOn;
  String? sysNotificationActorType;
  String? sysRequestType;
  String? id;

  NotificationList(
      {this.requestTypeId,
        this.requestId,
        this.notificationActorTypeId,
        this.actorId,
        this.message,
        this.createdOn,
        this.isViewed,
        this.viewedOn,
        this.sysNotificationActorType,
        this.sysRequestType,
        this.id});
  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      _$NotificationListFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationListToJson(this);
}
