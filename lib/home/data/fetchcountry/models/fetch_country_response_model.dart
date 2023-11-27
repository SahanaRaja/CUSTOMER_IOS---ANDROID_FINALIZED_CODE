// ignore_for_file: annotate_overrides, overridden_fields

import '../../../domain/fetchcountry/entities/fetch_country_reponse.dart';

class FetchCountryResponseModel extends FetchCountryResponse {
  final String? countryflag;
  final String? message;
  final String? phonenumber_format;
  final String? phone_code;
  final String? logo;
  final String? logo_text;
  final int? result;

  const FetchCountryResponseModel(
      {this.countryflag,
      this.message,
      this.phonenumber_format,
      this.phone_code,
      this.logo,
      this.logo_text,
      this.result});

  factory FetchCountryResponseModel.fromJson(Map<String, dynamic> json) {
    var status = json["status"];
    return FetchCountryResponseModel(
      countryflag: status["Country_flag"] ?? "",
      phonenumber_format: status["phonenumber_format"] ?? '',
      message: status["Message"] ?? "",
      phone_code: status["phone_code"] ?? "",
      logo: status["Logo"] ?? "",
      logo_text: status["Country_flag_text"] ?? "",
      result: status["Result"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "Country_flag": countryflag ?? '',
        "phonenumber_format": phonenumber_format ?? '',
        "Message": message ?? '',
        "phone_code": phone_code ?? '',
        "Logo": logo ?? '',
        "Country_flag_text": logo_text ?? '',
        "Result": result ?? ''
      };
  @override
  List<Object> get props => [
        countryflag!,
        phonenumber_format!,
        message!,
        phone_code!,
        logo!,
        logo_text!,
        result!
      ];
}
