import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../models/fetch_country_response_model.dart';

abstract class FetchCountryRemoteDataSource {
  Future<FetchCountryResponseModel> checkFetchCountry(
      String country, String languageId);
}

class FetchCountryRemoteDataSourceImpl extends FetchCountryRemoteDataSource {
  @override
  Future<FetchCountryResponseModel> checkFetchCountry(
      String country, String languageId) async {
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
    jsonRequestBody = '{"Country":"$country","LANGUAGEID":"$languageId"}';
    // jsonRequestBody = '{"Country":"India"}';

    response = await http.post(Uri.parse(FETCH_COUNTRY_DETAILS),
        headers: headers, body: jsonRequestBody);

    print("FetchCountryResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response User Found');
      print(FetchCountryResponseModel.fromJson(json.decode(response.body)));
      return FetchCountryResponseModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response User Not Found');
      return FetchCountryResponseModel.fromJson(json.decode(response.body));
    } else {
      print('FetchCountryBlock Called Client Failed');
      throw ServerException();
    }
  }
}
