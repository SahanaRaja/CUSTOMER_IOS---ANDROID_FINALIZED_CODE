// ignore_for_file: avoid_print

import 'package:customer_assist/home/data/guestfetchCountry/datasources/Guest_fetchcountry_details_remote_data_source.dart';
import 'package:customer_assist/home/data/guestfetchCountry/model2/zipcode.dart';
import 'package:customer_assist/home/data/guestfetchCountry/models/Guest_fetchcountry_response_model.dart';
import 'package:customer_assist/home/data/guestfetchCountry/models/timingResponse.dart';
import 'package:customer_assist/home/domain/guestfetchCountry/repositories/Guest_fetchcountry_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

class GuestFetchCountryRepositoryImpl implements GuestFetchCountryRepository {
  @override
  Future<Either<Failure, List<GuestFetchCountryResponseModel>>>
      guestfetchCountry() async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
     List< GuestFetchCountryResponseModel> countryList = [];
      if (await connectionChecker.hasConnection) {
        countryList = await GuestFetchCountryRemoteDataSourceImpl()
            .checkGuestFetchCountry();
      }
      return Right(countryList);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, ZipCodeResponse>> checkZipcode(
      String postalController) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('MobileBlock Called Repo Implementation');
      ZipCodeResponse zipCodeResponse = const ZipCodeResponse();
      if (await connectionChecker.hasConnection) {
        zipCodeResponse =
            await GuestFetchCountryRemoteDataSourceImpl().checkZipcode(postalController);
      }

      return Right(zipCodeResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
