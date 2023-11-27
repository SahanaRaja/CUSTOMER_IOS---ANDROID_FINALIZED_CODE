// ignore_for_file: annotate_overrides, overridden_fields

import 'package:customer_assist/home/domain/fetchcity/entities/fetchAreaentity/fetch_area_response.dart';

class FetchAreaResponseModel extends FetchAreaResponse {
  final String? AREA_NAME;
  final String? PIN_CODE;

  const FetchAreaResponseModel({
    this.AREA_NAME,
    this.PIN_CODE,
  });

  factory FetchAreaResponseModel.fromJson(Map<String, dynamic> json) {
    var status = json;
    return FetchAreaResponseModel(
      AREA_NAME: status["AREA_NAME"] ?? "",
      PIN_CODE: status["PIN_CODE"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "AREA_NAME": AREA_NAME ?? '',
        "PIN_CODE": PIN_CODE ?? '',
      };
  @override
  List<Object> get props => [
        AREA_NAME!,
        PIN_CODE!,
      ];
}
