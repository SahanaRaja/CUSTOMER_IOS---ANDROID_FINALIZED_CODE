import 'package:customer_assist/home/data/configure/models/configure_data_model/configure_data_model.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/delivery_time_model.dart';
import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/domain/forgotpassword/super_user/entities/reset_send_otp.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../data/configure/models/delivery_address_model/delivery_address_model.dart';
import '../../../data/configure/models/let_me_shop/let_me_shop.dart';
import '../../../data/configure/models/shop_details/shop_details.dart';

abstract class ConfigureDataRepository {
  Future<Either<Failure, ConfigureDataModel>> fetchDetails(String languageId);
  Future<Either<Failure, ShopDetails>> fetchShopType(String languageId);
  Future<Either<Failure, ResetPasswordOTP>> updateDeliveryTime(
      String time, String languageId);
  Future<Either<Failure, DeliveryTimeModel>> fetchDeliveryTime(
      String languageId);
  Future<Either<Failure, LetMeShop>> letMeShop(
      String shopType, String languageId);
  Future<Either<Failure, LetMeShop>> letMeShopGuest(
      String shopType, String languageId);
  Future<Either<Failure, ResetPasswordOTP>> shoppingMode(
      String homeStore, String delivery, String languageId);
  Future<Either<Failure, DeliveryAddressModel>> fetchCustomerDeliveryAddress(
      String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> updateShop(
      String shopId, String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> updateCustomerDeliveryAddress(
      String salutation,
      String customerAddrId,
      String status,
      String firstName,
      String lastName,
      String addr1,
      String addr2,
      String country,
      String locality,
      String state,
      String city,
      String addressType,
      String type,
      String languageId,
      String mobile1,
      String mobile2,
      String mobile3,
      String postalcode);
}
