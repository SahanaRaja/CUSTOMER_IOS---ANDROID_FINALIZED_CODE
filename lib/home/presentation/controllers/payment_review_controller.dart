import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/payment/models/add_tips_model/add_tips_model.dart';
import 'package:customer_assist/home/data/payment/models/loyalty_points_model/loyalty_points_model.dart';
import 'package:customer_assist/home/data/payment/respositories/owner_data_repository_impl.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../data/payment/models/loyalty_points_model/loyalty.dart';
import '../../data/payment/models/update_payment_review_model/update_payment_review_model.dart';
import 'header_controller.dart';
import 'loading_controller.dart';
import 'options_controller.dart';

class PaymentReviewController extends GetxController {
  ViewController viewController = Get.find();
  OptionsController optionController = Get.find();
  KeyboardController keyboardController = Get.put(KeyboardController());
  LoadingController loadingController = Get.find();
  HeaderController headerController = Get.find();
  var languageController = Get.put(LanguageController());
  var addTipsResponse = const AddTipsModel().obs;
  var updatePaymentResponse = const UpdatePaymentReviewModel().obs;
  var loyaltyResponse = <Loyalty>[].obs;
  int addTips = 0;
  double totalPrice = 0.0;
  double convenienceFee = 0.0;
  double discount = 0.0;
  int cashpaid = 0 ;

  setAddTip(int tip) {
    addTips = tip;
  }
  
  
  setCashPaid(int paid){
    cashpaid = paid;
  }

  setTotalPayable(double totalPrice) {
    totalPrice = totalPrice;
  }

  setConvenienceFee(double convenienceFee) {
    convenienceFee = convenienceFee;
  }

  setDiscount(double discount) {
    discount = discount;
  }

  void paymentReview(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, AddTipsModel> failureOrSuccessMessage =
        await PaymentDataRepositoryImpl().fetchCartAddCharge(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  void fetchUpdateProductDetails(
      List<dynamic> reviewUpdate, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, UpdatePaymentReviewModel> failureOrSuccessMessage =
        await PaymentDataRepositoryImpl()
            .fetchUpdateProductDetails(reviewUpdate, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateReview(failureOrSuccessMessage);
  }

  //fetchLoyaltyPoints
  void fetchLoyaltyPoints(String totalAmount, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, LoyaltyPointsModel> failureOrSuccessMessage =
        await PaymentDataRepositoryImpl()
            .fetchLoyaltyPoints(totalAmount, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateLoyaltyPoints(failureOrSuccessMessage);
  }

  void _eitherErrorOrSuccessState(
      Either<Failure, AddTipsModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
        viewController.setErrorMessage(
            languageController.languageResponse.value.somethingWentWrong ?? '');
      },
      (r) async {
        // print(r);
        // userDetailDownloadController.fetchUsers(
        //     r.tokenNo!, 'A', await Prefs.shopId);
        if (r.status!.result! == 1) {
          addTipsResponse.value = r;
          viewController.setView(ADDTIP);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateReview(
      Either<Failure, UpdatePaymentReviewModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
        viewController.setErrorMessage(
            languageController.languageResponse.value.somethingWentWrong ?? '');
      },
      (r) async {
        // print(r);
        // userDetailDownloadController.fetchUsers(
        //     r.tokenNo!, 'A', await Prefs.shopId);
        if (r.status!.result! == 1) {
          updatePaymentResponse.value = r;
          Prefs.setOrderID(r.status!.items!.orderReferenceId!);
          viewController.setView(REVIEWPAYMENT);
          // viewController.setView(ADDTIP);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateLoyaltyPoints(
      Either<Failure, LoyaltyPointsModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
        viewController.setErrorMessage("Something Went Wrong!");
      },
      (r) async {
        if (r.status!.result! == 1) {
          loyaltyResponse.value = r.status!.loyalty!;
          viewController.setView(LOYALTYPOINTS);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }
}
