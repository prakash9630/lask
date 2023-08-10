import 'package:lask_client/features/support_ticket/model/support_attachment_model.dart';
import 'package:lask_client/features/support_ticket/widget/support_view.dart';

class SupportModel {
  int? count;
  String? next;
  String? previous;
  List<Support>? results;

  SupportModel({this.count, this.next, this.previous, this.results});

  SupportModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Support>[];
      json['results'].forEach((v) {
        results!.add(Support.fromJson(v));
      });
    }
  }

}

class Support {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? subject;
  String? message;
  List<SupportAttachmentModel>? attachment;
  SupportTicketsStatus? ticketStatus;

  Support(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.subject,
        this.message,
        this.attachment,
        this.ticketStatus});

  Support.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    subject = json['subject'];
    message = json['message'];
    attachment = List<SupportAttachmentModel>.from(json["contact_attachment"]
        .map((x) => SupportAttachmentModel.fromJson(x)));
    ticketStatus = SupportTicketsStatus.toStatus(json['ticket_status']);
  }

}