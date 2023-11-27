// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class FetchCountryResponse extends Equatable {
  final String? countryflag;
  final String? phonenumber_format;
  final String? phone_code;
  final String? message;
  final String? logo;
  final String? logo_text;
  final int? result;

  const FetchCountryResponse(
      {this.countryflag,
      this.message,
      this.phonenumber_format,
      this.phone_code,
      this.logo,
      this.logo_text,
      this.result});

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
