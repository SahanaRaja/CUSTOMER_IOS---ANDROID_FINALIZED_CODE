// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../models/chatty_response_model.dart';

abstract class cHattyRemoteDataSource {
  Future<List<cHattyResponseModel>> checkcHatty();
}

class cHattyRemoteDataSourceImpl extends cHattyRemoteDataSource {
  List<cHattyResponseModel> finalcHattyList = <cHattyResponseModel>[].obs;

  @override
  Future<List<cHattyResponseModel>> checkcHatty() async {
    http.Response response;
    String jsonRequestBody = '';

    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKENS
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    // jsonRequestBody = '{"Shop_Id":"${await Prefs.shopId}"}';

    response = await http.post(Uri.parse(CHATTYQUSANS),
        headers: headers, body: jsonRequestBody);
    print("**********");
    print(jsonRequestBody);
    print("**********");

    print("cHattyResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response cHatty User Found');
      finalcHattyList =
          getcHattylist(json.decode(response.body)['status']['QUESTION']);
      print('cHattyfetch $finalcHattyList');
      return finalcHattyList;
    } else {
      print('FetchChattyBlock Called Client Failed');
      throw ServerException();
    }
  }

  getcHattylist(List<dynamic> temp) {
    List<cHattyResponseModel> finalList = [];
    for (var list in temp) {
      finalList.add(cHattyResponseModel.fromJson(list));
      print('----->${cHattyResponseModel.fromJson(list)}');
    }
    print('cHatty$finalList');
    return finalList;
  }
}
