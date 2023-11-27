// ignore_for_file: annotate_overrides, overridden_fields

import 'package:customer_assist/home/domain/fetchcity/entities/fetchCityentity/fetch_ctiy_reponse.dart';

class FetchCityResponseModel extends FetchCityResponse {
  final String? CITY_CODE;
  final String? CITY_NAME;

  const FetchCityResponseModel({
    this.CITY_CODE,
    this.CITY_NAME,
  });

  factory FetchCityResponseModel.fromJson(Map<String, dynamic> json) {
    var status = json;
    return FetchCityResponseModel(
      CITY_CODE: status["CITY_CODE"] ?? "",
      CITY_NAME: status["CITY_NAME"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "CITY_CODE": CITY_CODE ?? '',
        "CITY_NAME": CITY_NAME ?? '',
      };
  @override
  List<Object> get props => [
        CITY_CODE!,
        CITY_NAME!,
      ];
}
