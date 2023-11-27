import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../data/fetchsplash/models/fetch_splash_response_model.dart';

abstract class FetchSplashRepository {
  Future<Either<Failure, FetchSplashResponseModel>> fetchSplash(
      String country, String dateTime, String device, String languageId);
  Future<Either<Failure, FetchSplashResponseModel>> fetchSplashInit(
      String languageId);
}
