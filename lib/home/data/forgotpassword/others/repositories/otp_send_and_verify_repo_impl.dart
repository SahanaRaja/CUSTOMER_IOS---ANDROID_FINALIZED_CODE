import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../domain/forgotpassword/others/repositories/otp_send_and_verify.dart';
import '../../../../domain/forgotpassword/super_user/entities/reset_send_otp.dart';
import '../datasources/otp_send_verify_remote_data_source.dart';

class OtpSendAndVerifyRepositoryImpl extends OtpSendAndVerifyRepository {
  final OtpSendAndVerifyRemoteDataSource otpSendAndVerifyRemoteDataSource;

  OtpSendAndVerifyRepositoryImpl(
      {required this.otpSendAndVerifyRemoteDataSource});
  @override
  Future<Either<Failure, ResetPasswordOTP>> sendOTP(
      String userName, String type, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)print('ForgotPasswordBlock Called Repo Implementation(SENDING OTP)');
      ResetPasswordOTP resetPasswordOTPResponse =
          await otpSendAndVerifyRemoteDataSource.checkSendOTP(
              userName, type, languageId);
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
  Future<Either<Failure, ResetPasswordOTP>> sendOTPVerify(
      String userName, String otp, String type, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)print(
      //     'ForgotPasswordBlock Called Repo Implementation(VERIFYING PASSWORD)');
      ResetPasswordOTP resetPasswordOTPResponse =
          await otpSendAndVerifyRemoteDataSource.checkSendOTPVerify(
              userName, otp, type, languageId);
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
    String newpassword,
    String type,
    String? oldpassword,
  ) async {
    try {
      // if(SHOW_DEBUGGING)print(
      //     'ForgotPasswordBlock Called Repo Implementation(UPDATING PASSWORD)');
      ResetPasswordOTP resetPasswordOTPResponse =
          await otpSendAndVerifyRemoteDataSource.checkSendOTPPasswordUpdate(
              userName, newpassword, type, oldpassword);
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
