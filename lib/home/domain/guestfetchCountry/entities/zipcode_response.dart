// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class ZipcodeResponse extends Equatable {
  final String? zipCode;
  final String? city;
  final String? stateName;
  final String? area;

  const ZipcodeResponse({
    this.city,
   this.zipCode,
   this.stateName,
   this.area
  });

  @override
  List<Object> get props => [
       zipCode!,
        city!,
        stateName!,
        area!
      ];
}
