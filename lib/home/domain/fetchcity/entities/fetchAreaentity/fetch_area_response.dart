// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class FetchAreaResponse extends Equatable {
  final String? AREA_NAME;
  final String? PIN_CODE;

  const FetchAreaResponse({
    this.AREA_NAME,
    this.PIN_CODE,
  });

  @override
  List<Object> get props => [
        AREA_NAME!,
        PIN_CODE!,
      ];
}
