
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';
import 'package:lask_client/features/profile/model/profile_model.dart';
import 'package:lask_client/features/profile/repo/iprofile_repo.dart';
import '../../../core/network/api_manager.dart';
import '../../../core/services/service_locator.dart';
import 'package:dio/dio.dart';

final profileRepo= Provider((ref) => ProfileRepo());
class ProfileRepo extends IProfileRepo{

   static const String userProfileApi="client/update/";
   static final ApiManager _api=getIt<ApiManager>();

   @override
  Future<Either<Failure, dynamic>> fetchProfile() {
   return apiBase(_api.dio!.get(userProfileApi));
  }
   Future<ProfileModel?> profile() async {
     final response=await  apiBase(_api.dio!.get(userProfileApi));
      response.fold((l) => null, (r){
        var profile= ProfileModel.fromJson(r);
        return profile;
      });
      return null;
   }

  @override
  EitherResponse profileUpdate({Map<String,dynamic>? map,XFile? file}) async {
    var formData = FormData();
    if (map != null) {
      map.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });
    }

    if(file!=null){
      formData.files.add(MapEntry(
        "user_image", await MultipartFile.fromFile(file.path),
      ));
    }

    return apiBase(_api.dio!.patch(userProfileApi,data:  formData));
  }


}