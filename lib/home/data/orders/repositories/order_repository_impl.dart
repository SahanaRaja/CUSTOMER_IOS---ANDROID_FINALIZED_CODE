import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/orders/models/order_response_model/order_response_model.dart';
import 'package:customer_assist/home/data/orders/models/pending_response/pending_response_model.dart';
import 'package:customer_assist/home/data/orders/models/review_store_model/review_store_model.dart';
import 'package:customer_assist/home/data/orders/models/store_review_model/store_review_model.dart';
import 'package:customer_assist/home/data/orders/models/whish_list_model/whish_list_model.dart';
import 'package:customer_assist/home/domain/order/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/order_remote_data_source.dart';
import '../models/old_order_response_model/old_order_response_model.dart';
import '../models/pending_order_models/pending_order_models.dart';
import '../models/share_model/share_page.dart';

class OrderRepositoryImpl extends OrderRepository {
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  @override
  Future<Either<Failure, PendingOrderModels>> pendingOrders(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('pendingOrderResponseBlock Called Repo Implementation');
      PendingOrderModels? pendingOrderResponse;
      if (await connectionChecker.hasConnection) {
        pendingOrderResponse =
            await OrdersRemoteDataSourceImpl().pendingOrders(languageId);
      }

      return Right(pendingOrderResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
   Future<Either<Failure, PendingOrderModels>> pendingUpdate(
      List products ,String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('pendingUpdateResponseBlock Called Repo Implementation');
      PendingOrderModels? pendingUpdateResponse;
      if (await connectionChecker.hasConnection) {
        pendingUpdateResponse =
            await OrdersRemoteDataSourceImpl().pendingUpdate(products,languageId);
      }

      return Right(pendingUpdateResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, PendingResponseModels>> pendingOutlets(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('PendingOutletResponseBlock Called Repo Implementation');
      PendingResponseModels? PendingOutletResponse;
      if (await connectionChecker.hasConnection) {
        PendingOutletResponse =
            await OrdersRemoteDataSourceImpl().pendingOutlet(languageId);
      }

      return Right(PendingOutletResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, WhishListModel>> whishlist(String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('WhishListResponseBlock Called Repo Implementation');
      WhishListModel? WhishListResponse;
      if (await connectionChecker.hasConnection) {
        WhishListResponse =
            await OrdersRemoteDataSourceImpl().whishlist(languageId);
      }

      return Right(WhishListResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> whishListUpdate(
      String productCode, String status, String languageId) async {
    try {
      print('whishlistupdateResponseBlock Called Repo Implementation');
      ResetPasswordOTPModel? whishlistupdateResponse;
      if (await connectionChecker.hasConnection) {
        whishlistupdateResponse = await OrdersRemoteDataSourceImpl()
            .whishListUpdate(productCode, status, languageId);
      }

      return Right(whishlistupdateResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OldOrderResponseModel>> myOrders(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('OldOrderResponseBlock Called Repo Implementation');
      OldOrderResponseModel? OldOrderResponse;
      if (await connectionChecker.hasConnection) {
        OldOrderResponse =
            await OrdersRemoteDataSourceImpl().myOrder(languageId);
      }

      return Right(OldOrderResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderResponseModel>> orderInsertNew(
      String orderReferId,
      String payCode,
      String discount,
      String covenience,
      String amount,
      String tipAmount) async {
    try {
      // if(SHOW_DEBUGGING)
      print('OrderResponseModel Called Repo Implementation');
      OrderResponseModel? orderResponse;
      if (await connectionChecker.hasConnection) {
        orderResponse = await OrdersRemoteDataSourceImpl().orderInsertNew(
            orderReferId, payCode, discount, covenience, amount, tipAmount);
      }

      return Right(orderResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StoreReviewModel>> fetchstoreReview(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('pendingOrderResponseBlock Called Repo Implementation');
      StoreReviewModel? StoreReviewResponse;
      if (await connectionChecker.hasConnection) {
        StoreReviewResponse =
            await OrdersRemoteDataSourceImpl().fetchStoreReview(languageId);
      }

      return Right(StoreReviewResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

   @override
  Future<Either<Failure, StoreReviewModel>> updateCustomerReviewStore(
      String instruction,String remark,String reviewid,String ratings,String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('ReviewStoreResponseBlock Called Repo Implementation');
      StoreReviewModel? StoreReviewResponse;
      if (await connectionChecker.hasConnection) {
        StoreReviewResponse =
            await OrdersRemoteDataSourceImpl().updateCustomerReviewStore(instruction,remark,reviewid,ratings,languageId);
      }

      return Right(StoreReviewResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
   @override
  Future<Either<Failure, StoreReviewModel>> updateCustomerReviewProduct(
    String productcode,  String instruction,String remark,String reviewid,String ratings,String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('ReviewStoreResponseBlock Called Repo Implementation');
      StoreReviewModel? ProductReviewResponse;
      if (await connectionChecker.hasConnection) {
        ProductReviewResponse =
            await OrdersRemoteDataSourceImpl().updateCustomerReviewProduct(productcode,instruction,remark,reviewid,ratings,languageId);
      }

      return Right(ProductReviewResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
   @override
  Future<Either<Failure, ShareModel>> fetchShare() async {
    try {
      // if(SHOW_DEBUGGING)
      print('ReviewStoreResponseBlock Called Repo Implementation');
      ShareModel? ShareResponse;
      if (await connectionChecker.hasConnection) {
        ShareResponse =
            await OrdersRemoteDataSourceImpl().fetchShare();
      }

      return Right(ShareResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, ShareModel>> fetchShareUpdate(String mobile,String friendmobile,) async {
    try {
      // if(SHOW_DEBUGGING)
      print('ReviewStoreResponseBlock Called Repo Implementation');
      ShareModel? ShareResponse;
      if (await connectionChecker.hasConnection) {
        ShareResponse =
            await OrdersRemoteDataSourceImpl().fetchShareUpdate(mobile,friendmobile);
      }

      return Right(ShareResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StoreReviewModel>> fetchProductReview(
      String productCode, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('fetchProductReviewResponseBlock Called Repo Implementation');
      StoreReviewModel? StoreReviewResponse;
      if (await connectionChecker.hasConnection) {
        StoreReviewResponse = await OrdersRemoteDataSourceImpl()
            .fetchProductReview(productCode, languageId);
      }

      return Right(StoreReviewResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ReviewStoreModel>> fetchMySubscription(
      String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('fetchProductReviewResponseBlock Called Repo Implementation');
      ReviewStoreModel? StoreReviewResponse;
      if (await connectionChecker.hasConnection) {
        StoreReviewResponse =
            await OrdersRemoteDataSourceImpl().fetchMySubscription(languageId);
      }

      return Right(StoreReviewResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> updateMysubscription(
      String subscriptionType, String languageId) async {
    try {
      // if(SHOW_DEBUGGING)
      print('fetchProductReviewResponseBlock Called Repo Implementation');
      ResetPasswordOTPModel? StoreReviewResponse;
      if (await connectionChecker.hasConnection) {
        StoreReviewResponse = await OrdersRemoteDataSourceImpl()
            .updateMysubscription(subscriptionType, languageId);
      }

      return Right(StoreReviewResponse!);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
