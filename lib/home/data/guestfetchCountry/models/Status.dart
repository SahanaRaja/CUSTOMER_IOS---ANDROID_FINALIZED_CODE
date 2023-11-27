

// import 'dart:convert';

// import 'package:customer_assist/home/data/guestfetchCountry/models/Guest_fetchcountry_response_model.dart';
// import 'package:equatable/equatable.dart';

// //import 'item.dart';

// class CountryStatus extends Equatable {
  
//   final String? message;
  
//   final List<CountryList>? countrylist;
  
//   final int? result;

//   const CountryStatus({
    
//     this.message,
    
//     this.countrylist,
   
//     this.result,
//   });

//   factory CountryStatus.fromMap(Map<String, dynamic> data) => CountryStatus(
        
//         message: data['Message'] as String?,
        
//         countrylist: (data['COUNTRY'] as List<dynamic>?)
//             ?.map((e) => CountryList.fromMap(e as Map<String, dynamic>))
//             .toList(),
            
//         result: data['Result'] as int?,
//       );

//   Map<String, dynamic> toMap() => {
        
//         'Message': message,
       
//         'COUNTRY': countrylist?.map((e) => e.toMap()).toList(),
        
//         'Result': result,
//       };

//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [ResStatus].
//   factory CountryStatus.fromJson(String data) {
//     return CountryStatus.fromMap(json.decode(data) as Map<String, dynamic>);
//   }

//   /// `dart:convert`
//   ///
//   /// Converts [ResStatus] to a JSON string.
//   String toJson() => json.encode(toMap());

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
     
//       message,
//       countrylist,
//       result,
//     ];
//   }
// }







// // // // ignore_for_file: annotate_overrides, overridden_fields
// // import 'dart:convert';

// // import 'package:customer_assist/home/data/guestfetchCountry/models/Guest_fetchcountry_response_model.dart';
// // import 'package:equatable/equatable.dart';

// // class Status {
// //   String message;
// //   List<GuestFetchCountryResponseModel>? country;
// //   int result;

// //   Status(
// //       {required this.message, required this.country, required this.result});

// //   factory Status.fromMap(Map<String, dynamic> json) {
// //     var countryList = json['COUNTRY'] as List;
// //     List<GuestFetchCountryResponseModel> Countryname =
// //         countryList.map((item) => GuestFetchCountryResponseModel.fromMap(item)).toList();

// //     return Status(
// //       message: json['Message'],
// //       country: Countryname,
// //       result: json['Result'],
// //     );
// //   }
// // }