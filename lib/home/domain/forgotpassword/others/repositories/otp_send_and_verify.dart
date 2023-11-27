import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../super_user/entities/reset_send_otp.dart';

abstract class OtpSendAndVerifyRepository {
  Future<Either<Failure, ResetPasswordOTP>> sendOTP(
      String userName, String type, String languageId);
  Future<Either<Failure, ResetPasswordOTP>> sendOTPVerify(
      String userName, String otp, String type, String languageId);
  Future<Either<Failure, ResetPasswordOTP>> sendOTPPasswordUpdate(
    String userName,
    String password,
    String type,
    String? oldpassword,
  );
}
