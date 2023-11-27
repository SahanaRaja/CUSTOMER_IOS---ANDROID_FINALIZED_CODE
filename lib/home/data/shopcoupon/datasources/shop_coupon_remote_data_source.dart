// ignore_for_file: avoid_renaming_method_parameters

import 'dart:convert';

import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/barcode_scanner_model/barcode_scanner_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/company_offer/company_offer.dart';
import 'package:customer_assist/home/data/shopcoupon/models/coupon_company/coupon_company.dart';
import 'package:customer_assist/home/data/shopcoupon/models/sas_response_model/sas_response_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_list_data_model/shopping_list_data_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_outlet_model/shopping_outlet_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/RrestaurantItem.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/product_item.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/shopping_products_model.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';
import '../models/addons.dart/addonmodel.dart';
import '../models/sas_move_shopping_list_model/sas_move_shopping_list_model.dart';
import '../models/shop_coupon_model/shop_coupon_model.dart';

abstract class ShopCouponRemoteDataSource {
  Future<RestaurantProductsModel> downloadResProduct(String languageId);
  Future<ShopCouponModel> fetchAdvertisercouponhead();
  Future<CouponCompany> fetchCompanyCoupon(String languageId);
  Future<CompanyOffer> fetchCompanyCustomerOffer(List promo, String languageId);
  Future<ShoppingProductsModel> downloadShoppingProduct(String languageId);
  Future<SasMoveShoppingListModel> sasMoveShoppingListtoCart(String languageId);
  Future<ShoppingProductsModel> fetchCatalogueProduct(String languageId);
  Future<ResetPasswordOTPModel> updateCustomerCoupon(
      List coupon, String languageId);
  Future<ResetPasswordOTPModel> shoppingUpdate(List items, String languageId);
  Future<ShoppingListDataModel> fetchShoppingList(String languageId);
  Future<ResetPasswordOTPModel> moveShoppingListToCart(String languageId);
  Future<ShoppingOutletModel> fetchShoppingOutlets(
      List item, String languageId);
  Future<ProductItem> downloadProductItem(String languageId);
  Future<BarcodeScannerModel> fetchBarcodeScan(
      String barcodeItems, String languageId);
  Future<ResetPasswordOTPModel> updateShopAtStore(
      List productItems, String languageId);
  Future<SasResponseModel> shopAtStoreInitiate();
  Future<AddOnsModel> addOnsItem(String productcode,String languageId);
}

class ShopCouponRemoteDataSourceImpl extends ShopCouponRemoteDataSource {
  OptionsController optionsController = Get.find();

  @override
  Future<ShopCouponModel> fetchAdvertisercouponhead() async {
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
    response = await http.get(Uri.parse(ADVERTISERCOUPON), headers: headers);

    print("AdvertiseResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response AdvertiseResponse Found');
        print(ShopCouponModel.fromJson(response.body));
        return ShopCouponModel.fromJson(response.body);
      } else {
        print('AdvertiseResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ProductItem> downloadProductItem(String search) async {
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
    if (optionsController.outlet == '63') {
      jsonRequestBody =
          '{"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID == 0 ? 0 : await Prefs.customerID}","search":"$search","ITEM_TYPE":"E"}';
      
    } else {//${await Prefs.shopId}
    jsonRequestBody =
          '{"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID == 0 ? 0 : await Prefs.customerID}","search":"$search","ITEM_TYPE":"A"}';
      
    }

    response = await http.post(Uri.parse(PRODUCTITEM),
        headers: headers, body: jsonRequestBody);

    print("ProductItemRequestbody: $jsonRequestBody");
    print("ProductItemResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response ProductItemResponseBody Found');
        print(ProductItem.fromJson(response.body));
        return ProductItem.fromJson(response.body);
      } else {
        print('ProductItemResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
@override
  Future<AddOnsModel> addOnsItem(String productcode,String languageId) async {
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
          '{"SHOP_ID":"${await Prefs.shopId}","PRODUCT_CODE":"$productcode","LANGUAGEID":"$languageId"}';
          //A2174
    response = await http.post(Uri.parse(FETCHADDONS),
        headers: headers, body: jsonRequestBody);

    print("AddonsRequestbody: $jsonRequestBody");
    print("AddonsResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response AddonsponseBody Found');
        print(AddOnsModel.fromJson(response.body));
        return AddOnsModel.fromJson(response.body);
      } else {
        print('AddonsBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }



  @override
  Future<RestaurantProductsModel> downloadResProduct(String search) async {
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
    //addedbysofiya
    //322
    //optionsController.outlet == '41' || optionsController.outlet == '202'
    if (optionsController.outlet == '63') {
      jsonRequestBody =
      '{"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID == 0 ? 0 : await Prefs.customerID}","TYPE":"A","ITEM_TYPE":"E"}';
         //${await Prefs.shopId} 
    } else {
      jsonRequestBody =
      '	{"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID == 0 ? 0 : await Prefs.customerID}","TYPE":"A","ITEM_TYPE":"A"}';
          
    }
    response = await http.post(Uri.parse(RESPRODUCT),
        headers: headers, body: jsonRequestBody);

    print("ProductResItem Request: $jsonRequestBody");
    print("ProductResItem ResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response ProductResItem Found');
        print(RestaurantProductsModel.fromJson(response.body));
        return RestaurantProductsModel.fromJson(response.body);
      } else {
        print('ProductResItemResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CouponCompany> fetchCompanyCoupon(String languageId) async {
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
        '{"Customer_Id": "${await Prefs.customerID}","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCHCOMPANYCOUPON),
        headers: headers, body: jsonRequestBody);

    print("CompanyCouponResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response CompanyCouponResponse Found');
        print(CouponCompany.fromJson(response.body));
        return CouponCompany.fromJson(response.body);
      } else {
        print('CompanyCouponResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CompanyOffer> fetchCompanyCustomerOffer(
      List promo, String languageId) async {
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
        '{"Customer_Id":"${await Prefs.customerID}","Promo":$promo,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCHCOMPANYCUSTOMEROFFER),
        headers: headers, body: jsonRequestBody);

    print("CompanyCouponOfferResponseBody: $jsonRequestBody");
    print("CompanyCouponOfferResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response CompanyCouponOfferResponse Found');
        print(CompanyOffer.fromJson(response.body));
        return CompanyOffer.fromJson(response.body);
      } else {
        print('CompanyCouponOfferResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> updateCustomerCoupon(
      List coupons, String languageId) async {
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
        '{"Customer_Id":"${await Prefs.customerID}","Coupon":$coupons,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(UPDATECUSTOMERCOUPON),
        headers: headers, body: jsonRequestBody);

    print("CompanyCouponOfferResponseBody: $jsonRequestBody");
    print("CompanyCouponOfferResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response CompanyCouponOfferResponse Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('CompanyCouponOfferResponseBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ShoppingProductsModel> downloadShoppingProduct(
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
      "TokenNo":NEWTOKEN
      //  TOKEN
    };

    jsonRequestBody =
        '{"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"0","TYPE":"A","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(SHOPPRODUCT),
        headers: headers, body: jsonRequestBody);

    print(": $jsonRequestBody");
    print("shoppingProductResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shoppingProductResponseBody Found');
        print(ShoppingProductsModel.fromJson(response.body));
        return ShoppingProductsModel.fromJson(response.body);
      } else {
        print('shoppingProductResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

// Shop At Store Shopping List

  @override
  Future<SasMoveShoppingListModel> sasMoveShoppingListtoCart(
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
      "TokenNo":NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{ "CUSTOMER_ID":"${await Prefs.customerID}","SHOP_ID":"${await Prefs.shopId}","LANGUAGEID":"$languageId" }';
    response = await http.post(Uri.parse(SASMOVESHOPPINGLISTTOCART),
        headers: headers, body: jsonRequestBody);

    print("shoppingList ResponseBody: $jsonRequestBody");
    print("shoppingList ResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shoppingList ResponseBody Found');
        print(SasMoveShoppingListModel.fromJson(response.body));
        return SasMoveShoppingListModel.fromJson(response.body);
      } else {
        print('shoppingList ResponseBody Block Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ShoppingProductsModel> fetchCatalogueProduct(String languageId) async {
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
        '{"CUSTOMER_ID":"${await Prefs.customerID}","PAGE_NO":1,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCH_CATALOGUE_PRODUCT),
        headers: headers, body: jsonRequestBody);

    print("shoppingProductResponseBody: $jsonRequestBody");
    print("shoppingProductResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shoppingProductResponseBody Found');
        print(ShoppingProductsModel.fromJson(response.body));
        return ShoppingProductsModel.fromJson(response.body);
      } else {
        print('shoppingProductResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  //shopinglistUpdate
  @override
  Future<ResetPasswordOTPModel> shoppingUpdate(
      List items, String languageId) async {
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
        '{"Customer_Id":"${await Prefs.customerID}", "os":"A", "items":$items ,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(SHOPPINGLISTUPDATE),
        headers: headers, body: jsonRequestBody);

    print("shoppingUpdateResponseBody: $jsonRequestBody");
    print("shoppingUpdateResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shoppingUpdateResponseBody Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('shoppingUpdateResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  //fetchShoppingList
  @override
  Future<ShoppingListDataModel> fetchShoppingList(String languageId) async {
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
        '	{"Customer_Id":"${await Prefs.customerID}","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCHSHOPPINGLIST),
        headers: headers, body: jsonRequestBody);

    print("shoppingfetchResponseBody: $jsonRequestBody");
    print("shoppingfetchResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shoppingfetchResponseBody Found');
        print(ShoppingListDataModel.fromJson(response.body));
        return ShoppingListDataModel.fromJson(response.body);
      } else {
        print('shoppingfetchResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  //MoveShoppingListtoCart
  @override
  Future<ResetPasswordOTPModel> moveShoppingListToCart(
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
      "TokenNo":NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{ "CUSTOMER_ID":"${await Prefs.customerID}","SHOP_ID":${await Prefs.shopId} ,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(MOVESHOPPINGLISTTOCART),
        headers: headers, body: jsonRequestBody);

    print("shoppingfetchResponseBody: $jsonRequestBody");
    print("shoppingfetchResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shoppingfetchResponseBody Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('shoppingfetchResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  //fetchShoppingOutlets
  @override
  Future<ShoppingOutletModel> fetchShoppingOutlets(
      List item, String languageId) async {
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
        '	{ "CUSTOMER_ID":"${await Prefs.customerID}","Longitude":${await Prefs.originalLatitute},"Latitude":${await Prefs.orginalLongitude},"items":$item,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCH_SHOPPING_OUTLET),
        headers: headers, body: jsonRequestBody);

    print("shoppingfetchOutlet Request: $jsonRequestBody");
    print("shoppingfetchOutlet ResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shoppingfetchOutlet ResponseBody Found');
        print(ShoppingOutletModel.fromJson(response.body));
        return ShoppingOutletModel.fromJson(response.body);
      } else {
        print('shoppingfetchOutlet ResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  //fetchBarcodeScanner
  @override
  Future<BarcodeScannerModel> fetchBarcodeScan(
      String barcodeItems, String languageId) async {
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
        '{"Shop_Id":"${await Prefs.shopId}","Item_Barcode":"$barcodeItems","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(SASBARCODESCAN),
        headers: headers, body: jsonRequestBody);

    print("fetchBarCode Request: $jsonRequestBody");
    print("fetchBarCode ResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response fetchBarcode ResponseBody Found');
        print(BarcodeScannerModel.fromJson(response.body));
        return BarcodeScannerModel.fromJson(response.body);
      } else {
        print('fetchBarCode ResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  //Update shop At store
  @override
  Future<ResetPasswordOTPModel> updateShopAtStore(
      List productItems, String languageId) async {
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
        '{ "CUSTOMER_ID":"${await Prefs.customerID}", "SHOP_ID":"${await Prefs.shopId}", "OS":"I","SHOPREFERENCEID":"${await Prefs.shopReference}","BAG_QTY":"0", "BAG_FEE":"1","PRODUCTS":$productItems }';

    response = await http.post(Uri.parse(UPDATESHOPATSTORE),
        headers: headers, body: jsonRequestBody);

    print("fetchBarCode Request: $jsonRequestBody");
    print("fetchBarCode ResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response fetchBarcode ResponseBody Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('fetchBarCode ResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  //SHOPATSTOREINITIATE
  @override
  Future<SasResponseModel> shopAtStoreInitiate() async {
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
        '{"CUSTOMER_ID":"${await Prefs.customerID}", "SHOP_ID":"${await Prefs.shopId}", "OS":"I" }';

    response = await http.post(Uri.parse(SHOPATSTOREINITIATE),
        headers: headers, body: jsonRequestBody);

    print("shopAtStore Request: $jsonRequestBody");
    print("shopAtStore ResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response shopAtStore ResponseBody Found');
        print(SasResponseModel.fromJson(response.body));
        return SasResponseModel.fromJson(response.body);
      } else {
        print('shopAtStore ResponseBodyBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
