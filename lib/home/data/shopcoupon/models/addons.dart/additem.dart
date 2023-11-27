import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddOns extends Equatable {
  final  String? aDDONNAME;
   final int? aDDONTAX;
   final dynamic aDDONPRICE;
   final int? aDDONQTY;
   final int? aDDONGROUPTYPE;
   final String? aDDONCODE;

 const AddOns({
    this.aDDONNAME, 
    this.aDDONTAX, 
    this.aDDONPRICE, 
    this.aDDONQTY, 
    this.aDDONGROUPTYPE,
     this.aDDONCODE
    
  });

  factory AddOns.fromMap(Map<String, dynamic> data) => AddOns(
       aDDONNAME : data['ADDON_NAME'],
        aDDONTAX : data['ADDON_TAX'],
        aDDONPRICE : data['ADDON_PRICE'],
        aDDONQTY : data['ADDON_QTY'],
        aDDONGROUPTYPE : data['ADDON_GROUP_TYPE'],
        aDDONCODE : data['ADDON_CODE'],
      );

  Map<String, dynamic> toMap() => {
        'ADDON_NAME': aDDONNAME,
        'ADDON_TAX': aDDONTAX,
        'ADDON_PRICE': aDDONPRICE,
        'ADDON_QTY': aDDONQTY,
        'ADDON_GROUP_TYPE': aDDONGROUPTYPE,
        'ADDON_CODE': aDDONCODE,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory AddOns.fromJson(String data) {
    return AddOns.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      aDDONNAME,
      aDDONTAX,
      aDDONCODE,
      aDDONGROUPTYPE,
      aDDONPRICE,
      aDDONQTY
    ];
  }
}
