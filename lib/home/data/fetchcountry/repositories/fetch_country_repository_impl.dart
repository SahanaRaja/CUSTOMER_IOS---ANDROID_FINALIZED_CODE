// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../../../domain/fetchcountry/repositories/fetch_country_repository.dart';
import '../datasources/fetch_country_details_remote_data_source.dart';
import '../models/fetch_country_response_model.dart';

class FetchCountryRepositoryImpl implements FetchCountryRepository {
  @override
  Future<Either<Failure, FetchCountryResponseModel>> fetchCountry(
      String country, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
      FetchCountryResponseModel loginResponse =
          const FetchCountryResponseModel();
      if (await connectionChecker.hasConnection) {
        loginResponse = await FetchCountryRemoteDataSourceImpl()
            .checkFetchCountry(country, languageId);
      }
      return Right(loginResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
