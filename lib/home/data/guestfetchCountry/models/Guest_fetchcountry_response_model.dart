

// import 'dart:convert';

// import 'package:customer_assist/home/data/guestfetchCountry/models/timeZone.dart';

// //import 'subcategory.dart';

// class CountryList {
//   final String? countryName;
//   final String? countryCode;
//   final List<TimeZone>? timeZone;
//   final String? countryFlagImageid;
//   final String? countryFlagStatus;
//   final String? countryFlag;

//   const CountryList( 
//       {this.countryName, this.countryCode, this.timeZone,this.countryFlagImageid, this.countryFlagStatus,this.countryFlag});

//   factory CountryList.fromMap(Map<String, dynamic> data) => CountryList(
//         countryName: data['COUNTRY_NAME'] as String?,
//         countryCode: data['COUNTRY_CODE'] as String?,
//         countryFlagImageid: data['COUNTRY_FLAG_IMAGE_ID'] as String?,
//         countryFlagStatus: data['COUNTRY_FLAG_STATUS'] as String?,
//         countryFlag: data['COUNTRY_FLAG'] as String?,

//         timeZone: (data['TIME_ZONE'] as List<dynamic>?)
//             ?.map((e) => TimeZone.fromMap(e as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toMap() => {
//         'COUNTRY_NAME': countryName,
//         'COUNTRY_CODE': countryCode,
//         'COUNTRY_FLAG_IMAGE_ID':countryFlagImageid,
//         'COUNTRY_FLAG_STATUS':countryFlagStatus,
//         'COUNTRY_FLAG':countryFlag,
//         'TIME_ZONE': timeZone?.map((e) => e.toMap()).toList(),
//       };

//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as.
//   factory CountryList.fromJson(String data) {
//     return CountryList.fromMap(json.decode(data) as Map<String, dynamic>);
//   }

//   /// `dart:convert`
//   ///
  
//   String toJson() => json.encode(toMap());

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [countryName, countryCode, timeZone,countryFlagImageid,countryFlagStatus,countryFlag];
// }














// import 'package:customer_assist/home/data/guestfetchCountry/models/timeZone.dart';
// import 'package:customer_assist/home/domain/guestfetchCountry/entities/Guest_fetchcountry_response.dart';

// class GuestFetchCountryResponseModel extends GuestFetchCountryResponse {
//   final String? COUNTRY_NAME;
//   final String? COUNTRY_CODE;
//   final List<TimeZone>? timeZone;

//   const GuestFetchCountryResponseModel({
//     this.COUNTRY_NAME,
//     this.COUNTRY_CODE,
//     this.timeZone
//   });

//   factory GuestFetchCountryResponseModel.fromMap(Map<String, dynamic> data) {

//      COUNTRY_NAME: data['category_name'] ??'';
//         COUNTRY_CODE: data['COUNTRY_CODE'] as String?;
//         timeZone: (data['subcategory'] as List<dynamic>?)
//             ?.map((e) => TimeZone.fromMap(e as Map<String, dynamic>))
//             .toList();
//     // var timezone = json['TIME_ZONE'] as List;
//     // List<TimeZone> timezonelist =
//     //     timezone.map((item) => TimeZone.fromJson(item)).toList();

//     return GuestFetchCountryResponseModel(
//       timeZone: timezonelist,
//       COUNTRY_CODE: json['COUNTRY_CODE']??'',
//       COUNTRY_NAME: json['COUNTRY_NAME']??'',
     
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "COUNTRY_NAME": COUNTRY_NAME ?? '',
//         "COUNTRY_CODE": COUNTRY_CODE ?? '',
//         "TIME_ZONE": timeZone ??''
//       };
//   @override
//   List<Object> get props => [
//         COUNTRY_NAME!,
//         COUNTRY_CODE!,
//         timeZone!
//       ];
// }
// ignore_for_file: annotate_overrides, overridden_fields

import 'package:customer_assist/home/domain/guestfetchCountry/entities/Guest_fetchcountry_response.dart';

class GuestFetchCountryResponseModel extends GuestFetchCountryResponse {
  final String? COUNTRY_NAME;
  final String? COUNTRY_CODE;
   final String? countryFlagImageid;
  final String? countryFlagStatus;
  final String? countryFlag;

  const GuestFetchCountryResponseModel({
    this.COUNTRY_NAME,
    this.COUNTRY_CODE,
    this.countryFlagImageid, this.countryFlagStatus,this.countryFlag
  });

  factory GuestFetchCountryResponseModel.fromJson(Map<String, dynamic> json) {
    var status = json;
    return GuestFetchCountryResponseModel(
      COUNTRY_NAME: status["COUNTRY_NAME"] ?? "",
      COUNTRY_CODE: status["COUNTRY_CODE"] ?? '',
      countryFlagImageid: status['COUNTRY_FLAG_IMAGE_ID'] as String?,
        countryFlagStatus: status['COUNTRY_FLAG_STATUS'] as String?,
        countryFlag: status['COUNTRY_FLAG'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "COUNTRY_NAME": COUNTRY_NAME ?? '',
        "COUNTRY_CODE": COUNTRY_CODE ?? '',
        'COUNTRY_FLAG_IMAGE_ID':countryFlagImageid,
        'COUNTRY_FLAG_STATUS':countryFlagStatus,
        'COUNTRY_FLAG':countryFlag,
      };
  @override
  List<Object> get props => [
        COUNTRY_NAME!,
        COUNTRY_CODE!,
        countryFlagImageid!,countryFlagStatus!,countryFlag!
      ];
}
