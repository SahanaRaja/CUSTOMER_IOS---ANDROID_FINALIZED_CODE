// ignore_for_file: non_constant_identifier_names

import 'package:customer_assist/home/data/guestfetchCountry/models/timeZone.dart';
import 'package:equatable/equatable.dart';

class GuestFetchCountryResponse extends Equatable {
  final String? COUNTRY_NAME;
  final String? COUNTRY_CODE;
   final List<TimeZone>? timeZone;
   final String? countryFlag;
   final String? countryFlagId;
   final String? countryFlagStatus;

  const GuestFetchCountryResponse({
    this.COUNTRY_NAME,
    this.COUNTRY_CODE,
     this.timeZone,
     this.countryFlag,
     this.countryFlagId,
     this.countryFlagStatus
  });

  @override
  List<Object> get props => [
        COUNTRY_NAME!,
        COUNTRY_CODE!,
        timeZone!,countryFlagId!,countryFlagStatus!,countryFlag!
      ];
}
