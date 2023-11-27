
// import 'dart:convert';

// // import 'package:customer_assist/home/data/guestfetchCountry/models/Status.dart';
// // import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/Res_Status.dart';
// import 'package:customer_assist/home/data/guestfetchCountry/models/Status.dart';
// import 'package:equatable/equatable.dart';

// import 'session.dart';
// //import 'status.dart';

// class CountryResponseModel extends Equatable {
//   final Session? session;
//   final CountryStatus? status;

//   const CountryResponseModel({this.session, this.status});

//   factory CountryResponseModel.fromMap(Map<String, dynamic> data) {
//     return CountryResponseModel(
//       session: data['session'] == null
//           ? null
//           : Session.fromMap(data['session'] as Map<String, dynamic>),
//       status: data['status'] == null
//           ? null
//           : CountryStatus.fromMap(data['status'] as Map<String, dynamic>),
//     );
//   }

//   Map<String, dynamic> toMap() => {
//         'session': session?.toMap(),
//         'status': status?.toMap(),
//       };

//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [RestaurantProductsModel].
//   factory CountryResponseModel.fromJson(String data) {
//     return CountryResponseModel.fromMap(
//         json.decode(data) as Map<String, dynamic>);
//   }

//   /// `dart:convert`
//   ///
//   /// Converts [RestaurantProductsModel] to a JSON string.
//   String toJson() => json.encode(toMap());

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [session, status];
// }



















// // import 'dart:convert';

// // import 'package:equatable/equatable.dart';

// // import 'session.dart';
// // import 'status.dart';

// // class ZipCodeResponse extends Equatable {
// //   final Session? session;
// //   final Status? status;

// //   const ZipCodeResponse({this.session, this.status});

// //   factory ZipCodeResponse.fromMap(Map<String, dynamic> data) {
// //     return ZipCodeResponse(
// //       session: data['session'] == null
// //           ? null
// //           : Session.fromMap(data['session'] as Map<String, dynamic>),
// //       status: data['status'] == null
// //           ? null
// //           : Status.fromMap(data['status'] as Map<String, dynamic>),
// //     );
// //   }

// //   Map<String, dynamic> toMap() => {
// //         'session': session?.toMap(),
// //         'status': status?.toMap(),
// //       };

// //   /// `dart:convert`
// //   ///
// //   /// Parses the string and returns the resulting Json object as [MobileResponse].
// //   factory ZipCodeResponse.fromJson(String data) {
// //     return ZipCodeResponse.fromMap(json.decode(data) as Map<String, dynamic>);
// //   }

// //   /// `dart:convert`
// //   ///
// //   /// Converts [MobileResponse] to a JSON string.
// //   String toJson() => json.encode(toMap());

// //   @override
// //   bool get stringify => true;

// //   @override
// //   List<Object?> get props => [session, status];
// // }
