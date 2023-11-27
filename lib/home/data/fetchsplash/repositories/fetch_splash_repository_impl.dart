import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../../../domain/fetchsplash/repositories/fetch_splash_repository.dart';
import '../datasources/fetch_splash_remote_data_source.dart';
import '../models/fetch_splash_response_model.dart';

class FetchSplashRepositoryImpl implements FetchSplashRepository {
  @override
  Future<Either<Failure, FetchSplashResponseModel>> fetchSplash(
      String country, String dateTime, String device, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
      FetchSplashResponseModel loginResponse = const FetchSplashResponseModel();
      if (await connectionChecker.hasConnection) {
        loginResponse = await FetchSplashRemoteDataSourceImpl()
            .checkFetchSplash(country, dateTime, device, languageId);
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

  @override
  Future<Either<Failure, FetchSplashResponseModel>> fetchSplashInit(
      String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
      FetchSplashResponseModel loginResponse = const FetchSplashResponseModel();
      if (await connectionChecker.hasConnection) {
        loginResponse =
            await FetchSplashRemoteDataSourceImpl().fetchSplashInit(languageId);
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
