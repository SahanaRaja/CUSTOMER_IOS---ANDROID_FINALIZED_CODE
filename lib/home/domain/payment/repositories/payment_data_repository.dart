import 'package:customer_assist/home/data/payment/models/add_tips_model/add_tips_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../data/payment/models/loyalty_points_model/loyalty_points_model.dart';
import '../../../data/payment/models/update_payment_review_model/update_payment_review_model.dart';

abstract class PaymentDataRepository {
  Future<Either<Failure, AddTipsModel>> fetchCartAddCharge(String languageId);
  Future<Either<Failure, UpdatePaymentReviewModel>> fetchUpdateProductDetails(
      List paymentReview, String languageId);
  Future<Either<Failure, LoyaltyPointsModel>> fetchLoyaltyPoints(
      String totalAmount, String languageId);
}
