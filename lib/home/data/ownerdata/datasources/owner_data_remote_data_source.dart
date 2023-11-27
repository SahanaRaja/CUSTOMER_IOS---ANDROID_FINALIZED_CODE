import 'dart:convert';

import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/ownerdata/models/retail_vertical_response/retail_vertical_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';
import '../models/owner_data_response/owner_data_response.dart';

abstract class OwnerDataRemoteDataSource {
  Future<OwnerDataResponse> fetchAddress(
      String mobile, String postalCode, String languageId);
  Future<ResetPasswordOTPModel> updateAddress(
      String mobile,
      String firstName,
      String lastName,
      String areaCode,
      String mobileNo,
      String addr1,
      String addr2,
      String type,
      String defaultflag,
      String locality,
      String postalCode,
      String state,
      String city,
      String country,
      String languageId);
  Future<RetailVerticalResponse> fetchVertical(String languageId);
  Future<ResetPasswordOTPModel> updateVertical(
      int verticalId, String languageId);
}

class OwnerDataRemoteDataSourceImpl extends OwnerDataRemoteDataSource {
  @override
  Future<OwnerDataResponse> fetchAddress(
      String mobile, String postalCode, String languageId) async {
    String jsonRequestBody;
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": TOKEN
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
        '	{"Device_Id":"$mobile", "Postal_Code":"$postalCode","LANGUAGEID":"$languageId" }';
    // jsonRequestBody =
    //     '		{"Country":"$country","Curr_Timestamp":"2020-12-18 13:48:21","Device_id":"$device"}';
    // jsonRequestBody = '{"Country":"India"}';

    response = await http.post(Uri.parse(OWNERDATA),
        headers: headers, body: jsonRequestBody);

    print("AddressResponseBody: ${response.body}");
    print("AddressRequestBody: $jsonRequestBody");
    if (response.statusCode == 200) {
      print('Response Address Found');
      print(OwnerDataResponse.fromJson(response.body));
      return OwnerDataResponse.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response Address Not Found');
      return OwnerDataResponse.fromJson(json.decode(response.body));
    } else {
      print('AddressBlock Called Client Failed');
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> updateAddress(
      String mobile,
      String firstName,
      String lastName,
      String areaCode,
      String mobileNo,
      String addr1,
      String addr2,
      String type,
      String defaultflag,
      String locality,
      String postalCode,
      String state,
      String city,
      String country,
      String languageId) async {
    String jsonRequestBody;
    http.Response response;

    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": TOKEN
    // };
     var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? ""; 
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo":NEWTOKEN
      //  TOKEN1
    };
    jsonRequestBody =
        '{"DEVICE_ID":"$mobile","FIRST_NAME":"$firstName","LAST_NAME":"$lastName","COUNTRY_CODE":"${await Prefs.phoneCode}", "AREA_CODE":"$areaCode","MOBILE_NUMBER":"$mobileNo","ADDRESS_1":"$addr1","ADDRESS_2":"$addr2","ADDRESS_TYPE":"$type","DEFAULT_FLAG":"$defaultflag","LOCALITY":"$locality","POSTAL_CODE":"$postalCode","STATE":"$state","CITY":"$city","COUNTRY":"${await Prefs.country}"}';
    
       // '{"DEVICE_ID":"$mobile","FIRST_NAME":"$firstName", "LAST_NAME":"$lastName","COUNTRY_CODE":"${await Prefs.phoneCode}", "AREA_CODE":"$areaCode","MOBILE_NUMBER":"$mobileNo","ADDRESS_1":"$addr1","ADDRESS_2":"$addr2","ADDRESS_TYPE":"$type","DEFAULT_FLAG":"$defaultflag","LOCALITY":"$locality","POSTAL_CODE":"$postalCode","STATE":"$state","CITY":"$city","COUNTRY":"$country"}';
    // jsonRequestBody = '{"Country":"India"}';

    response = await http.post(Uri.parse(UPDATEDEVICEADDRESS),
        headers: headers, body: jsonRequestBody);

    print("AddressResponseBody: ${response.body}");
    print("AddressREquest: $jsonRequestBody");
    try {
      if (response.statusCode == 200) {
        print('Response Address Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        print('Response Address Not Found');
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('Address Block Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<RetailVerticalResponse> fetchVertical(String languageId) async {
    String jsonRequestBody;
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": TOKEN
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
        '	{"Device_id":"${await Prefs.mobile}","LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(VERTICAL),
        headers: headers, body: jsonRequestBody);

    print("VerticalResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response Vertical Found');
      print(RetailVerticalResponse.fromJson(response.body));
      return RetailVerticalResponse.fromJson(response.body);
    } else if (response.statusCode == 401) {
      print('Response Vertical Not Found');
      return RetailVerticalResponse.fromJson(json.decode(response.body));
    } else {
      print('VerticalBlock Called Client Failed');
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> updateVertical(
      int verticalId, String languageId) async {
    String jsonRequestBody;
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": TOKEN
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
        '	{"Device_id":"${await Prefs.mobile}","Vertical":[{"Id":$verticalId}],"LANGUAGEID":"$languageId"}';
    print("VerticalRequest: $jsonRequestBody");

    response = await http.post(Uri.parse(UPDATEVERTICAL),
        headers: headers, body: jsonRequestBody);

    print(": ${response.body}");
    if (response.statusCode == 200) {
      print('Response Vertical Found');
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response Vertical Not Found');
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      print('VerticalBlock Called Client Failed');
      throw ServerException();
    }
  }
}
