import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/orders/models/order_response_model/order_response_model.dart';
import 'package:customer_assist/home/data/orders/models/pending_order_models/pending_order_models.dart';
import 'package:customer_assist/home/data/orders/models/review_store_model/review_store_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/orders/models/old_order_response_model/old_order_response_model.dart';
import '../../data/orders/models/share_model/share_page.dart';
import '../../data/orders/models/store_review_model/store_review_model.dart';
import '../../data/orders/models/whish_list_model/whish_list_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderResponseModel>> orderInsertNew(
      String orderReferId,
      String payCode,
      String discount,
      String covenience,
      String amount,
      String tipAmount);
  Future<Either<Failure, PendingOrderModels>> pendingOrders(String languageId);
  Future<Either<Failure, OldOrderResponseModel>> myOrders(String languageId);
  Future<Either<Failure, WhishListModel>> whishlist(String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> whishListUpdate(
      String productCode, String status, String languageId);
  Future<Either<Failure, StoreReviewModel>> fetchstoreReview(String languageId);
  Future<Either<Failure, StoreReviewModel>> fetchProductReview(
      String productCode, String languageId);
  Future<Either<Failure, ReviewStoreModel>> fetchMySubscription(
      String languageId);
  Future<Either<Failure, ResetPasswordOTPModel>> updateMysubscription(
      String subscriptionType, String languageId);

      Future<Either<Failure, ShareModel>> fetchShare();
       Future<Either<Failure, ShareModel>> fetchShareUpdate(String mobile,String friendmobile);
}
