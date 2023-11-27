// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';
import '../models/profile_details_model.dart';

abstract class ProfileDetailsRemoteDataSource {
  Future<ProfileDetailsModel> fetchProfileDetails(
      String languageId,
     );
  Future<ProfileDetailsModel> updateProfileDetails(
      String salutations,
      String country,
      String city,
      String dob,
      String lastName,
      String email,
      String firstName,
      String state,
      String mobile,
      // String mobNo1,
      // String mobNo2,
      // String mobNo3,
      String addr1,
      String addr2,
      String postal,
      String userName,
      String languageId);
  Future<bool> updateProfilePicture(
    File picture,
  );
}

class ProfileDetailsRemoteDataSourceImpl
    extends ProfileDetailsRemoteDataSource {
  @override
  Future<ProfileDetailsModel> fetchProfileDetails(
       String languageId,
      ) async {
    String token = await Prefs.token;
    String jsonRequestBody;
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
    // if (userType == MANAGER) {
    print("cvsgfshg");
    jsonRequestBody =
        '{"Customer_Id":"${await Prefs.customerID}","LANGUAGEID":"$languageId"}';
    // } else {
    //   jsonRequestBody =
    //       '{"USER_NAME":"$userName","ACCESS_TYPE":"$accessType","SHOP_ID":"$shopId"}';
    // }
    
    http.Response response = await http.post(
        Uri.parse(FETCH_PROFILEDETAILS_URL),
        headers: headers,
        body: jsonRequestBody);
        print("FetchProfileDetails :$jsonRequestBody");
         print("FetchProfileDetails :${response.body}");
    
    try{
      if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING)
     
      print('Response FetchProfileDetails Found');
      // if (SHOW_DEBUGGING)
      print(ProfileDetailsModel.fromJson(json.decode(response.body)));
      return ProfileDetailsModel.fromJson(json.decode(response.body));
    } else {
      // if (SHOW_DEBUGGING)
      print('FetchProfileDetailsBlock Called Client Failed');
      throw ServerException();
    }


    } on Exception {
      throw ServerException();
    }
    
  }

  @override
  Future<ProfileDetailsModel> updateProfileDetails(
      String salutations,
      String country,
      String city,
      String dob,
      String lastName,
      String email,
      String firstName,
      String state,
      // String shopId,
      // String mobNo1,
      // String mobNo2,
      String mobile,
      String addr1,
      String addr2,
      String postal,
      String userName,
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
    // if (SHOW_DEBUGGING) print(token);
    // if (userType == MANAGER) {
    jsonRequestBody =
        '{"Customer_Id":"${await Prefs.customerID}","ALTERNATE_CONTACT_NO_3":"$state","ALTERNATE_CONTACT_NO_2":"0","ZIPCODE":"$postal","ALTERNATE_CONTACT_NO_1":"0","OPERATIONAL_FEEDBACK":{"Audio":"0","None":"0","Haptic":"H"},"DOB":"$city","BUILDING_TYPE":"A","ADDRESS_1":"$addr1","ADDRESS_2":"$addr2","os":"A","PROVIENCE":"$state","CITY":"$dob","COUNTRY":"$country", "SALUTATIONS":"$salutations","FIRST_NAME":"$firstName","LAST_NAME":"$lastName","LOCALITY":"","LANGUAGEID":"$languageId"}';
    //  {await Prefs.postalCode}
    response = await http.post(Uri.parse(UPDATE_PROFILEDETAILS_URL),
        headers: headers, body: jsonRequestBody);

    // } else {
    //   jsonRequestBody =
    //       // '{"SALUTATIONS": "$salutations","COUNTRY": "$country","CITY": "$city","DOB": "$dob","LAST_NAME": "$lastName","EMAIL": "$email","FIRST_NAME": "$firstName","STATE": "$state","MOBILE_NO1": "$mobNo1","MOBILE_NO2": "$mobNo2","MOBILE_NO3": "$mobNo3","ADDRESS1": "$addr1","ADDRESS2": "$addr2","POSTAL_CODE": "$postal","SHOP_ID":"$shopId","ACCESS_TYPE":"$type","USER_NAME":"$userName",}';
    //       '{"UD_STATE_NAME":"$country","UD_TITLE":"$salutations","UD_MOBILE_NO":"$mobNo1","UD_FIRST_NAME":"$firstName","UD_USER_TYPE":"N","UD_LAST_NAME":"$lastName","UD_DOB":"$dob","UD_SHOP_ID":"${await Prefs.shopId}","UD_COUNTRY_NAME":"$country","UD_EMAIL_ID":"$email","UD_USER_NAME":"$userName","UD_ACCESS_TYPE_ID":"$type","UD_ZIP_CODE":"$postal","UD_ADDRESS1":"$addr1","UD_ADDRESS2":"$addr2","UD_CITY_NAME":"$city","UD_USER_CODE":"2","UD_USER_PASSWORD":"$password","UD_USER_ASSIGNED_TYPE":"P","UD_CREATED_DATE":"${DateFormat('yyyy-MM-dd').format(DateTime.now())}","UD_FLAG_STATUS":"0","UD_DEVICE_ID": " ","UD_VERTICAL_ID":"${await Prefs.verticalId}","UD_IMAGE_PATH":" "}';
    //   response = await http.post(Uri.parse(UPDATE_PROFILEDETAILS_URL_New),
    //       headers: headers, body: jsonRequestBody);
    // }

    // if (SHOW_DEBUGGING)
    print("UpdateProfileDetailsHeaders: $headers");
    // if (SHOW_DEBUGGING)
    print("UpdateProfileDetailsBody: $jsonRequestBody");
    // if (SHOW_DEBUGGING)
    print("ProfileDetailsBody: ${response.body}");
    try {
      if (response.statusCode == 200) {
        // if (SHOW_DEBUGGING)
        print('Response UpdateProfileDetails Found');
        // if (SHOW_DEBUGGING)
        print(ProfileDetailsModel.fromJson(json.decode(response.body)));
        return ProfileDetailsModel.fromJson(json.decode(response.body));
      } else {
        // if (SHOW_DEBUGGING)
        print('UpdateProfileDetailsBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<bool> updateProfilePicture(File picture) async {
    String token = await Prefs.token;
    http.MultipartRequest request;
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
    // if (SHOW_DEBUGGING) print(token);
    // String jsonRequestBody = '{"SHOP_ID": "$shopId"}';
    // if (SHOW_DEBUGGING)
    //   print("UpdateProfilePictureHeaders: " + headers.toString());
    // if (SHOW_DEBUGGING)
    // print("UpdateProfilePictureBody: " + jsonRequestBody);
    // if (userType == MANAGER) {
    //   request =
    //       http.MultipartRequest('POST', Uri.parse(UPDATE_PROFILEPICTURE_URL));
    //   request.headers['Content-type'] = "application/json";
    //   request.headers['TokenNo'] = token.trim();

    //   request.fields['SHOP_ID'] = shopId;

    //   request.files.add(http.MultipartFile(
    //       'Profile_Pic',
    //       File(picture.path).readAsBytes().asStream(),
    //       File(picture.path).lengthSync(),
    //       filename: picture.path.split("/").last));
    // } else {
    request = http.MultipartRequest(
        'POST', Uri.parse(UPDATE_EMPLOYEE_PROFILEPICTURE_URL));
    request.headers['Content-type'] = "application/json";
    request.headers['TokenNo'] = NEWTOKEN;

    request.fields['Customer_Id'] = await Prefs.customerID;

    request.files.add(http.MultipartFile(
        'Profile_Pic',
        File(picture.path).readAsBytes().asStream(),
        File(picture.path).lengthSync(),
        filename: picture.path.split("/").last
        ));
    // }
    try {
      http.StreamedResponse streamedResponse = await request.send();
      print(await streamedResponse.stream.bytesToString());
      return true;
    } on Exception {
    // if (SHOW_DEBUGGING) print(streamedResponse);
    throw ServerException();
    }
    // http.Response response = await http.post(
    //     Uri.parse(UPDATE_PROFILEPICTURE_URL),
    //     headers: headers,
    //     body: jsonRequestBody);
    // if(SHOW_DEBUGGING)print("FetchProfileDetailsBody: " + response.body);
    // if (response.statusCode == 200) {
    //   if(SHOW_DEBUGGING)print('Response UpdateProfilePicture Found');
    //   if(SHOW_DEBUGGING)print(ProfileDetailsModel.fromJson(json.decode(response.body)));
    //   return ProfileDetailsModel.fromJson(json.decode(response.body));
    // } else {
    //   if(SHOW_DEBUGGING)print('UpdateProfilePictureBlock Called Client Failed');
    //   throw ServerException();
    // }
  }
}
