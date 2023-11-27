// ignore_for_file: avoid_print

import 'package:customer_assist/home/data/fetchcity/datasources/fetch_city_details_remote_data_source.dart';
import 'package:customer_assist/home/data/fetchcity/models/fetchAreamodel/fetch_area_response_model.dart';
import 'package:customer_assist/home/domain/fetchcity/repositories/fetch_city_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../models/fetchCitymodel/fetch_city_response_model.dart';

class FetchCityRepositoryImpl implements FetchCityRepository {
  @override
  Future<Either<Failure, List<FetchCityResponseModel>>> fetchCity() async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
      List<FetchCityResponseModel> cityList = [];
      if (await connectionChecker.hasConnection) {
        cityList = await FetchCityRemoteDataSourceImpl().checkFetchCity();
      }
      return Right(cityList);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FetchAreaResponseModel>>> fetchArea() async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
      List<FetchAreaResponseModel> areaList = [];
      if (await connectionChecker.hasConnection) {
        areaList = await FetchCityRemoteDataSourceImpl().checkFetchArea();
      }
      return Right(areaList);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
