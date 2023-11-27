import 'dart:convert';

import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/configure/models/configure_data_model/configure_data_model.dart';
import 'package:customer_assist/home/data/configure/models/delivery_address_model/delivery_address_model.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/delivery_time_model.dart';
import 'package:customer_assist/home/data/configure/models/shop_details/shop_details.dart';
import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../presentation/controllers/view_controller.dart';
import '../models/let_me_shop/let_me_shop.dart';

abstract class ConfigureDataRemoteDataSource {
  Future<ConfigureDataModel> fetchDetails(String languageId);
  Future<DeliveryAddressModel> fetchCustomerDeliveryAddress(String languageId);
  Future<DeliveryTimeModel> fetchDeliveryTime(String languageId);
  Future<ResetPasswordOTPModel> updateDeliveryTime(
      String time, String languageId);
  Future<ResetPasswordOTPModel> updateCustomerDeliveryAddress(
    String salutation,
    String customerAddrId,
    String status,
    String firstName,
    String lastName,
    String addr1,
    String addr2,
    String country,
    String locality,
    String state,
    String city,
    String addressType,
    String type,
    String languageId,
    String mobile1,
    String mobile2,
    String mobile3,
    String postalcode
  );
  Future<ResetPasswordOTPModel> updateShoppingMode(
      String homeStore, String delivery, String languageId);
  Future<ShopDetails> fetchShopType(String languageId);
  Future<LetMeShop> shopDetails(String shopType, String languageId);
  Future<LetMeShop> guestShopDetails(String shopType, String languageId);

  Future<ResetPasswordOTPModel> updateShop(String shopId, String languageId);
}

var viewController = Get.put(ViewController());
var optionsController = Get.put(OptionsController());

class ConfigureDataRemoteDataSourceImpl extends ConfigureDataRemoteDataSource {
  @override
  Future<ConfigureDataModel> fetchDetails(String languageId) async {
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
        '{"Device_id":"${await Prefs.mobile}","LANGUAGEID":"$languageId"}';
        

    response = await http.post(Uri.parse(FETCHREVIEWSETTINGS),
        headers: headers, body: jsonRequestBody);
    print(jsonRequestBody);

    print("fetchSetting Response: ${response.body}");
    if (response.statusCode == 200) {
      print('Response Settings Found');
      print(ConfigureDataModel.fromJson(response.body));
      return ConfigureDataModel.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response Settings Not Found');
      return ConfigureDataModel.fromJson(response.body);
    } else {
      print('SettingsBlock Called Client Failed');
      throw ServerException();
    }
  }

//Updating the shopping mode

  @override
  Future<ResetPasswordOTPModel> updateShoppingMode(
      String homeStore, String delivery, String languageId) async {
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
        '{ "Device_id":"${await Prefs.mobile}","home_store":$homeStore,"del_pickup":$delivery,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(SHOPPINGMODE),
        headers: headers, body: jsonRequestBody);
    print('shopping mode request$jsonRequestBody');
    print("Shopping ModeResponse: ${response.body}");
    if (response.statusCode == 200) {
      print('Response ShoppingMode Found');
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response ShoppingMode Not Found');
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      print('ShoppingModeBlock Called Client Failed');
      throw ServerException();
    }
  }
//FetchCustomerDeliveryAddress

  @override
  Future<DeliveryAddressModel> fetchCustomerDeliveryAddress(
      String languageId) async {
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
        '{"Customer_Id":"${await Prefs.customerID}","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(CUSTOMERDELIVERYADDRESS),
        headers: headers, body: jsonRequestBody);
    print(' FetchCustomerDeliveryAddress RequestBody$jsonRequestBody');
    print("FetchCustomerDeliveryAddress Response: ${response.body}");
    print("CustomerId: ${await Prefs.customerID}");
    if (response.statusCode == 200) {
      print('Response FetchCustomerDeliveryAddress Found');
      print(DeliveryAddressModel.fromJson(response.body));
      return DeliveryAddressModel.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response FetchCustomerDeliveryAddress Not Found');
      return DeliveryAddressModel.fromJson(response.body);
    } else {
      print('FetchCustomerDeliveryAddressBlock Called Client Failed');
      throw ServerException();
    }
  }
//UpdateCustomerDeliveryAddress

  @override
  Future<ResetPasswordOTPModel> updateCustomerDeliveryAddress(
      String salutation,
      String customerAddrId,
      String status,
      String firstName,
      String lastName,
      String addr1,
      String addr2,
      String country,
      String locality,
      String state,
      String city,
      String addressType,
      String type,
      String languageId,
      String mobile1,
      String mobile2,
      String mobile3,
      String postalcode) async {
    print(salutation);
    print(customerAddrId);
    print(status);
    print(firstName);
    print(lastName);
    print(addr1);
    print(addr2);
    print(country);
    print(locality);
    print(state);
    print(city);
    print(addressType);
    print(type);
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
    '{"SALUTATIONS":"$salutation","EMAIL":"${await Prefs.superUserEmailId}","ZIPCODE":"$mobile3","Customer_Id":"${await Prefs.customerID}","Customer_Address_Id":"$customerAddrId","status":"$status","FIRST_NAME":"$firstName", "LAST_NAME":"$lastName","CONTACT_NO_1":"$mobile1", "CONTACT_NO_2":"$type", "ADDRESS_1":"$addr1","CONTACT_NO_3":"$languageId", "BUILDING_TYPE":"$mobile2","ADDRESS_2":"$addr2","COUNTRY":"$country","LOCALITY":"$locality","DEFAULT_FLAG":"Y","PROVIENCE":"$state","CITY":"$city","ADDRESS_TYPE":"$addressType","LANGUAGEID":"1"}';
        // '{"SALUTATIONS":"$salutation", "EMAIL":"${await Prefs.superUserEmailId}","ZIPCODE":"", "Customer_Id":"${await Prefs.customerID}","Customer_Address_Id":"$customerAddrId","status":"$status","FIRST_NAME":"$firstName", "LAST_NAME":"$lastName","CONTACT_NO_1":"$mobile1", "CONTACT_NO_2":"$mobile2", "ADDRESS_1":"$addr1","CONTACT_NO_3":"$mobile3", "BUILDING_TYPE":"$type","ADDRESS_2":"$addr2","COUNTRY":"$country","LOCALITY":"$locality","DEFAULT_FLAG":"Y","PROVIENCE":"$state","CITY":"$city","ADDRESS_TYPE":"$addressType","LANGUAGEID":"$languageId"}';

    print(UPDATEDELIVERYADDRESS);
    print(jsonRequestBody);

    print(jsonRequestBody);
    response = await http.post(Uri.parse(UPDATEDELIVERYADDRESS),
        headers: headers, body: jsonRequestBody);

    print("updateCustomerDeliveryAddress Response: ${response.body}");
    print("updateCustomerDeliveryAddress Request: $jsonRequestBody");
    if (response.statusCode == 200) {
      print('Response CustomerDeliveryAddress Found');
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response CustomerDeliveryAddress Not Found');
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      print('CustomerDeliveryAddressBlock Called Client Failed');
      throw ServerException();
    }
  }
//fetch ShopType

  @override
  Future<ShopDetails> fetchShopType(String languageId) async {
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
    if (optionsController.optionsKey.value == GUEST) {
      jsonRequestBody = '	{"Customer_Id":"0","LANGUAGEID":"$languageId"}';
    } else {
      jsonRequestBody =
          '	{"Customer_Id":"${await Prefs.customerID}","LANGUAGEID":"$languageId"}';
    }
    // ${await Prefs.customerID}

    response = await http.post(Uri.parse(FETCHSHOPTYPE),
        headers: headers, body: jsonRequestBody);
    print("fetch ShopType RequestShop: $jsonRequestBody");

    print("fetch ShopType Response: ${response.body}");
    if (response.statusCode == 200) {
      print('Response fetch ShopType Found');
      print(ShopDetails.fromJson(response.body));
      return ShopDetails.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response ShoppingMode Not Found');
      return ShopDetails.fromJson(response.body);
    } else {
      print('ShoppingModeBlock Called Client Failed');
      throw ServerException();
    }
  }

//Let me Shop

  @override
  Future<LetMeShop> shopDetails(String shopType, String languageId) async {
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
        '{"CUSTOMER_ID":"${await Prefs.customerID}","SHOP_TYPE":"$shopType","LANGUAGEID":"$languageId"}';
    response = await http.post(Uri.parse(LETMESHOP),
        headers: headers, body: jsonRequestBody);

    print("fetch letmeshop Response: ${response.body}");
    print("fetch letmeshop request: $jsonRequestBody");
    if (response.statusCode == 200) {
      print('Response fetch ShopType Found');
      print(LetMeShop.fromJson(response.body));
      return LetMeShop.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response ShoppingMode Not Found');
      return LetMeShop.fromJson(response.body);
    } else {
      print('ShoppingModeBlock Called Client Failed');
      throw ServerException();
    }
  }

  @override
  Future<LetMeShop> guestShopDetails(String shopType, String languageId) async {
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
        '{"SHOP_TYPE":"$shopType","VERTICAL_ID":"${await Prefs.verticalId}","PIN_CODE":"${await Prefs.areaCode}"}';
    response = await http.post(Uri.parse(LETMESHOPGUEST),
        headers: headers, body: jsonRequestBody);

    print("fetch LETMESHOPGUEST Response: ${response.body}");
    print("fetch LETMESHOPGUEST request: $jsonRequestBody");
    if (response.statusCode == 200) {
      print('Response fetch ShopType Found');
      print(LetMeShop.fromJson(response.body));
      return LetMeShop.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response ShoppingMode Not Found');
      return LetMeShop.fromJson(response.body);
    } else {
      print('ShoppingModeBlock Called Client Failed');
      throw ServerException();
    }
  }

  //UPDATE SHOP//
  @override
  Future<ResetPasswordOTPModel> updateShop(
      String shopId, String languageId) async {
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
        '{"Device_id":"${await Prefs.mobile}","Shop_Id":"$shopId","LANGUAGEID":"$languageId"}';
    response = await http.post(Uri.parse(UPDATEMYSHOPS),
        headers: headers, body: jsonRequestBody);
    print("update Shop Request: $jsonRequestBody");
    print("update Shop Response: ${response.body}");
    if (response.statusCode == 200) {
      print('Response update Shop Found');
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response Shop Not Found');
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      print('Shopping Called Client Failed');
      throw ServerException();
    }
  }

  //DELIVERY TIME//
  @override
  Future<DeliveryTimeModel> fetchDeliveryTime(String languageId) async {
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
   // if(optionsController.outlet == '57'){
     jsonRequestBody =
        '{"SHOP_ID":"${await Prefs.shopId}","Customer_Id":"${await Prefs.customerID}","DELIVERY_TYPE":"H","LANGUAGEID":"$languageId"}';
        //${await Prefs.deliveryType}
    // }else{
    //    jsonRequestBody =
    //     '{"SHOP_ID":"335","Customer_Id":"${await Prefs.customerID}","DELIVERY_TYPE":"H","LANGUAGEID":"$languageId"}';
    // }
   
    response = await http.post(Uri.parse(DELIVERYTIME),
        headers: headers, body: jsonRequestBody);

    print("DeliveryTime Request: $jsonRequestBody");
    print("DeliveryTime Response: ${response.body}");
    if (response.statusCode == 200) {
      print('Response fetch DeliveryTime Found');
      // print(DeliveryTimeModel.fromJson(response.body));
      return DeliveryTimeModel.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response DeliveryTime Not Found');
      return DeliveryTimeModel.fromJson(response.body);
    } else {
      print('DeliveryTime Called Client Failed');
      throw ServerException();
    }
  }

  //UPDATE DELIVERY TIME//
  @override
  Future<ResetPasswordOTPModel> updateDeliveryTime(
      String time, String languageId) async {
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
        '{"Device_id":"${await Prefs.mobile}","prefertime":"$time","LANGUAGEID":"$languageId"}';
    response = await http.post(Uri.parse(UPDATEPREFERRER),
        headers: headers, body: jsonRequestBody);

    print("DeliveryTime Request: $jsonRequestBody");
    print("DeliveryTime Response: ${response.body}");
    if (response.statusCode == 200) {
      print('Response fetch DeliveryTime Found');
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response DeliveryTime Not Found');
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      print('DeliveryTime Called Client Failed');
      throw ServerException();
    }
  }
}
