import 'package:customer_assist/home/data/configure/models/configure_data_model/configure_data_model.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/delivery_time_model.dart';
import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../../../domain/configure/repositories/configure_repository.dart';
import '../datasources/configure_data_remote_data_source.dart';
import '../models/delivery_address_model/delivery_address_model.dart';
import '../models/let_me_shop/let_me_shop.dart';
import '../models/shop_details/shop_details.dart';

class ConfigureDataRepositoryImpl implements ConfigureDataRepository {
  @override
  Future<Either<Failure, ConfigureDataModel>> fetchDetails(
      String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('ConfigureResponse Block Called Repo Implementation');
      ConfigureDataModel configureResponse = const ConfigureDataModel();
      if (await connectionChecker.hasConnection) {
        configureResponse =
            await ConfigureDataRemoteDataSourceImpl().fetchDetails(languageId);
      }

      return Right(configureResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> shoppingMode(
      String homeStore, String delivery, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('ConfigureResponse Block Called Repo Implementation');
      ResetPasswordOTPModel resetResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        resetResponse = await ConfigureDataRemoteDataSourceImpl()
            .updateShoppingMode(homeStore, delivery, languageId);
      }

      return Right(resetResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DeliveryAddressModel>> fetchCustomerDeliveryAddress(
      String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('AddressREsponse Block Called Repo Implementation');
      DeliveryAddressModel addressResponse = const DeliveryAddressModel();
      if (await connectionChecker.hasConnection) {
        addressResponse = await ConfigureDataRemoteDataSourceImpl()
            .fetchCustomerDeliveryAddress(languageId);
      }

      return Right(addressResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
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
    String postalcode
  ) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Update AddressREsponse Block Called Repo Implementation');
      ResetPasswordOTPModel addressResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        addressResponse = await ConfigureDataRemoteDataSourceImpl()
            .updateCustomerDeliveryAddress(
                salutation,
                customerAddrId,
                status,
                firstName,
                lastName,
                addr1,
                addr2,
                country,
                locality,
                state,
                city,
                addressType,
                type,
                languageId,
                mobile1,
                mobile2,
                mobile3,
                postalcode);
      }

      return Right(addressResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShopDetails>> fetchShopType(String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      ShopDetails addressResponse = const ShopDetails();
      if (await connectionChecker.hasConnection) {
        addressResponse =
            await ConfigureDataRemoteDataSourceImpl().fetchShopType(languageId);
      }

      return Right(addressResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LetMeShop>> letMeShop(
      String shopType, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      LetMeShop letmeShopResponse = const LetMeShop();
      if (await connectionChecker.hasConnection) {
        letmeShopResponse = await ConfigureDataRemoteDataSourceImpl()
            .shopDetails(shopType, languageId);
      }

      return Right(letmeShopResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LetMeShop>> letMeShopGuest(
      String shopType, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      LetMeShop letmeShopGuestResponse = const LetMeShop();
      if (await connectionChecker.hasConnection) {
        letmeShopGuestResponse = await ConfigureDataRemoteDataSourceImpl()
            .guestShopDetails(shopType, languageId);
      }

      return Right(letmeShopGuestResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> updateShop(
      String shopId, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Update Shop Response Block Called Repo Implementation');
      ResetPasswordOTPModel addressResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        addressResponse = await ConfigureDataRemoteDataSourceImpl()
            .updateShop(shopId, languageId);
      }
      return Right(addressResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DeliveryTimeModel>> fetchDeliveryTime(
      String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Delivery Time Response Block Called Repo Implementation');
      DeliveryTimeModel deliveryTimeResponse = const DeliveryTimeModel();
      if (await connectionChecker.hasConnection) {
        deliveryTimeResponse = await ConfigureDataRemoteDataSourceImpl()
            .fetchDeliveryTime(languageId);
      }
      return Right(deliveryTimeResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> updateDeliveryTime(
      String time, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Update Delivery Time Response Block Called Repo Implementation');
      ResetPasswordOTPModel deliveryTimeResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        deliveryTimeResponse = await ConfigureDataRemoteDataSourceImpl()
            .updateDeliveryTime(time, languageId);
      }
      return Right(deliveryTimeResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
