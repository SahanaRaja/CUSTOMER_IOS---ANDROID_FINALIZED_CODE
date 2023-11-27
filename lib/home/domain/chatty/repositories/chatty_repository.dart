// ignore_for_file: camel_case_types

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/chatty_response.dart';

abstract class cHattyRepository {
  Future<Either<Failure, List<cHattyResponse>>> fetchChatty();

}
