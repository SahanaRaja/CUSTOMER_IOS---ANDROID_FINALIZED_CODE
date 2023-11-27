import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/app_urls.dart';
import '../../../../core/error/exceptions.dart';
import '../models/pos_master_response_model.dart';

abstract class PosMasterSelectionRemoteDataSource {
  Future<PosMasterSelectionDetailsResponseModel> checkPosMasterSelection();
}

class PosMasterSelectionRemoteDataSourceImpl
    extends PosMasterSelectionRemoteDataSource {
  @override
  Future<PosMasterSelectionDetailsResponseModel>
      checkPosMasterSelection() async {
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

    response =
        await http.post(Uri.parse(POSMASTERSELECTIONAPI), headers: headers);

    print("PosMasterSelectionResponseBody: ${response.body}");
    if (response.statusCode == 200) {
      print('Response POSMASTERSELECTION Found');
      print(PosMasterSelectionDetailsResponseModel.fromJson(
          json.decode(response.body)));
      return PosMasterSelectionDetailsResponseModel.fromJson(
          json.decode(response.body));
    } else if (response.statusCode == 401) {
      print('Response POSMASTERSELECTION Not Found');
      return PosMasterSelectionDetailsResponseModel.fromJson(
          json.decode(response.body));
    } else {
      print('POSMASTERSELECTIONBLOCK Called Client Failed');
      throw ServerException();
    }
  }
}
