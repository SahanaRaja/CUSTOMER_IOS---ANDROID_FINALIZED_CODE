import 'dart:convert';

import 'package:customer_assist/core/error/exceptions.dart';
import 'package:customer_assist/home/data/currencyCalulator/models/CurrencyCode.dart';
import 'package:customer_assist/home/data/currencyCalulator/models/CurrencyPrice.dart';
import 'package:http/http.dart' as http;

abstract class FetchCurrencyDetailsRemoteRepository {
  Future<CurrencyCode> fetchCurrencyCodeDetails();

  Future<dynamic> fetchCurrencyPriceDetails(
      String fromCurrency, String toCurrency);
}

class FetchCurrencyDetailsRemoteDataImpl
    extends FetchCurrencyDetailsRemoteRepository {
  @override
  Future<CurrencyCode> fetchCurrencyCodeDetails() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": 'cce618086bfccd93b47dd9d4cf06f52778515b5d'
    };

    http.Response response = await http.get(
        Uri.parse('http://www.convertmymoney.com/rates.json'),
        headers: headers);
    if (response.statusCode == 200) {
      return CurrencyCode.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CurrencyPrice> fetchCurrencyPriceDetails(
      String fromCurrency, String toCurrency) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": 'cce618086bfccd93b47dd9d4cf06f52778515b5d'
    };
    var jsonRequestBody = '{ "FCUR": $fromCurrency ,  "TCUR":$toCurrency }';
    http.Response response = await http.post(
        Uri.parse(
            'https://www.retailecoss.com/retailecos/api/ApiCurrencyConverter'),
        headers: headers,
        body: jsonRequestBody);
    print('${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      return CurrencyPrice.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
