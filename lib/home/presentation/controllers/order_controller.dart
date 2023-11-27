import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/orders/models/old_order_response_model/old_order_response_model.dart';
import 'package:customer_assist/home/data/orders/models/order_response_model/order_response_model.dart';
import 'package:customer_assist/home/data/orders/models/pending_order_models/item.dart';
import 'package:customer_assist/home/data/orders/models/pending_response/item.dart';
import 'package:customer_assist/home/data/orders/models/pending_response/pending_response_model.dart';
import 'package:customer_assist/home/data/orders/models/review_store_model/review_store_model.dart';
import 'package:customer_assist/home/data/orders/models/store_review_model/store_review_model.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../data/orders/models/old_order_response_model/order.dart';
import '../../data/orders/models/pending_order_models/pending_order_models.dart';
import '../../data/orders/models/review_store_model/status.dart';
import '../../data/orders/models/share_model/share_page.dart';
import '../../data/orders/models/store_review_model/review_desc.dart';
import '../../data/orders/models/whish_list_model/item.dart';
import '../../data/orders/models/whish_list_model/whish_list_model.dart';
import '../../data/orders/repositories/order_repository_impl.dart';
import '../../data/shopcoupon/models/shopping_outlet_model/item.dart';
import 'header_controller.dart';
import 'keyboard_controller.dart';
import 'loading_controller.dart';
import 'options_controller.dart';

class OrderController extends GetxController {
  ViewController viewController = Get.find();
  OptionsController optionController = Get.find();
  KeyboardController keyboardController = Get.put(KeyboardController());
  LoadingController loadingController = Get.find();
  HeaderController headerController = Get.find();
  ShopController shopController = Get.find();
  LanguageController languageController = Get.find();
  var pendingOrdersResponse = <Shops>[].obs;
  var pendingOutletResponse = <Shops>[].obs;
  var whishlistResponse = <WhishItems>[].obs;
  var myOrderResponse = <Orders>[].obs;
  var fetchStoreReviewResponse = <ReviewDesc>[].obs;
  var fetchShareResponse = const ShareModel().obs;
  var fetchProductReviewResponse = <ReviewDesc>[].obs;
  var subscriptionResponse = const Status().obs;
  var deliveryCodeRespone = const OrderResponseModel().obs;
  var pendingEditsResponse = <Items>[].obs;
  var myOrderEditResponse = <Orders>[].obs;
  var myOrderPendingResponse = <Orders>[].obs;
  var whishlistEditResponse = <WhishItems>[].obs;

  var selectedList = [].obs;
  var whishlistAddCart = <WhishItems>[].obs;
  var shoppingtocart = <Item>[].obs;
  List pendingOutlets = [].obs;

// void amount(String value)async{
//    value = await Prefs.orderAmount;

// }
  void fetchPendingOrders(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, PendingOrderModels> failureOrSuccessMessage =
        await OrderRepositoryImpl().pendingOrders(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  void pendingUpdate(List<dynamic> productcode, String languageId) async {
    //List<dynamic> products,List<dynamic> quantity,
    loadingController.setLoading(true);

    Either<Failure, PendingOrderModels> failureOrSuccessMessage =
        await OrderRepositoryImpl().pendingUpdate(productcode, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStatependingUpdate(failureOrSuccessMessage);
  }

  void fetchmyPendingOutlet(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, PendingResponseModels> failureOrSuccessMessage =
        await OrderRepositoryImpl().pendingOutlets(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStatemyPendingOutlet(failureOrSuccessMessage);
  }

  void fetchWhishList(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, WhishListModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().whishlist(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateWhishlist(failureOrSuccessMessage);
  }

  void whishListUpdate(
      String productCode, String status, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await OrderRepositoryImpl()
            .whishListUpdate(productCode, status, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateWhishlistUpdate(failureOrSuccessMessage);
  }

  void orderInsertNew(String orderReferId, String payCode, String discount,
      String covenience, String amount, String tipAmount) async {
    loadingController.setLoading(true);

    Either<Failure, OrderResponseModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().orderInsertNew(
            orderReferId, payCode, discount, covenience, amount, tipAmount);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateOrderInsert(failureOrSuccessMessage);
  }

  void fetchmyOrders(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, OldOrderResponseModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().myOrders(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStatemyOrder(failureOrSuccessMessage);
  }

  void fetchstoreReview(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, StoreReviewModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().fetchstoreReview(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateStoreReview(failureOrSuccessMessage);
  }

  void updatestoreReview(String instruction, String remark, String reviewid,
      String ratings, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, StoreReviewModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().updateCustomerReviewStore(
            instruction, remark, reviewid, ratings, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateStoreReviewUpdate(failureOrSuccessMessage);
  }

  void updateProductReview(String productcode, String instruction,
      String remark, String reviewid, String ratings, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, StoreReviewModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().updateCustomerReviewProduct(
            productcode, instruction, remark, reviewid, ratings, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateStoreReviewUpdate(failureOrSuccessMessage);
  }

  void fetchShare() async {
    loadingController.setLoading(true);

    Either<Failure, ShareModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().fetchShare();
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShare(failureOrSuccessMessage);
  }

  void updateShare(
    String mobile,
    String friendmobile,
  ) async {
    loadingController.setLoading(true);

    Either<Failure, ShareModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().fetchShareUpdate(mobile, friendmobile);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShareUpdate(failureOrSuccessMessage);
  }

  void fetchProductReview(String productcode, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, StoreReviewModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().fetchProductReview(productcode, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateProductReview(failureOrSuccessMessage);
  }

  //Fetch Subscription
  void fetchMySubscription(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ReviewStoreModel> failureOrSuccessMessage =
        await OrderRepositoryImpl().fetchMySubscription(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateSubscription(failureOrSuccessMessage);
  }

  //Update Subscription
  void updateMysubscription(String subscriptionType, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await OrderRepositoryImpl()
            .updateMysubscription(subscriptionType, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateSubscriptionUpdate(failureOrSuccessMessage);
  }

  void _eitherErrorOrSuccessState(
      Either<Failure, PendingOrderModels> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {
        // error.value = 'Login failed';
        // viewController.setView(ERROR);
        // viewController.setErrorMessage(l.obs!);
      },
      (r) async {
        if (r.status!.result == 1) {
          pendingEditsResponse.value = r.status!.items!;
          viewController.setView(PENDINGEDIT);
          // viewController.setSubUserOption(PENDINGORDERS);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStatependingUpdate(
      Either<Failure, PendingOrderModels> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
         if (r.status!.result! == 1) {
          //pendingUpdateResponse.value = r;
          // shopController.downloadRestaurantProduct(
          //     languageController.languagenum.toString());
        } else {
          viewController.setErrorMessage(r.status!.message!);
          viewController.setView(ERROR);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateWhishlist(
      Either<Failure, WhishListModel> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          whishlistResponse.value = r.status!.favProduct![0].items!;
          viewController.setView(WISHLISTEDIT);
          //viewController.setSubUserOption(WHISHLIST);
          optionController.setSetState();
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStatemyOrder(
      Either<Failure, OldOrderResponseModel> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          myOrderResponse.value = r.status!.order!;

          viewController.setView(OLDORDERS);

          //viewController.setSubUserOption(OLDORDERS);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStatemyPendingOutlet(
      Either<Failure, PendingResponseModels> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
           pendingOutletResponse.value = r.status!.shop!;
          pendingOrdersResponse.value = r.status!.shop!;

          viewController.setView(PENDINGORDERS);

          //viewController.setSubUserOption(OLDORDERS);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateWhishlistUpdate(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.result == 1) {
          // viewController.setView(S);
          // optionController.setSetState();
          // shopController.downloadRestaurantProduct(
          //     languageController.languagenum.toString());
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateStoreReview(
      Either<Failure, StoreReviewModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          fetchStoreReviewResponse.value = r.status!.reviewDesc!;
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateStoreReviewUpdate(
      Either<Failure, StoreReviewModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          //  viewController.setView(SUCCESS);
          // viewController.setSuccessMessage('Succ');
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateProductReview(
      Either<Failure, StoreReviewModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          fetchProductReviewResponse.value = r.status!.reviewDesc!;
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateSubscription(
      Either<Failure, ReviewStoreModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          subscriptionResponse.value = r.status!;
          viewController.setView(SERVICECHARGES);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateSubscriptionUpdate(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.result == 1) {
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateOrderInsert(
      Either<Failure, OrderResponseModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          deliveryCodeRespone.value = r;
          viewController.setView(ORDERCONFIRMATION);
          headerController.setSubHeaderLabel(ORDERCONFIRMATION);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShare(
      Either<Failure, ShareModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          fetchShareResponse.value = r;
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShareUpdate(
      Either<Failure, ShareModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          viewController.setView(SUCCESS);
          viewController.setSuccessMessage(r.status!.message!);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }
}
