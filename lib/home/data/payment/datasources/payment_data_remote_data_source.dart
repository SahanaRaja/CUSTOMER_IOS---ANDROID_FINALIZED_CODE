import 'dart:convert';

import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/payment/models/add_tips_model/add_tips_model.dart';
import 'package:customer_assist/home/data/payment/models/loyalty_points_model/loyalty_points_model.dart';
import 'package:customer_assist/home/data/payment/models/update_payment_review_model/update_payment_review_model.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';

abstract class PaymentDataRemoteDataSource {
  Future<AddTipsModel> fetchCartAddCharge(String languageId);
  Future<UpdatePaymentReviewModel> fetchUpdateProductDetails(
      List productValues, String languageId);
  Future<LoyaltyPointsModel> fetchLoyaltyPoints(
      String totalAmount, String languageId);
  Future<ResetPasswordOTPModel> addFamilyMenbers(
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
      String country);
}

class PaymentDataRemoteDataSourceImpl extends PaymentDataRemoteDataSource {
  //FETCH TIPS

  @override
  Future<AddTipsModel> fetchCartAddCharge(String languageId) async {
    String jsonRequestBody;
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
//if (optionsController.outlet == '57') {
  //${await Prefs.shopId}
  jsonRequestBody =
        '{"CustomerId":"${await Prefs.customerID}","ShopId":"${await Prefs.shopId}","LANGUAGEID":"$languageId"}';
// }else{
//     jsonRequestBody =
//         '{"CustomerId":"${await Prefs.customerID}","ShopId":"335","LANGUAGEID":"$languageId"}';
// }
    response = await http.post(Uri.parse(FETCH_CART_ADD_CHARGE),
        headers: headers, body: jsonRequestBody);

    print("fetchCartResponseBody: ${response.body}");
    print("fetchCartRequestBody: $jsonRequestBody");

    try {
      if (response.statusCode == 200) {
        print('Response fetchCart Found');
        print(AddTipsModel.fromJson(response.body));
        return AddTipsModel.fromJson(response.body);
      } else if (response.statusCode == 401) {
        print('Response fetchCart Not Found');
        return AddTipsModel.fromJson(json.decode(response.body));
      } else {
        print('fetchCartBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

//FETCH LOYALTY POINTS
  @override
  Future<LoyaltyPointsModel> fetchLoyaltyPoints(
      String totalAmount, String languageId) async {
    String jsonRequestBody;
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
        '	{"Customer_Id":"${await Prefs.customerID}","Bill_Amount":"$totalAmount" ,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCH_LOYALTY),
        headers: headers, body: jsonRequestBody);

    print("fetchLoyaltyPointsResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response fetchLoyaltyPoints Found');
        print(LoyaltyPointsModel.fromJson(response.body));
        return LoyaltyPointsModel.fromJson(response.body);
      } else if (response.statusCode == 401) {
        print('Response fetchLoyaltyPoints Not Found');
        return LoyaltyPointsModel.fromJson(response.body);
      } else {
        print('fetchLoyaltyPointsBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  OptionsController optionsController = Get.find();

  @override
  Future<UpdatePaymentReviewModel> fetchUpdateProductDetails(
      List productValues, String languageId) async {
    String jsonRequestBody;
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
    //if (optionsController.outlet == '57') {
  //${await Prefs.shopId}
  jsonRequestBody =
        '	{"CUSTOMER_ID":"${await Prefs.customerID}","SHOP_ID":"${await Prefs.shopId}","BAG_QTY":"0","COUPON":"0","PRODUCTS":$productValues}';
// }else{
//     jsonRequestBody =
//         '	{"CUSTOMER_ID":"${await Prefs.customerID}","SHOP_ID":"335","BAG_QTY":"0","COUPON":"0","PRODUCTS":$productValues}';
// }

    // jsonRequestBody =
    //     '	{"CUSTOMER_ID":"${await Prefs.customerID}","SHOP_ID":"${await Prefs.shopId}","BAG_QTY":"0","COUPON":"0","PRODUCTS":$productValues}';

    response = await http.post(Uri.parse(FETCH_UPDATE_PRODUCT_DETAILS),
        headers: headers, body: jsonRequestBody);

    print("AddressResponseBody: $jsonRequestBody");
    print("AddressResponseBody: ${response.body}");

    try {
      if (response.statusCode == 200) {
        print('Response Address Found');
        print(UpdatePaymentReviewModel.fromJson(response.body));
        return UpdatePaymentReviewModel.fromJson(response.body);
      } else if (response.statusCode == 401) {
        print('Response Address Not Found');
        return UpdatePaymentReviewModel.fromJson(response.body);
      } else {
        print('AddressBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> addFamilyMenbers(
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
    String jsonRequestBody;
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
        '{"Customer_Id":"${await Prefs.customerID}", "FIRST_NAME":"$firstName", "LAST_NAME":"$lastName","EMAIL":"$email", "MOBILE_NO_1":"+91", "MOBILE_NO_2":"96008","MOBILE_NO_3":"78575", "os":"I", "RELATION":"$relation" ,"SALUTATION":"Mr", "ADDRESS_1":"$addr1", "ADDRESS_2":"$addr2","COUNTRY":"$country", "PROVINCE":"$province","CITY":"$city", "POSTAL_CODE":"$postal", "LOCALITY":"$locality","SAMEADDRESS":"$sameAddr" }';

    response = await http.post(Uri.parse(ADDFAMILY),
        headers: headers, body: jsonRequestBody);

    print("AddFamilyAddressResponseBody: $jsonRequestBody");
    print("AddFamilyAddressResponseBody: ${response.body}");

    try {
      if (response.statusCode == 200) {
        print('Response AddFamilyAddress Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        print('Response AddFamilyAddress Not Found');
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('AddFamilyAddressBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
