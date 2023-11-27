// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../domain/language/entities/language_response.dart';
import '../../../domain/language/repositories/language_repository.dart';
import '../datasources/language_data_source.dart';

class LanguageDetailRepositoryImpl extends LanguageRepository {
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  @override
  Future<Either<Failure, LanguageResponse>> fetchLanguageDetails(
      int languageNum) async {
    try {
      LanguageResponse languangeDetails;
      if (await connectionChecker.hasConnection) {
        languangeDetails = (await languageDetailsRemoteDataSourceImpl()
            .fetchLanguageDetails(languageNum));
      } else {
        languangeDetails = const LanguageResponse();
      }

      return Right(languangeDetails);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
