import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/ownerdata/models/retail_vertical_response/retail_vertical_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../data/ownerdata/models/owner_data_response/owner_data_response.dart';

abstract class OwnerDataRepository {
  Future<Either<Failure, OwnerDataResponse>> fetchAddress(
      String mobile, String postalCode, String languageId);
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
      String languageId);
  Future<Either<Failure, RetailVerticalResponse>> fetchVertical(
      String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> updateVertical(
      int verticalId, String languageId);
}
