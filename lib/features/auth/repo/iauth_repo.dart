

import 'package:dartz/dartz.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';
import '../../../core/network/api_base.dart';



abstract class IAuthRepo{
   Future<Either<Failure,dynamic>> login({required Map<String,dynamic> body});
   Future<Either<Failure,dynamic>> resetPassword({required Map<String,dynamic> body});
   Future<Either<Failure,dynamic>> updatePassword({required Map<String,dynamic> body});
   Future<Either<Failure,dynamic>> forgotPassword({required Map<String,dynamic> body});
   Future<Either<Failure,dynamic>> emailValidation({required Map<String,dynamic> body,required bool isForgotPass});
   Future<Either<Failure,dynamic>> emailRegister({required Map<String,dynamic> body});
   Future<Either<Failure,dynamic>> signUp({required Map<String,dynamic> body});
   EitherResponse<dynamic> getCountry();


}