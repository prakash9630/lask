import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';

abstract class IProfileRepo{
  Future<Either<Failure,dynamic>> fetchProfile();
  EitherResponse<dynamic> profileUpdate({Map<String,dynamic>? map, XFile? file});
}