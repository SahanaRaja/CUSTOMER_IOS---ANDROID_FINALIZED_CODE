// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class FetchCityResponse extends Equatable {
  final String? CITY_CODE;
  final String? CITY_NAME;

  const FetchCityResponse({
    this.CITY_CODE,
    this.CITY_NAME,
  });

  @override
  List<Object> get props => [
        CITY_CODE!,
        CITY_NAME!,
      ];
}
