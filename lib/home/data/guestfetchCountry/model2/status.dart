// // ignore_for_file: annotate_overrides, overridden_fields
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final String? cITY;
 final String? message;
 final String? zIPCODE;
 final String? pROVIENCE;
 final String? aRea;
 final int? result;
  

  const Status({ 
    this.cITY,
   this.zIPCODE,
   this.pROVIENCE,
   this.aRea,
   this.message,
   this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        cITY: data['CITY'] as String?,
        zIPCODE: data['ZIPCODE'] as String?,
        pROVIENCE: data['PROVIENCE'] as String?,
        aRea: data['AREA'] as String?,
        message: data['Message'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'CITY': cITY ??'',
        'ZIPCODE': zIPCODE ,
        'PROVIENCE': pROVIENCE ?? '',
        'AREA': aRea ?? '',
        'Message': message,
        'Result': result,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Status].
  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Status] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [zIPCODE, pROVIENCE, aRea ,message, result];
}







// import 'package:customer_assist/home/domain/guestfetchCountry/entities/zipcode_response.dart';

// class Status extends ZipcodeResponse {
//  final String? cITY;
//  final String? message;
//  final String? zIPCODE;
//  final String? pROVIENCE;
//  final int? result;
  

//   const Status({
//    this.cITY,
//    this.zIPCODE,
//    this.pROVIENCE,
//    this.message,
//    this.result
   
   
//   });

//   factory Status.fromJson(Map<String, dynamic> json) {
//     var status = json;
//     return Status(
//       zIPCODE: status["ZIPCODE"] ?? "",
//       cITY: status["CITY"] ?? '',
//       pROVIENCE: status["PROVIENCE"] ?? '',
//       message: status["Message"] ?? '',
//       result: status["Result"] ?? 0,

    
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "ZIPCODE": zIPCODE ?? '',
//         "CITY": cITY ?? '',
//         "PROVIENCE": pROVIENCE ??'',
//         "Message": message ??'',
//         "Result": result ?? 0
//       };
//   @override
//   List<Object> get props => [
//         zIPCODE!,
//         cITY!,
//         pROVIENCE!,
//         message!,
//         result!

//       ];
// }
