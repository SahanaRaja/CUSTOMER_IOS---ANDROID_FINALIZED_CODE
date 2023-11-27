import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/app_urls.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helpers/SharedPreference/prefs.dart';
import '../../../../../database/database.dart';
import '../../super_user/models/reset_send_otp_model.dart';
import 'package:http/http.dart' as http;

abstract class OtpSendAndVerifyRemoteDataSource {
  Future<ResetPasswordOTPModel> checkSendOTP(
      String userName, String type, String languageId);
  Future<ResetPasswordOTPModel> checkSendOTPVerify(
      String userName, String otp, String type, String languageId);
  Future<ResetPasswordOTPModel> checkSendOTPPasswordUpdate(
    String userName,
    String password,
    String type,
    String? newpassword,
  );
}

class OtpSendAndVerifyRemoteDataSourceImpl
    extends OtpSendAndVerifyRemoteDataSource {
  @override
  Future<ResetPasswordOTPModel> checkSendOTP(
      String userName, String type, String languageId) async {
    String token = await Prefs.token;
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
    //   print("ForgotPasswordSendOTPParams: " + jsonRequestBody);
    http.Response response = await http.post(
        Uri.parse(POSUSER_PASSWORD_OTPSEND),
        headers: headers,
        body: jsonRequestBody);
    // if (SHOW_DEBUGGING) print("ForgotPasswordSendOTPBody: " + response.body);
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING) print('Response ForgotPasswordSendOTP Found');
      // if (SHOW_DEBUGGING)
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      // if (SHOW_DEBUGGING)
      print('ForgotPasswordSendOTPBlock Called Client Failed');
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> checkSendOTPPasswordUpdate(String userName,
      String password, String type, String? newpassword) async {
    if (type == 'fp') {
      String hashedPassword = md5.convert(utf8.encode(password)).toString();
      Database db = await initDb();
      String whereString = 'UD_EMAIL_ID = ?';
      List<dynamic> whereArguments = [userName];
      int result = await db.update(
          'pos_user_details',
          {
            'UD_USER_PASSWORD': hashedPassword,
          },
          where: whereString,
          whereArgs: whereArguments);
      if (result == 1) {
        return const ResetPasswordOTPModel(
          message: 'Your Password has been reset successfully.',
          result: 1,
        );
      } else {
        return const ResetPasswordOTPModel(
          message: 'Something went wrong while changing password.',
          result: 0,
        );
      }
    } else if (type == 'cp') {
      // if (SHOW_DEBUGGING) print(password);
      // if (SHOW_DEBUGGING) print(newpassword);
      String oldhashedPassword =
          md5.convert(utf8.encode(newpassword!)).toString();
      String newHashedPassword = md5.convert(utf8.encode(password)).toString();
      // if (SHOW_DEBUGGING) print(userName);
      if (await checkLocalLogin(userName, oldhashedPassword)) {
        Database db = await initDb();
        String whereString = 'UD_EMAIL_ID = ?';
        List<dynamic> whereArguments = [userName];
        int result = await db.update(
            'pos_user_details',
            {
              'UD_USER_PASSWORD': newHashedPassword,
            },
            where: whereString,
            whereArgs: whereArguments);
        if (result == 1) {
          return const ResetPasswordOTPModel(
            message: 'Your Password has been changed successfully.',
            result: 1,
          );
        } else {
          return const ResetPasswordOTPModel(
            message: 'Something went wrong while changing password.',
            result: 0,
          );
        }
      } else {
        return const ResetPasswordOTPModel(
          message: 'Old Password does not match.',
          result: 0,
        );
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResetPasswordOTPModel> checkSendOTPVerify(
      String userName, String otp, String type, String languageId) async {
    String token = await Prefs.token;
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
        '{"EMAIL": "$userName","OTP": $otp,"LANGUAGEID":"$languageId"}';
    // if (SHOW_DEBUGGING)
    print("ForgotPasswordSendOTPParams: $jsonRequestBody");
    http.Response response = await http.post(
        Uri.parse(POSUSER_PASSWORD_OTPVERIFY),
        headers: headers,
        body: jsonRequestBody);
    // if (SHOW_DEBUGGING) print("ForgotPasswordSendOTPBody: " + response.body);
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING) print('Response ForgotPasswordVerifyOTP Found');
      // if (SHOW_DEBUGGING)
      print(ResetPasswordOTPModel.fromJson(json.decode(response.body)));
      return ResetPasswordOTPModel.fromJson(json.decode(response.body));
    } else {
      // if (SHOW_DEBUGGING)
      print('ForgotPasswordVerifyOTPBlock Called Client Failed');
      throw ServerException();
    }
  }
}
