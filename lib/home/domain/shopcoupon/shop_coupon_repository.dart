import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/barcode_scanner_model/barcode_scanner_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/coupon_company/coupon_company.dart';
import 'package:customer_assist/home/data/shopcoupon/models/sas_move_shopping_list_model/sas_move_shopping_list_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/sas_response_model/sas_response_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shop_coupon_model/shop_coupon_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/RrestaurantItem.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/shopping_products_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/shopcoupon/models/addons.dart/addonmodel.dart';
import '../../data/shopcoupon/models/company_offer/company_offer.dart';
import '../../data/shopcoupon/models/shopping_list_data_model/shopping_list_data_model.dart';
import '../../data/shopcoupon/models/shopping_outlet_model/shopping_outlet_model.dart';

abstract class ShopCouponRepository {
  Future<Either<Failure, RestaurantProductsModel>> downloadResProduct(
      String languageId);
  Future<Either<Failure, ShopCouponModel>> fetchAdvertisercouponhead();
  Future<Either<Failure, CouponCompany>> fetchCompanyCoupon(String languageId);
  Future<Either<Failure, CompanyOffer>> fetchCompanyCustomerOffer(
      List promo, String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> updateCustomerCoupon(
      List coupon, String languageId);
  Future<Either<Failure, ShoppingProductsModel>> downloadShoppingProduct(
      String languageId);
  Future<Either<Failure, ShoppingProductsModel>> fetchCatalogueProduct(
      String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> shoppingUpdate(
      List item, String languageId);
  Future<Either<Failure, ShoppingListDataModel>> fetchShoppingList(
      String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> moveShoppingListToCart(
      String languageId);
  Future<Either<Failure, SasMoveShoppingListModel>> sasMoveShoppingListtoCart(
      String languageId);
  Future<Either<Failure, ShoppingOutletModel>> fetchShoppingOutlets(
      List item, String languageId);
  Future<Either<Failure, BarcodeScannerModel>> fetchBarcodeScan(
      String itemCode, String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> updateShopAtStore(
      List productItem, String languageId);
  Future<Either<Failure, SasResponseModel>> shopAtStoreInitiate();
  Future<Either<Failure, AddOnsModel>> addOnsItem(String productcode,String languageId);
}
