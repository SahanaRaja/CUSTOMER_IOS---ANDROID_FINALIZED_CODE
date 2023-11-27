import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../domain/createuser/create_user_repository.dart';
import '../../../domain/forgotpassword/super_user/entities/reset_send_otp.dart';
import '../datasources/create_user_remote_data_source.dart';

class CreateUserRepositoryImpl extends CreateUserRepository {
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  @override
  Future<Either<Failure, ResetPasswordOTP>> addUser(
      String userName,
      String emailId,
      String password,
      String userType,
      int type,
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('CreateUserBlock Called Repo Implementation');
      ResetPasswordOTP? otpResponse;
      if (await connectionChecker.hasConnection) {
        otpResponse = await CreateUserRemoteDataSourceImpl()
            .addUser(userName, emailId, password, userType, type, languageId);
      }

      return Right(otpResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTP>> sendOTP(
      String userName, String userType, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('CreateUserBlock Called Repo Implementation');
      ResetPasswordOTP? otpResponse;
      // if (await connectionChecker.hasConnection) {
      otpResponse = await CreateUserRemoteDataSourceImpl()
          .checkSendOTP(userName, userType, languageId);
      // } else {
      //   otpResponse = ResetPasswordOTP(
      //       message:
      //           'The device needs to be connected to internet to send otp.',
      //       result: 0);
      // }
      return Right(otpResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTP>> sendOTPVerify(
      String userName, String otp, String userType, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('CreateUserBlock Called Repo Implementation');
      ResetPasswordOTP? otpResponse;
      if (await connectionChecker.hasConnection) {
        otpResponse = await CreateUserRemoteDataSourceImpl()
            .checkSendOTPVerify(userName, otp, userType, languageId);
      } else {
        otpResponse = const ResetPasswordOTP(
            message:
                'The device needs to be connected to internet to send otp.',
            result: 0);
      }
      return Right(otpResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
