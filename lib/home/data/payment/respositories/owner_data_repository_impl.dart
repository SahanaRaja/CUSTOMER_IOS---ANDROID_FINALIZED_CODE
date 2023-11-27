import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/payment/models/add_tips_model/add_tips_model.dart';
import 'package:customer_assist/home/domain/payment/repositories/payment_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';

import '../datasources/payment_data_remote_data_source.dart';
import '../models/loyalty_points_model/loyalty_points_model.dart';
import '../models/update_payment_review_model/update_payment_review_model.dart';

class PaymentDataRepositoryImpl implements PaymentDataRepository {
  @override
  Future<Either<Failure, AddTipsModel>> fetchCartAddCharge(
      String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Add Tips Block Called Repo Implementation');
      AddTipsModel addTipResponse = const AddTipsModel();
      if (await connectionChecker.hasConnection) {
        addTipResponse = await PaymentDataRemoteDataSourceImpl()
            .fetchCartAddCharge(languageId);
      }

      return Right(addTipResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UpdatePaymentReviewModel>> fetchUpdateProductDetails(
      List paymentReview, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Update Product Details Block Called Repo Implementation');
      UpdatePaymentReviewModel addTipResponse =
          const UpdatePaymentReviewModel();
      if (await connectionChecker.hasConnection) {
        addTipResponse = await PaymentDataRemoteDataSourceImpl()
            .fetchUpdateProductDetails(paymentReview, languageId);
      }

      return Right(addTipResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoyaltyPointsModel>> fetchLoyaltyPoints(
      String totalAmount, String languageId) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('fetchLoyaltyPoints Details Block Called Repo Implementation');
      LoyaltyPointsModel addTipResponse = const LoyaltyPointsModel();
      if (await connectionChecker.hasConnection) {
        addTipResponse = await PaymentDataRemoteDataSourceImpl()
            .fetchLoyaltyPoints(totalAmount, languageId);
      }

      return Right(addTipResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResetPasswordOTPModel>> addFamilyMenbers(
      String firstName,
      String lastName,
      String email,
      String relation,
      String sameAddr,
      String postal,
      String addr1,
      String addr2,
      String province,
      String city,
      String locality,
      String country) async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Add family Members Details Block Called Repo Implementation');
      ResetPasswordOTPModel addFamilyResponse = const ResetPasswordOTPModel();
      if (await connectionChecker.hasConnection) {
        addFamilyResponse = await PaymentDataRemoteDataSourceImpl()
            .addFamilyMenbers(firstName, lastName, email, relation, sameAddr,
                postal, addr1, addr2, province, city, locality, country);
      }

      return Right(addFamilyResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
