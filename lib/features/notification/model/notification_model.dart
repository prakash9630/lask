class NotificationModel {
  int? count;
  String? next;
  String? previous;
  List<NotificationsInfo>? notifications;
  NotificationModel({this.count, this.next, this.previous, this.notifications});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      notifications = <NotificationsInfo>[];
      json['results'].forEach((v) {
        notifications!.add(NotificationsInfo.fromJson(v));
      });
    }
  }
}

class NotificationsInfo {
  int? id;
  Notification? notification;
  bool? isRead;
  NotificationsInfo({this.id, this.notification, this.isRead});
  NotificationsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
    isRead = json['is_read'];
  }

}
class Notification {
  int? id;
  String? title;
  String? description;
  String? image;
  String? createdAt;

  Notification(
      {this.id, this.title, this.description, this.image, this.createdAt});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
  }
}
