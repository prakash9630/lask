
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';

import '../../../core/services/service_locator.dart';

final contactUsRepoProvider = Provider<ContactUsRepo>((ref) =>ContactUsRepo());

class ContactUsRepo{
  static const String contactUsApi='contact/';
  final ApiManager _api= getIt<ApiManager>();
  Future<Either<Failure,dynamic>> sendMessage(FormData body){
        return apiBase(_api.dio!.post(contactUsApi,data: body),showToastMsg: true,showProgressDialogue: true);
  }
}