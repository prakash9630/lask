import '../../home_page/model/hompage_model.dart';

class CallLawyerModel {
  int? count;
  String? next;
  String? previous;
  List<RecentCalls>? callLogs;
  CallLawyerModel({this.count, this.next, this.previous, this.callLogs});

  CallLawyerModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      callLogs = <RecentCalls>[];
      json['results'].forEach((v) {
        callLogs!.add(RecentCalls.fromJson(v));
      });
    }
  }
}