// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';
import '../../forgotpassword/super_user/models/reset_send_otp_model.dart';

abstract class CreateUserRemoteDataSource {
  Future<ResetPasswordOTPModel> checkSendOTP(
      String userName, String userType, String languageId);
  Future<ResetPasswordOTPModel> checkSendOTPVerify(
      String userName, String otp, String userType, String languageId);
  Future<ResetPasswordOTPModel> addUser(String userName, String emailId,
      String password, String userType, int type, String languageId);
}

class CreateUserRemoteDataSourceImpl extends CreateUserRemoteDataSource {
  @override
  Future<ResetPasswordOTPModel> addUser(String userName, String emailId,
      String password, String userType, int type, String languageId) async {
    String jsonRequestBody = '';
    http.Response response;
        var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? ""; 
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo":NEWTOKEN
      //  TOKEN
    };
    // if (userType == MANAGER) {
    jsonRequestBody =
        '{"Device_id":"${await Prefs.mobile}","EMAIL":"$emailId","USERNAME":"$userName","PASSWORD":"$password","LANGUAGEID":"$languageId"}';
// "USERNAME":"$emailId"
    response = await http.post(Uri.parse(MANAGER_POS_USER_DETAILS),
        headers: headers, body: jsonRequestBody);
    // }
    print("AddUserParams: $jsonRequestBody");
    print("AddUserBody:${response.body}");
    try {
      if (response.statusCode == 200) {
        print('Response AddUser Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        print('AddUserBlock Called Client Failed');
        throw ServerException();
      }
    } catch (e) {
      print("Aj-$e");
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> checkSendOTP(
      String userName, String userType, String languageId) async {
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
    String jsonRequestBody =
        '{"EMAIL": "$userName","LANGUAGEID":"$languageId"}';
    // if (SHOW_DEBUGGING)
    print("CreateUserSendOTPParams: $jsonRequestBody");
    response = await http.post(Uri.parse(MANAGER_MAIL_CHECK),
        headers: headers, body: jsonRequestBody);

    // if (SHOW_DEBUGGING)
    print("CreateUserSendOTPBody: ${response.body}");
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING)
      print('Response CreateUserSendOTP Found');
      // if (SHOW_DEBUGGING)
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      // if (SHOW_DEBUGGING)
      print('CreateUserSendOTPBlock Called Client Failed');
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> checkSendOTPVerify(
      String userName, String otp, String userType, String languageId) async {
    // String token = await Prefs.token;
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
    String jsonRequestBody =
        '{"Email_Id": "$userName","OTP":"$otp","LANGUAGEID":"$languageId"}';
    // if (SHOW_DEBUGGING)
    print("CreateUserSendOTPParams: $jsonRequestBody");

    response = await http.post(Uri.parse(MANAGER_OTP_VERIFY),
        headers: headers, body: jsonRequestBody);

    // if (SHOW_DEBUGGING)
    print("CreateUserSendOTPBody: ${response.body}");
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING)
      print('Response CreateUserVerifyOTP Found');
      // if (SHOW_DEBUGGING)
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      // if (SHOW_DEBUGGING)
      print('CreateUserVerifyOTPBlock Called Client Failed');
      throw ServerException();
    }
  }
}
