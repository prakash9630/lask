
import 'package:lask_client/features/support_ticket/model/support_attachment_model.dart';

class SupportTicketReplyMeta {
  int count;
  dynamic next;
  dynamic previous;
  List<SupportTicketReplyModel> results;

  SupportTicketReplyMeta({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory SupportTicketReplyMeta.fromJson(Map<String, dynamic> json) =>
      SupportTicketReplyMeta(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<SupportTicketReplyModel>.from(
            json["results"].map((x) => SupportTicketReplyModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

// id":3,"message":"iskrii Ola","reply_attachment":[],"user_type":"admin"

class SupportTicketReplyModel {
  int id;
  String message;
  List<SupportAttachmentModel> replyAttachment;
  String userType;
  DateTime createdAt;

  SupportTicketReplyModel({
    required this.id,
    required this.message,
    required this.replyAttachment,
    required this.userType,
    required this.createdAt,
  });

  factory SupportTicketReplyModel.fromJson(Map<String, dynamic> json) =>
      SupportTicketReplyModel(
        id: json["id"],
        message: json["message"],
        replyAttachment: List<SupportAttachmentModel>.from(
            json["reply_attachment"]
                .map((x) => SupportAttachmentModel.fromJson(x))),
        userType: json["user_type"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "reply_attachment":
            List<dynamic>.from(replyAttachment.map((x) => x.toJson())),
      };
}
