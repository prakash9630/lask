import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/profile/model/profile_model.dart';
import '../repo/contact_us_repo.dart';
import 'contact_us_state.dart';

final contactUsNotifyProvider =
    StateNotifierProvider<ContactUsNotifier, ContactUsState>((ref) {
  return ContactUsNotifier(ref);
});

class ContactUsNotifier extends StateNotifier<ContactUsState> {
  ContactUsNotifier(this.ref) : super(ContactUsState.initial());
  final Ref ref;

  TextEditingController subjectController = TextEditingController();

  void onNameChange(String name) {
    state = state.copyWith(fullName: name, status: const FormStatus.initial());
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email, status: const FormStatus.initial());
  }

  void onPhoneChange(String phone) {
    state = state.copyWith(phoneNo: phone, status: const FormStatus.initial());
  }

  void onSubjectChange(String subject) {
    state =
        state.copyWith(subject: subject, status: const FormStatus.initial());
    subjectController.text = state.subject!;
  }

  void onMessageChange(String message) {
    state =
        state.copyWith(message: message, status: const FormStatus.initial());
  }

  void onFileAdd(List<File> files) {
    state =
        state.copyWith(files: files, status: const FormStatus.initial());
  }

  void setInitialData(ProfileModel? model){
    state = state.copyWith(status:const FormStatus.initial(),
        fullName: model?.fullName,
    email:model?.email,
        phoneNo:model?.email);
  }

  void sendMessage(GlobalKey<FormState> key) async {
    var body = {
      "name": state.fullName,
      "email": state.email,
      "phone_number": state.phoneNo,
      "subject": state.subject,
      "message": state.message,
    };
    var formData = FormData.fromMap(body);
    if (state.files != null) {
      for (var file in state.files!) {
        formData.files.addAll([
          MapEntry("attachments", await MultipartFile.fromFile(file.path)),
        ]);
      }
    }

    final response = await ref.read(contactUsRepoProvider).sendMessage(formData);
    state = response
        .fold((l) => state.copyWith(status: const FormStatus.error()), (r) {
      key.currentState!.reset();
      subjectController.text="";
      return state.copyWith(status: const FormStatus.success());
    });
  }
}
