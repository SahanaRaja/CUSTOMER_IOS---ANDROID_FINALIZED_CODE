import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/ownerdata/models/retail_vertical_response/retail_vertical_response.dart';
import 'package:customer_assist/home/domain/ownerdata/repositories/fetch_splash_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../datasources/owner_data_remote_data_source.dart';
import '../models/owner_data_response/owner_data_response.dart';

class OwnerDataRepositoryImpl implements OwnerDataRepository {
  @override
  Future<Either<Failure, OwnerDataResponse>> fetchAddress(
      String mobile, String postalCode, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
      OwnerDataResponse loginResponse = const OwnerDataResponse();
      if (await connectionChecker.hasConnection) {
        loginResponse = await OwnerDataRemoteDataSourceImpl()
            .fetchAddress(mobile, postalCode, languageId);
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
  Future<Either<Failure, RetailVerticalResponse>> fetchVertical(
      String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Retail Vertical Block Called Repo Implementation');
      RetailVerticalResponse retailResponse = const RetailVerticalResponse();
      if (await connectionChecker.hasConnection) {
        retailResponse =
            await OwnerDataRemoteDataSourceImpl().fetchVertical(languageId);
      }

      return Right(retailResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> updateVertical(
      int verticalId, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Retail Vertical Block Called Repo Implementation');
      ResetPasswordOTPModel retailUpdateResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        retailUpdateResponse = await OwnerDataRemoteDataSourceImpl()
            .updateVertical(verticalId, languageId);
      }

      return Right(retailUpdateResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> updateAddress(
      String mobile,
      String firstName,
      String lastName,
      String areaCode,
      String mobileNo,
      String addr1,
      String addr2,
      String type,
      String defaultflag,
      String locality,
      String postalCode,
      String state,
      String city,
      String country,
      String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Country Block Called Repo Implementation');
      ResetPasswordOTPModel loginResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        loginResponse = await OwnerDataRemoteDataSourceImpl().updateAddress(
            mobile,
            lastName,
            firstName,
            areaCode,
            mobileNo,
            addr1,
            addr2,
            type,
            defaultflag,
            locality,
            postalCode,
            state,
            city,
            country,
            languageId);
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
