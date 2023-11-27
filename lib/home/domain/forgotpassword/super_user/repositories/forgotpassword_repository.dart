import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/reset_send_otp.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, ResetPasswordOTP>> sendOTP(
      String userName, String type, String languageId);
  Future<Either<Failure, ResetPasswordOTP>> sendOTPVerify(String userName,
      String password, String otp, String type, String languageId);
  Future<Either<Failure, ResetPasswordOTP>> sendOTPPasswordUpdate(
    String userName,
    String password,
    String otp,
    String type,
    String languageId,
    String? oldpassword,
  );
}
