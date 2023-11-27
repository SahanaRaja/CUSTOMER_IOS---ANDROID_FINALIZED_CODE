// ignore_for_file: avoid_renaming_method_parameters

import 'dart:convert';

import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/orders/models/pending_order_models/pending_order_models.dart';
import 'package:customer_assist/home/data/orders/models/pending_response/pending_response_model.dart';
import 'package:customer_assist/home/data/orders/models/store_review_model/store_review_model.dart';
import 'package:customer_assist/home/data/orders/models/whish_list_model/whish_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';
import '../models/old_order_response_model/old_order_response_model.dart';
import '../models/order_response_model/order_response_model.dart';
import '../models/review_store_model/review_store_model.dart';
import '../models/share_model/share_page.dart';

abstract class OrdersRemoteDataSource {
  Future<OrderResponseModel> orderInsertNew(String orderReferId, String payCode,
      String discount, String covenience, String amount, String tipAmount);

  Future<PendingOrderModels> pendingOrders(String languageId);
  Future<PendingResponseModels> pendingOutlet(String languageId);
  Future<WhishListModel> whishlist(String languageId);
  Future<StoreReviewModel> fetchStoreReview(String languageId);
  Future<ResetPasswordOTPModel> whishListUpdate(
      String productCode, String status, String languageId);
  Future<PendingOrderModels> pendingUpdate(
      List products,String languageId);
  Future<ResetPasswordOTPModel> updateMysubscription(
      String subscriptionType, String languageId);
}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  @override
  Future<PendingOrderModels> pendingOrders(String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
     //if(optionsController.outlet == '57'){
      jsonRequestBody =
     
     '{"CUSTOMER_ID":"${await Prefs.customerID}", "SHOP_ID":"${await Prefs.shopId}","LANGUAGEID":"$languageId" }';

//     }else{
// jsonRequestBody =
     
//      '{"CUSTOMER_ID":"${await Prefs.customerID}", "SHOP_ID":"335","LANGUAGEID":"$languageId" }';
//     }
    
    //'{"CUSTOMER_ID":"${await Prefs.customerID}", "SHOP_ID":"${await Prefs.shopId}","LANGUAGEID":"$languageId" }';

    response = await http.post(Uri.parse(FETCH_PENDINGORDERS),
        headers: headers, body: jsonRequestBody);

    print("PendingOrdersRequesteBody: $jsonRequestBody");
    print("PendingOrdersResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response PendingOrdersResponse Found');
        print(PendingOrderModels.fromJson(response.body));
        return PendingOrderModels.fromJson(response.body);
      } else {
        print('PendingOrdersResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<PendingOrderModels> pendingUpdate(List products ,String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
         var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? ""; 
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo":NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
     
     '{"CUSTOMER_ID":"${await Prefs.customerID}", "SHOP_ID":"79","PRODUCTS":$products,"LANGUAGEID":"$languageId" }';
     //products

    response = await http.post(Uri.parse(FETCH_PENDINGUPDATE),
        headers: headers, body: jsonRequestBody);

     print("PendingUpdateRequestBody: $jsonRequestBody");
    print("PendingUpdateResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response PendingUpdateResponse Found');
        print(PendingOrderModels.fromJson(response.body));
        return PendingOrderModels.fromJson(response.body);
      } else {
        print('PendingUpdateResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
  @override
  Future<PendingResponseModels> pendingOutlet(String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{"CUSTOMER_ID":"${await Prefs.customerID}","LANGUAGEID":"$languageId" }';

    response = await http.post(Uri.parse(FETCH_PENDINOUTLET),
        headers: headers, body: jsonRequestBody);
    print("PendingOutletsRequestBody: $jsonRequestBody");

    print("PendingOutletsResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response PendingOutletsResponse Found');
        print(PendingOrderModels.fromJson(response.body));
        return PendingResponseModels.fromJson(response.body);
      } else {
        print('PendingOutletsBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<WhishListModel> whishlist(String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
   // if (optionsController.outlet == '57') {
      jsonRequestBody =
          '{"Customer_Id":"${await Prefs.customerID}" ,"Shop_Id":"${await Prefs.shopId}","LANGUAGEID":"$languageId"}';
    // } else {
    //   jsonRequestBody =
    //       '{"Customer_Id":"${await Prefs.customerID}" ,"Shop_Id":"335","LANGUAGEID":"$languageId"}';
    // }
    response = await http.post(Uri.parse(FETCH_WHISLIST),
        headers: headers, body: jsonRequestBody);

    print("WhishListResponseBody: ${response.body}");
    print("WhishListRequestBody: $jsonRequestBody");
    try {
      if (response.statusCode == 200) {
        print('Response WhishListResponse Found');
        print(WhishListModel.fromJson(response.body));
        return WhishListModel.fromJson(response.body);
      } else {
        print('WhishListsResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> whishListUpdate(
      String productCode, String status, String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    //if (optionsController.outlet == '57') {
      jsonRequestBody =
          '{ "Customer_Id":"${await Prefs.customerID}", "Shop_Id":"${await Prefs.shopId}", "Product_Selected":"$productCode", "Status":"$status", "os":"A" }" ,"LANGUAGEID":"$languageId"}';
    // } else {
    //   jsonRequestBody =
    //       '{ "Customer_Id":"${await Prefs.customerID}", "Shop_Id":"335", "Product_Selected":"$productCode", "Status":"$status", "os":"A" }" ,"LANGUAGEID":"$languageId"}';
    // }

    response = await http.post(Uri.parse(UPDATE_WHISHLIST),
        headers: headers, body: jsonRequestBody);

    print("WhishListResponseBody: ${response.body}");
    print("wishListJsonRequestBody: $jsonRequestBody");
    print('wishList');
    try {
      if (response.statusCode == 200) {
        print('Response WhishListResponse Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('WhishListResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  Future<OldOrderResponseModel> myOrder(String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{"Customer_Id":"${await Prefs.customerID}","LANGUAGEID":"$languageId" }';

    response = await http.post(Uri.parse(FETCH_MYORDER),
        headers: headers, body: jsonRequestBody);
    print("MyOrdersRequestBody: $jsonRequestBody");

    print("MyOrdersResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response MyOrdersResponse Found');
        print(OldOrderResponseModel.fromJson(response.body));
        return OldOrderResponseModel.fromJson(response.body);
      } else {
        print('MyOrderResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<OrderResponseModel> orderInsertNew(
      String orderReferId,
      String payCode,
      String discount,
      String covenience,
      String amount,
      String tipAmount) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    //if (optionsController.outlet == '57') {
      jsonRequestBody =
          '{"ORDER_ID":"${await Prefs.orderId}","OrderReferenceId":"$orderReferId","SHOP_ID":"${await Prefs.shopId}","SHOP_ZIPCODE":"","CUSTOMER_ID":"${await Prefs.customerID}", "TRAN_DATE":"${DateFormat('dd/MM/yyyy').format(DateTime.now())}","os":"A","DISCOUNT":"$discount","coupon_discount":"0","DELIVERY_TYPE":"H","delivery_speed":"", "PICKUP_DELIVERY_CHARGE_TYPE":"","PICKUP_DELIVERY_CHARGE":"0","CONVENIENCE_CHARGE":"$covenience","ROUND_OFF_AMT":0,"pickup_delivery_date":"${DateFormat('dd/MM/yyyy').format(DateTime.now())}", "pickup_delivery_time":"10:30-11:00","SHIP_NAME":"Test","SHIP_ADDRESS1":"", "SHIP_ADDRESS2":"","zip_code":"","CONTACT_NO_1":"123456","CONTACT_NO_2":"","CONTACT_NO_3":"","delivery_instructions":"","PAYMODE":[{"PAY_CODE":"$payCode", "AMOUNT_PAID":$amount}],"coupon_code":"","coupon_amount":"","payment_reference_id":"45463244","auth_code":"auth1234","LATITUDE":"${await Prefs.originalLatitute}","LONGITUDE":"${await Prefs.orginalLongitude}","TIP_AMOUNT":$tipAmount,"Material_kept_door":"0","Current_delivery_address_id":"1"}';
    // } else {
    //   jsonRequestBody =
    //       '{"ORDER_ID":"${await Prefs.orderId}","OrderReferenceId":"$orderReferId","SHOP_ID":"335","SHOP_ZIPCODE":"","CUSTOMER_ID":"${await Prefs.customerID}", "TRAN_DATE":"${DateFormat('dd/MM/yyyy').format(DateTime.now())}","os":"A","DISCOUNT":"$discount","coupon_discount":"0","DELIVERY_TYPE":"H","delivery_speed":"", "PICKUP_DELIVERY_CHARGE_TYPE":"","PICKUP_DELIVERY_CHARGE":"0","CONVENIENCE_CHARGE":"$covenience","ROUND_OFF_AMT":0,"pickup_delivery_date":"${DateFormat('dd/MM/yyyy').format(DateTime.now())}", "pickup_delivery_time":"10:30-11:00","SHIP_NAME":"Test","SHIP_ADDRESS1":"", "SHIP_ADDRESS2":"","zip_code":"","CONTACT_NO_1":"123456","CONTACT_NO_2":"","CONTACT_NO_3":"","delivery_instructions":"","PAYMODE":[{"PAY_CODE":"$payCode", "AMOUNT_PAID":$amount}],"coupon_code":"","coupon_amount":"","payment_reference_id":"45463244","auth_code":"auth1234","LATITUDE":"${await Prefs.originalLatitute}","LONGITUDE":"${await Prefs.orginalLongitude}","TIP_AMOUNT":$tipAmount,"Material_kept_door":"0","Current_delivery_address_id":"1"}';
    // }

    response = await http.post(Uri.parse(ORDERINSERTNEW),
        headers: headers, body: jsonRequestBody);
    print("OrderinsertNewRequest: $jsonRequestBody");

    print("OrderinsertNewResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response MyOrdersResponse Found');
        print(OrderResponseModel.fromJson(response.body));
        return OrderResponseModel.fromJson(response.body);
      } else {
        print('MyOrderResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<StoreReviewModel> fetchStoreReview(String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{"SHOP_ID":"${await Prefs.shopId}","Customer_Id":"${await Prefs.customerID}","order_id":"${await Prefs.orderId}","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCHSTOREREVIEW),
        headers: headers, body: jsonRequestBody);

    print("StoreReviewModelResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response StoreReviewModelResponse Found');
        print(StoreReviewModel.fromJson(response.body));
        return StoreReviewModel.fromJson(response.body);
      } else {
        print('StoreReviewModelResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  Future<StoreReviewModel> updateCustomerReviewStore(String instruction,
      String remark, String reviewid, String ratings, String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    //${await Prefs.orderId}
    jsonRequestBody =
        '{"SHOP_ID":"${await Prefs.shopId}","Customer_Id":"${await Prefs.customerID}","order_id":"1719","Review_instructions":"$instruction","Review_remark":"$remark","review":[{"review_id":"$reviewid","rating":"$ratings"}],"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(UPDATECUSTOMERREVIEWSTORE),
        headers: headers, body: jsonRequestBody);

    print("StoreReviewModelResponseBody: $jsonRequestBody");

    print("StoreReviewModelResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response StoreReviewModelResponse Found');
        print(StoreReviewModel.fromJson(response.body));
        return StoreReviewModel.fromJson(response.body);
      } else {
        print('StoreReviewModelResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  Future<StoreReviewModel> fetchProductReview(
      String productCode, String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{"SHOP_ID":"${await Prefs.shopId}","Customer_Id":"${await Prefs.customerID}","order_id":"${await Prefs.orderId}","product_code":"1002","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCHPRODUCTREVIEW),
        headers: headers, body: jsonRequestBody);

    print("fetchProductReviewResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response fetchProductReviewResponse Found');
        print(StoreReviewModel.fromJson(response.body));
        return StoreReviewModel.fromJson(response.body);
      } else {
        print('fetchProductReviewResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  Future<StoreReviewModel> updateCustomerReviewProduct(
      String productCode,
      String instruction,
      String remark,
      String reviewid,
      String ratings,
      String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    //${await Prefs.orderId}
    jsonRequestBody =
        '{"SHOP_ID":"${await Prefs.shopId}","Customer_Id":"${await Prefs.customerID}","order_id":"1719","product_code":"1002","Review_instructions":"4","Review_remark":"$remark","review":[{"review_id":"1","rating":"3"}],"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(UPDATEPRODUCTREVIEW),
        headers: headers, body: jsonRequestBody);

    print("ProductReviewModelRequestBody: $jsonRequestBody");

    print("ProductReviewModelResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response ProductReviewModelResponse Found');
        print(StoreReviewModel.fromJson(response.body));
        return StoreReviewModel.fromJson(response.body);
      } else {
        print('ProductReviewModelResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  Future<ShareModel> fetchShare() async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody = '{"Customer_Id":"${await Prefs.customerID}"}';

    response = await http.post(Uri.parse(FETCHSHAREAPP),
        headers: headers, body: jsonRequestBody);
    print("fetchShareRequestBody: $jsonRequestBody");
    print("fetchShareResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response fetchShareResponse Found');
        print(ShareModel.fromJson(response.body));
        return ShareModel.fromJson(response.body);
      } else {
        print('fetchShareResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  Future<ShareModel> fetchShareUpdate(
    String mobile,
    String friendmobile,
  ) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{"your_mobile":"${await Prefs.mobile}","friends_mobile":"$friendmobile","message":"Hi Kindly check This App" }';

    response = await http.post(Uri.parse(SHAREAPPDETAILS),
        headers: headers, body: jsonRequestBody);
    print("fetchShareRequestBody: $jsonRequestBody");
    print("fetchShareResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response fetchShareResponse Found');
        print(ShareModel.fromJson(response.body));
        return ShareModel.fromJson(response.body);
      } else {
        print('fetchShareResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  Future<ReviewStoreModel> fetchMySubscription(String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '	{"Customer_Id":"${await Prefs.customerID}","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCHMYSUBSCRIPTION),
        headers: headers, body: jsonRequestBody);

    print("fetchMySubscriptionResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response fetchMySubscriptionResponse Found');
        print(ReviewStoreModel.fromJson(response.body));
        return ReviewStoreModel.fromJson(response.body);
      } else {
        print('fetchMySubscriptionResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> updateMysubscription(
      String subscriptionType, String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '	{"CUSTOMER_ID":"${await Prefs.customerID}", "TRANSACTION_ID":"123456789", "TRANSACTION_STATUS":"SUCCESS","SUBSCRIPTION_TYPE":"$subscriptionType", "AUTO_ACTIVATION":"S","LANGUAGEID":"$languageId" }';

    response = await http.post(Uri.parse(UPDATESUBSCRIPTION),
        headers: headers, body: jsonRequestBody);

    print("updateMysubscriptionResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response updateMysubscriptionResponse Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('updateMysubscriptionResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}  //'{"CUSTOMER_ID":"58", "SHOP_ID":"6","LANGUAGEID":"$languageId" }';
