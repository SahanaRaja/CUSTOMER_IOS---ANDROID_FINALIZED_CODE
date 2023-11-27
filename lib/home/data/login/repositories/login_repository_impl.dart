import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../../../domain/login/entities/login_reponse.dart';
import '../../../domain/login/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';
import '../models/mobile_response/mobile_response.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, LoginResponse>> checkUserLogin(
      String email, String password, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('LoginBlock Called Repo Implementation');
      LoginResponse loginResponse = const LoginResponse();
      if (await connectionChecker.hasConnection) {
        loginResponse = await LoginRemoteDataSourceImpl()
            .checkLogin(email, password, languageId);
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
  Future<Either<Failure, MobileResponse>> checkMobile(
      String mobile, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('MobileBlock Called Repo Implementation');
      MobileResponse mobileResponse = const MobileResponse();
      if (await connectionChecker.hasConnection) {
        mobileResponse =
            await LoginRemoteDataSourceImpl().checkMobile(mobile, languageId);
      }

      return Right(mobileResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> mobileOtpVerify(
      String mobile, String otp, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('MobileBlock Called Repo Implementation');
      ResetPasswordOTPModel mobileotpResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        mobileotpResponse = await LoginRemoteDataSourceImpl()
            .mobileOTPVerify(mobile, otp, languageId);
      }

      return Right(mobileotpResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
