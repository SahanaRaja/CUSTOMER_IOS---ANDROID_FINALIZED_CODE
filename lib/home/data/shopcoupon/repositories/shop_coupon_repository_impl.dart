import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/company_offer/company_offer.dart';
import 'package:customer_assist/home/data/shopcoupon/models/sas_move_shopping_list_model/sas_move_shopping_list_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shop_coupon_model/shop_coupon_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/RrestaurantItem.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/product_item.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/shopping_products_model.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../domain/shopcoupon/shop_coupon_repository.dart';
import '../datasources/shop_coupon_remote_data_source.dart';
import '../models/addons.dart/addonmodel.dart';
import '../models/barcode_scanner_model/barcode_scanner_model.dart';
import '../models/coupon_company/coupon_company.dart';
import '../models/sas_response_model/sas_response_model.dart';
import '../models/shopping_list_data_model/shopping_list_data_model.dart';
import '../models/shopping_outlet_model/shopping_outlet_model.dart';

class ShopCouponRepositoryImpl extends ShopCouponRepository {
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  @override
  Future<Either<Failure, ShopCouponModel>> fetchAdvertisercouponhead() async {
    try {
      // if(SHOW_DEBUGGING)
      print('CreateUserBlock Called Repo Implementation');
      ShopCouponModel? otpResponse;
      if (await connectionChecker.hasConnection) {
        otpResponse =
            await ShopCouponRemoteDataSourceImpl().fetchAdvertisercouponhead();
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
  Future<Either<Failure, ProductItem>> downloadProductItem(
      String search) async {
    try {
      // if(SHOW_DEBUGGING)
      print('ShoppingProductsResponseBlock Called Repo Implementation');
      ProductItem? productsResponse;
      if (await connectionChecker.hasConnection) {
        productsResponse =
            await ShopCouponRemoteDataSourceImpl().downloadProductItem(search);
      }

      return Right(productsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CouponCompany>> fetchCompanyCoupon(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('couponCampanyBlock Called Repo Implementation');
      CouponCompany? couponCampanyResponse;
      if (await connectionChecker.hasConnection) {
        couponCampanyResponse = await ShopCouponRemoteDataSourceImpl()
            .fetchCompanyCoupon(languageId);
      }

      return Right(couponCampanyResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CompanyOffer>> fetchCompanyCustomerOffer(
      List promo, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('couponCampanyBlock Called Repo Implementation');
      CompanyOffer? companyOfferResponse;
      if (await connectionChecker.hasConnection) {
        companyOfferResponse = await ShopCouponRemoteDataSourceImpl()
            .fetchCompanyCustomerOffer(promo, languageId);
      }

      return Right(companyOfferResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> updateCustomerCoupon(
      List coupon, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('updateCustomerCouponBlock Called Repo Implementation');
      ResetPasswordOTPModel? companyOfferResponse;
      if (await connectionChecker.hasConnection) {
        companyOfferResponse = await ShopCouponRemoteDataSourceImpl()
            .updateCustomerCoupon(coupon, languageId);
      }

      return Right(companyOfferResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShoppingProductsModel>> downloadShoppingProduct(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('ShoppingProductsResponseBlock Called Repo Implementation');
      ShoppingProductsModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .downloadShoppingProduct(languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  } 
  @override
  Future<Either<Failure, AddOnsModel>> addOnsItem(
      String productcode,String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('addOnsModelResponseBlock Called Repo Implementation');
      AddOnsModel? addOnsModelResponse;
      if (await connectionChecker.hasConnection) {
        addOnsModelResponse = await ShopCouponRemoteDataSourceImpl()
            .addOnsItem(productcode,languageId);
      }

      return Right(addOnsModelResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RestaurantProductsModel>> downloadResProduct(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('ShoppingProductsResponseBlock Called Repo Implementation');
      RestaurantProductsModel? resProductsResponse;
      if (await connectionChecker.hasConnection) {
        resProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .downloadResProduct(languageId);
      }

      return Right(resProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShoppingProductsModel>> fetchCatalogueProduct(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('ShoppingProductsResponseBlock Called Repo Implementation');
      ShoppingProductsModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .fetchCatalogueProduct(languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> shoppingUpdate(
      List item, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('shoppingListUpdateResponseBlock Called Repo Implementation');
      ResetPasswordOTPModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .shoppingUpdate(item, languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShoppingListDataModel>> fetchShoppingList(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('shoppingUpdateResponseBlock Called Repo Implementation');
      ShoppingListDataModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .fetchShoppingList(languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShoppingOutletModel>> fetchShoppingOutlets(
      List item, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('shoppingOutlet ResponseBlock Called Repo Implementation');
      ShoppingOutletModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .fetchShoppingOutlets(item, languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SasMoveShoppingListModel>> sasMoveShoppingListtoCart(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('SasMoveShoppingList Response Block Called Repo Implementation');
      SasMoveShoppingListModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .sasMoveShoppingListtoCart(languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> moveShoppingListToCart(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('shoppingUpdateResponseBlock Called Repo Implementation');
      ResetPasswordOTPModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .moveShoppingListToCart(languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BarcodeScannerModel>> fetchBarcodeScan(
      String itemCode, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('BarCode Scanner Response Block Called Repo Implementation');
      BarcodeScannerModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .fetchBarcodeScan(itemCode, languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> updateShopAtStore(
      List productItem, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('BarCode Scanner Response Block Called Repo Implementation');
      ResetPasswordOTPModel? shoppingProductsResponse;
      if (await connectionChecker.hasConnection) {
        shoppingProductsResponse = await ShopCouponRemoteDataSourceImpl()
            .updateShopAtStore(productItem, languageId);
      }

      return Right(shoppingProductsResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SasResponseModel>> shopAtStoreInitiate() async {
    try {
      // if(SHOW_DEBUGGING)
      print('SasResponseModel Response Block Called Repo Implementation');
      SasResponseModel? SasResponse;
      if (await connectionChecker.hasConnection) {
        SasResponse =
            await ShopCouponRemoteDataSourceImpl().shopAtStoreInitiate();
      }

      return Right(SasResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
