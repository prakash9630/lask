import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';

final supportRepoProvider = Provider<SupportRepo>((ref) => SupportRepo());

class SupportRepo {
  final ApiManager _api = getIt<ApiManager>();
  static String supportTicketApi = "tickets/";
  static String supportTicketRepliesApi = "tickets/{id}/replies/";
  static String supportTicketSendRepliesApi = "tickets/{id}/create/reply/";
  EitherResponse<dynamic> getSupportTicket(String? url) {
    return apiBase(_api.dio!.get(url ?? supportTicketApi));
  }

  EitherResponse<dynamic> getTicketReplies({String? url, required int id}) {
    return apiBase(_api.dio!
        .get(url ?? supportTicketRepliesApi.replaceAll("{id}", id.toString())));
  }

  EitherResponse<dynamic> getTicketSendReplies(
      {required Map<String, dynamic> data,
      required int id,
      List<File>? attachments}) async {

    FormData formData = FormData.fromMap(data);
    if (attachments != null) {
      for (var file in attachments) {
        formData.files.addAll([
        MapEntry("attachments", await MultipartFile.fromFile(file.path)),
    ]);
    }
    }

    return apiBase(_api.dio!.post(
        supportTicketSendRepliesApi.replaceAll("{id}", id.toString()),
        data: formData));
  }
}
