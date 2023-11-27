import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../domain/forgotpassword/super_user/entities/reset_send_otp.dart';
import '../../../../domain/forgotpassword/super_user/repositories/forgotpassword_repository.dart';
import '../datasources/forgotpassword_remote_data_source.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  // final ForgotPasswordRemoteDataSource forgotPasswordDataSource;

  // ForgotPasswordRepositoryImpl({ this.forgotPasswordDataSource});

  @override
  Future<Either<Failure, ResetPasswordOTP>> sendOTP(
      String userName, String type, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)print('ForgotPasswordBlock Called Repo Implementation(SENDING OTP)');
      ResetPasswordOTP resetPasswordOTPResponse =
          await ForgotPasswordRemoteDataSourceImpl()
              .checkSendOTP(userName, type, languageId);
      return Right(resetPasswordOTPResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTP>> sendOTPVerify(String userName,
     String otp,  String newPassword,String type, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)print(
      //     'ForgotPasswordBlock Called Repo Implementation(VERIFYING PASSWORD)');
      ResetPasswordOTP resetPasswordOTPResponse =
          await ForgotPasswordRemoteDataSourceImpl()
              .checkSendOTPVerify(userName, otp,newPassword, type,languageId);
      return Right(resetPasswordOTPResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTP>> sendOTPPasswordUpdate(
   String userName,
    String password,
    String otp,
    String type,
    String languageId,
    String? oldpassword,
  ) async {
    try {
      // if(SHOW_DEBUGGING)print(
      //     'ForgotPasswordBlock Called Repo Implementation(UPDATING PASSWORD)');
      ResetPasswordOTP resetPasswordOTPResponse =
          await ForgotPasswordRemoteDataSourceImpl().checkSendOTPPasswordUpdate(
               userName, password, otp, type, languageId, oldpassword );
      return Right(resetPasswordOTPResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
