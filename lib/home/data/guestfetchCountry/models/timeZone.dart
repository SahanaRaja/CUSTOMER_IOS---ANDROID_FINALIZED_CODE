
import 'dart:convert';


class TimeZone {
  final String? hOUR;
 final String? mINS;
 final String? fUNCTION;
 final String? nAME;
  

  TimeZone({
    this.hOUR,
    this.mINS,
    this.fUNCTION,
    this.nAME
    
  });

  factory TimeZone.fromMap(Map<String, dynamic> data) {
    return TimeZone(
      hOUR: data['HOUR'] ?? '',
      mINS: data['MINS'] ?? '',
      fUNCTION: data['FUNCTION'] ?? '',
      nAME: data['NAME'] as String?,
      
    );
  }

  Map<String, dynamic> toMap() => {
        'HOUR': hOUR,
        'MINS': mINS,
        'FUNCTION': fUNCTION,
        'NAME': nAME,
        
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResSubCategoryItems].
  factory TimeZone.fromJson(String data) {
    return TimeZone.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResSubCategoryItems] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      hOUR,
      mINS,
      fUNCTION,
      nAME
    ];
  }
}
























// // ignore_for_file: annotate_overrides, overridden_fields

// //import 'package:mobile_pos/home/domain/guestfetchCountry/entities/Guest_fetchcountry_response.dart';

// import 'package:customer_assist/home/domain/guestfetchCountry/entities/Guest_fetchcountry_response.dart';

// class TimeZone extends GuestFetchCountryResponse{
//   final String hOUR;
//  final String mINS;
//  final String fUNCTION;
//  final String nAME;

//  const TimeZone({
//     required this.hOUR, required this.mINS, required this.fUNCTION, required this.nAME
//   });

//   factory TimeZone.fromJson(Map<String, dynamic> json) {
//     return TimeZone(
//       hOUR: json["HOUR"] ,
//        mINS: json["MINS"] ,
//         fUNCTION: json["FUNCTION"],
//          nAME: json["NAME"] ,
//     );
//   }
// }