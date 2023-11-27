// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/helpers/SharedPreference/prefs.dart';
import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../models/language_response_model.dart';

abstract class languageDetailsRemoteDataSource {
  Future<LanguageResponseModel> fetchLanguageDetails(int languageNum);
}

class languageDetailsRemoteDataSourceImpl
    extends languageDetailsRemoteDataSource {
  @override
  Future<LanguageResponseModel> fetchLanguageDetails(int languageNum) async {
    String token = await Prefs.token;
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
    jsonRequestBody = '{"LANGUAGEID":"$languageNum"}';

    // var pref = await SharedPreferences.getInstance();
    // var UDID = pref.get("udid");
    // jsonRequestBody = '{"LANGUAGEID":"$languageNum","udid":"$UDID"}';
    response = await http.post(Uri.parse(FETCH_LANGUAGE),
        headers: headers, body: jsonRequestBody);
    print('language request$jsonRequestBody');

    if (response.statusCode == 200) {
      print('Response Language Found');
      print(json.decode(response.body)['status']);
      var status = json.decode(response.body)['status'];

      return LanguageResponseModel.fromJson(json.decode(status['ARB']));
    } else {
      print('FetchLanguageDetailsBlock Called Client Failed');
      throw ServerException();
    }
  }
}
