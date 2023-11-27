import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/login/models/mobile_response/mobile_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/login_reponse.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> checkUserLogin(
      String email, String password, String languageId);
  Future<Either<Failure, MobileResponse>> checkMobile(
      String mobile, String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> mobileOtpVerify(
      String mobile, String otp, String languageId);
}
