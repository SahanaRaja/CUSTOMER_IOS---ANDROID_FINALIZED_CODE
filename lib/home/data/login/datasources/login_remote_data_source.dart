import 'dart:convert';

import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../models/login_response_model.dart';
import '../models/mobile_response/mobile_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> checkLogin(
      String email, String password, String languageId);
  Future<MobileResponse> checkMobile(String mobileNumber, String languageId);
  Future<ResetPasswordOTPModel> mobileOTPVerify(
      String mobileNumber, String otp, String languageId);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<LoginResponseModel> checkLogin(
      String email, String password, String languageId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonRequestBody;
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
          prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? ""; 
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo":NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{ "Device_id":"$email","PASSWORD":"$password" ,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(POSLoginAPI),
        headers: headers, body: jsonRequestBody);

    print("LoginjsonRequestBody: $jsonRequestBody");
    print("LoginResponseBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response User Found');
        print(LoginResponseModel.fromJson(json.decode(response.body)));
        prefs.setString('Email', email);
        return LoginResponseModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        print('Response User Not Found');
        return LoginResponseModel.fromJson(json.decode(response.body));
      } else {
        print('LoginBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<MobileResponse> checkMobile(
      String mobileNumber, String languageId) async {
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
        '{ "Device_id":"$mobileNumber" ,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(NEWDEVICECHECK),
        headers: headers, body: jsonRequestBody);

    try {
      print(http.post(Uri.parse(NEWDEVICECHECK)));
      print("MobilejsonRequestBody: $jsonRequestBody");
      print("MobileResponseBody: ${response.body}");
      if (response.statusCode == 200) {
        print('Response User Found');
        print(MobileResponse.fromJson(response.body));
        return MobileResponse.fromJson(response.body);
      } else if (response.statusCode == 401) {
        print('Response User Not Found');
        return MobileResponse.fromJson(json.decode(response.body));
      } else {
        print('MobileBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> mobileOTPVerify(
      String mobileNumber, String otp, String languageId) async {
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
        '{ "Device_id":"$mobileNumber","OTP":$otp ,"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(NEWDEVICESMSVERIFY),
        headers: headers, body: jsonRequestBody);

    try {
      print("MobileOTPjsonRequestBody: $jsonRequestBody");
      print("MobileOTPResponseBody: ${response.body}");
      if (response.statusCode == 200) {
        print('Response User Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        print('Response User Not Found');
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('MobileOTPBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
