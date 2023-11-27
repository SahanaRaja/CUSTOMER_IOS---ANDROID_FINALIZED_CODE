import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../forgotpassword/super_user/entities/reset_send_otp.dart';

abstract class CreateUserRepository {
  Future<Either<Failure, ResetPasswordOTP>> sendOTP(
      String userName, String userType, String languageId);
  Future<Either<Failure, ResetPasswordOTP>> sendOTPVerify(
      String userName, String otp, String userType, String languageId);
  Future<Either<Failure, ResetPasswordOTP>> addUser(
      String userName,
      String emailId,
      String password,
      String userType,
      int type,
      String languageId);
}
