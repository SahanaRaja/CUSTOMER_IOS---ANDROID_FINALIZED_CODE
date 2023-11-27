import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/app_urls.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helpers/SharedPreference/prefs.dart';
import '../models/reset_send_otp_model.dart';

abstract class ForgotPasswordRemoteDataSource {
  Future<ResetPasswordOTPModel> checkSendOTP(
      String userName, String type, String languageId);
  Future<ResetPasswordOTPModel> checkSendOTPVerify(String userName,
      String password, String otp, String type, String languageId);
  Future<ResetPasswordOTPModel> checkSendOTPPasswordUpdate(
    String userName,
    String password,
    String otp,
    String type,
    String languageId,
    String? oldpassword,
  );
}

class ForgotPasswordRemoteDataSourceImpl
    extends ForgotPasswordRemoteDataSource {
  @override
  Future<ResetPasswordOTPModel> checkSendOTP(
      String userName, String type, String languageId) async {
    http.Response response;
    String jsonRequestBody;
    String token = await Prefs.token;

    if (type == 'fp') {
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
          '{ "Device_id":"${await Prefs.mobile}","Email_id":"$userName","LANGUAGEID":"$languageId" }';

      response = await http.post(Uri.parse(DeviceForgetPassword),
          headers: headers, body: jsonRequestBody);
      // }

      print("ForgotPasswordSendOTPParams: $jsonRequestBody");
      print("ForgotPasswordSendOTPBody: ${response.body}");
      if (response.statusCode == 200) {
        // if(SHOW_DEBUGGING)
        print('Response ForgotPasswordSendOTP Found');
        // if(SHOW_DEBUGGING)
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        // if(SHOW_DEBUGGING)print('ForgotPasswordSendOTPBlock Called Client Failed');
        throw ServerException();
      }
    } else if (type == 'cp') {
      http.Response response;
      String jsonRequestBody;
      // Map<String, String> headers = {
      //   "Content-type": "application/json",
      //   "TokenNo": TOKEN
      // };
      var prefs = await SharedPreferences.getInstance();
      String? tokenNos = prefs.getString("TokenNo");
      String NEWTOKEN = tokenNos ?? "";
      Map<String, String> headers = {
        "Content-type": "application/json",
        "TokenNo": NEWTOKEN
        //  TOKEN
      };

      print(token);

      print("ChangePasswordSendOTPHeaders: $headers");

      jsonRequestBody =
          '	{"Customer_Id":"${await Prefs.customerID}","LANGUAGEID":"$languageId" }';

      response = await http.post(Uri.parse(CHANGEOTPSEND_URL),
          headers: headers, body: jsonRequestBody);
      // }
      // if(SHOW_DEBUGGING)
      print("ChangePasswordSendOTPBody: $jsonRequestBody");
      print("ChangePasswordSendOTPBody: ${response.body}");
      if (response.statusCode == 200) {
        // if(SHOW_DEBUGGING)
        print('Response ChangePasswordSendOTP Found');
        // if(SHOW_DEBUGGING)
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        // if(SHOW_DEBUGGING)
        print('ChangePasswordSendOTPBlock Called Client Failed');
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> checkSendOTPVerify(String userName, String otp,
      String newPassword, String type, String languageId) async {
    http.Response response;
    String jsonRequestBody;
    if (type == 'fp') {
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
          '{"PASSWORD":"$newPassword","Device_id":"$userName","OTP":"$otp","LANGUAGEID":"$languageId"}';

      response = await http.post(Uri.parse(DeviceForgetPasswordUpdate),
          //DeviceForgetPasswordUpdate
          headers: headers,
          body: jsonRequestBody);
      // }

      // if(SHOW_DEBUGGING)
      print("ForgotPasswordSendOTPParams: $jsonRequestBody");
      print(response.body);
      // // if(SHOW_DEBUGGING)print("ForgotPasswordSendOTPBody: " + response.body);
      if (response.statusCode == 200) {
        // if(SHOW_DEBUGGING)
        print('Response ForgotPasswordVerifyOTP Found');
        // if(SHOW_DEBUGGING)
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        // if(SHOW_DEBUGGING)print('ForgotPasswordVerifyOTPBlock Called Client Failed');
        throw ServerException();
      }
    } else if (type == 'cp') {
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
          '	{ "Customer_Id":"${await Prefs.customerID}", "Otp":"$otp" ,"LANGUAGEID":"$languageId"}';

      response = await http.post(Uri.parse(CHANGEOTPVERIFY_URL),
          headers: headers, body: jsonRequestBody);
      // }
      print("ChangePasswordVerifyOTPParams: $jsonRequestBody");
      print("ChangePasswordVerifyOTPBody: ${response.body}");
      if (response.statusCode == 200) {
        print('Response ChangePasswordSendOTP Found');
        print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
        return ResetPasswordOTPModel.fromJson(json.decode(response.body));
      } else {
        // if(SHOW_DEBUGGING)
        print('ChangePasswordVerifyOTPBlock Called Client Failed');
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> checkSendOTPPasswordUpdate(
    String userName,
    String password,
    String otp,
    String type,
    String languageId,
    String? oldpassword,
  ) async {
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
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{ "Customer_Id":"${await Prefs.customerID}","OLD_PASSWORD":"$oldpassword", "PASSWORD":"$password","LANGUAGEID":"1" }';
    print(password);
    //print(newpassword);
    response = await http.post(Uri.parse(CHANGEPASSWORDUPDATE_URL),
        headers: headers, body: jsonRequestBody);
    // }
    print("ChangePasswordUpdateBody: $jsonRequestBody");
    print("ChangePasswordUpdateBody: ${response.body}");
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING)
      print('Response ChangePasswordUpdateOTP Found');
      // if (SHOW_DEBUGGING)
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      // if (SHOW_DEBUGGING) print('ForgotPasswordUpdate Called Client Failed');
      throw ServerException();
    }
    // } else {
    //   throw ServerException();
    // }
  }
}
