import 'package:lask_client/core/extension/extension.dart';
class ChatDetailDataModel {
  final String? username;
  final String message;
  final DateTime dateTime;
  final String? fileUrl;
  final bool? inHold;
  final bool? endCall;

  final String? fileName;
  bool showProcessing;

  ChatDetailDataModel({
    required this.username,
    required this.message,
    required this.dateTime,
    this.inHold,
    this.endCall,
    this.fileUrl,
    this.fileName,
    required this.showProcessing,
  });

  factory ChatDetailDataModel.fromJson(
      Map<String, dynamic> json, {
        bool showProcessing = false,
      }) {


    return ChatDetailDataModel(
      username: json["username"],
      message: json["message"],
      inHold: json['inHold'],
      dateTime: DateTime.tryParse(json["dateTime"] ?? "") ?? DateTime.now(),
      fileUrl: json["file_url"],
      fileName: json["file_name"],
      endCall: json["endCall"],
      showProcessing: showProcessing,
    );
  }

  bool get isPdf => fileUrl?.isPdf ?? false;

  bool get isImage => (fileUrl?.isImage ?? false);

  String get getFullFileName {
    String today = DateTime.now()
        .toString()
        .replaceAll(" ", "")
        .replaceAll(":", "")
        .replaceAll(".", "");

    return fileName ?? "$today.${fileUrl?.extention}";
  }

  String? get fileSize {
    return null;
  }
}
