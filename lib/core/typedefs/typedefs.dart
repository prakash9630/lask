import 'package:dartz/dartz.dart';
import 'package:lask_client/core/network/api_base.dart';

/// returns either response or app error
typedef EitherResponse<T> = Future<Either<Failure,T>>;



