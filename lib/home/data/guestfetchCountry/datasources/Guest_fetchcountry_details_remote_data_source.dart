import 'dart:convert';

import 'package:customer_assist/home/data/guestfetchCountry/model2/zipcode.dart';
import 'package:customer_assist/home/data/guestfetchCountry/models/Guest_fetchcountry_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../models/timingResponse.dart';

abstract class GuestFetchCountryRemoteDataSource {
  Future<List<GuestFetchCountryResponseModel>>checkGuestFetchCountry();
  Future<ZipCodeResponse> checkZipcode(String postalController);
}

class GuestFetchCountryRemoteDataSourceImpl
    extends GuestFetchCountryRemoteDataSource {
  @override
  Future<List<GuestFetchCountryResponseModel>> checkGuestFetchCountry() async {
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
    List<GuestFetchCountryResponseModel> finalCountryList =
        <GuestFetchCountryResponseModel>[].obs;

    // jsonRequestBody = '{"Country":"${country}","LANGUAGEID":"$languageId"}';
    // jsonRequestBody = '{"Country":"India"}';

    response = await http.post(Uri.parse(FETCH_COUNTRY_NAME), headers: headers);

    print("GuestFetchCountryResponseBody: " + response.body);
    if (response.statusCode == 200) {
      print('Response User Found');
      finalCountryList =
          getcontrylist(json.decode(response.body)['status']['COUNTRY']);
           finalCountryList.sort((a, b) {
             return a.COUNTRY_NAME!.toLowerCase().compareTo(b.COUNTRY_NAME!.toLowerCase());
           },);
      return finalCountryList;
    }
    // else if (response.statusCode == 401) {
    //   print('Response User Not Found');
    // }
    else {
      print('FetchCountryBlock Called Client Failed');
      throw ServerException();
    }
    // response = await http.post(Uri.parse(FETCH_COUNTRY_NAME), headers: headers);

    // print("GuestFetchCountryResponseBody: ${response.body}");
    //  try {
    //   //print(http.post(Uri.parse(NEWDEVICECHECK)));
    //  // print("ZipcodeRequestBody: " + jsonRequestBody);
    //   print("ZipcodeResponseBody: ${response.body}");
    //   if (response.statusCode == 200) {
    //     print('Response User Found');
    //     print(ZipCodeResponse.fromJson(response.body));
    //     return CountryResponseModel.fromJson(response.body);
        
    //   } else if (response.statusCode == 401) {
    //     print('Response User Not Found');
    //     return CountryResponseModel.fromJson(response.body);
    //   } else {
    //     print('ZipcodeBlock Called Client Failed');
    //     throw ServerException();
    //   }
    // } on Exception {
    //   throw ServerException();
    // }
    // if (response.statusCode == 200) {
    //   print('Response User Found');
    //   finalCountryList =
    //       getcontrylist(json.decode(response.body)['status']['COUNTRY']);
    //   return finalCountryList;
    // }
    // // else if (response.statusCode == 401) {
    // //   print('Response User Not Found');
    // // }
    // else {
    //   print('FetchCountryBlock Called Client Failed');
    //   throw ServerException();
    // }
  }

  getcontrylist(List<dynamic> temp) {
    List<GuestFetchCountryResponseModel> finalList = [];
    for (var list in temp) {
      finalList.add(GuestFetchCountryResponseModel.fromJson(list));
      print(
          '----->' + GuestFetchCountryResponseModel.fromJson(list).toString());
    }
    print('sofi' + finalList.toString());
    return finalList;
  }

@override
  Future<ZipCodeResponse> checkZipcode(
      String postalController) async {
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
    jsonRequestBody =
        '{"ZIPCODE":"$postalController"}';

    response = await http.post(Uri.parse(FETCH_ZIP_CODE),
        headers: headers, body: jsonRequestBody);

    try {
      //print(http.post(Uri.parse(NEWDEVICECHECK)));
      print("ZipcodeRequestBody: $jsonRequestBody");
      print("ZipcodeResponseBody: ${response.body}");
      if (response.statusCode == 200) {
        print('Response User Found');
        print(ZipCodeResponse.fromJson(response.body));
        return ZipCodeResponse.fromJson(response.body);
      } else if (response.statusCode == 401) {
        print('Response User Not Found');
        return ZipCodeResponse.fromJson(json.decode(response.body));
      } else {
        print('ZipcodeBlock Called Client Failed');
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }



   

  
}
