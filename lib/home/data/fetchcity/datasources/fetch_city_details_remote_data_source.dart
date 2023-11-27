import 'dart:convert';

import 'package:customer_assist/home/data/fetchcity/models/fetchAreamodel/fetch_area_response_model.dart';
import 'package:customer_assist/home/data/fetchcity/models/fetchCitymodel/fetch_city_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';

abstract class FetchCityRemoteDataSource {
  Future<List<FetchCityResponseModel>> checkFetchCity();
  Future<List<FetchAreaResponseModel>> checkFetchArea();
}

class FetchCityRemoteDataSourceImpl extends FetchCityRemoteDataSource {
  List<FetchCityResponseModel> finalCityList = <FetchCityResponseModel>[].obs;

  @override
  Future<List<FetchCityResponseModel>> checkFetchCity() async {
    http.Response response;
    String jsonRequestBody = '';

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

    // jsonRequestBody = '{"Country":"${country}","LANGUAGEID":"$languageId"}';
    jsonRequestBody = '{"COUNTRY":"${await Prefs.guestcountry}"}';

    response = await http.post(Uri.parse(FETCHCITY),
        headers: headers, body: jsonRequestBody);
    print(jsonRequestBody);

    print("FetchCityResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response city User Found');
      finalCityList = getcitylist(json.decode(response.body)['status']['CITY']);
      print('cityfetch $finalCityList');
      return finalCityList;
    }
    // else if (response.statusCode == 401) {
    //   print('Response User Not Found');
    // }
    else {
      print('FetchCountryBlock Called Client Failed');
      throw ServerException();
    }
  }

  @override
  Future<List<FetchAreaResponseModel>> checkFetchArea() async {
    http.Response response;
    String jsonRequestBody = '';

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
    List<FetchAreaResponseModel> finalAreaList = <FetchAreaResponseModel>[].obs;

    // jsonRequestBody = '{"Country":"${country}","LANGUAGEID":"$languageId"}';
    jsonRequestBody =
        '{"COUNTRY":"${await Prefs.guestcountry}","CITY":"${await Prefs.guestcity}"}';
// ${await Prefs.guestcountry}
    response = await http.post(Uri.parse(FETCHAREA),
        headers: headers, body: jsonRequestBody);
    print(jsonRequestBody);
    print("FetchAreaResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response User Found');
      finalAreaList = getarealist(json.decode(response.body)['status']['AREA']);
      finalAreaList.sort((a,b){
        return a.AREA_NAME!.toLowerCase().compareTo(b.AREA_NAME!.toLowerCase());

      });
      return finalAreaList;
    }
    // else if (response.statusCode == 401) {
    //   print('Response User Not Found');
    // }
    else {
      print('FetchCountryBlock Called Client Failed');
      throw ServerException();
    }
  }

  getarealist(List<dynamic> temp) {
    List<FetchAreaResponseModel> AreaList = [];
    for (var list in temp) {
      AreaList.add(FetchAreaResponseModel.fromJson(list));
      print('----->${FetchAreaResponseModel.fromJson(list)}');
    }
    print('fetcharea$AreaList');
    return AreaList;
  }

  getcitylist(List<dynamic> temp) {
    List<FetchCityResponseModel> finalList = [];
    for (var list in temp) {
      finalList.add(FetchCityResponseModel.fromJson(list));
      print('----->${FetchCityResponseModel.fromJson(list)}');
    }
    print('fetchcity$finalList');
    return finalList;
  }
}
