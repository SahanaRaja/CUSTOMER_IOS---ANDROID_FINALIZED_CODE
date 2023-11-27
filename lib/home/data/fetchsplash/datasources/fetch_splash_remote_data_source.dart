import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../models/fetch_splash_response_model.dart';

abstract class FetchSplashRemoteDataSource {
  Future<FetchSplashResponseModel> checkFetchSplash(
      String country, String dateTime, String device, String languageId);
  Future<FetchSplashResponseModel> fetchSplashInit(String languageId);
}

class FetchSplashRemoteDataSourceImpl extends FetchSplashRemoteDataSource {
  @override
  Future<FetchSplashResponseModel> checkFetchSplash(
      String country, String dateTime, String device, String languageId) async {
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
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    jsonRequestBody =
        '{"Country":"$country","Curr_Timestamp":"$dateTime","Device_id":"$device","LANGUAGEID":"$languageId"}';
    // jsonRequestBody =
    //     '		{"Country":"$country","Curr_Timestamp":"2020-12-18 13:48:21","Device_id":"$device"}';
    // jsonRequestBody = '{"Country":"India"}';

    response = await http.post(Uri.parse(FETCHSPLASH),
        headers: headers, body: jsonRequestBody);
    print('FetchSplashRequenstBody$jsonRequestBody');
    print("FetchSplashResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response Splash Found');
      print(FetchSplashResponseModel.fromJson(json.decode(response.body)));
      return FetchSplashResponseModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response Splash Not Found');
      return FetchSplashResponseModel.fromJson(json.decode(response.body));
    } else {
      print('FetchCountryBlock Called Client Failed');
      throw ServerException();
    }
  }

  @override
  Future<FetchSplashResponseModel> fetchSplashInit(String languageId) async {
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
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    // jsonRequestBody =
    //     '		{"Country":"$country","Curr_Timestamp":"2020-12-18 13:48:21","Device_id":"$device"}';
    jsonRequestBody = '{"LANGUAGEID":"$languageId"}';

    response = await http.post(Uri.parse(FETCHSPLASHINIT), headers: headers);
    print('FetchSplashinitRequestBody$jsonRequestBody');
    print("FetchSplashinitResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response Splash Found');
      print(FetchSplashResponseModel.fromJson(json.decode(response.body)));
      return FetchSplashResponseModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response Splash Not Found');
      return FetchSplashResponseModel.fromJson(json.decode(response.body));
    } else {
      print('FetchCountryBlock Called Client Failed');
      throw ServerException();
    }
  }
}
