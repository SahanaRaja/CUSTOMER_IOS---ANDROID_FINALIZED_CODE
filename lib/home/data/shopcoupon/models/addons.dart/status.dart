import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/addons.dart/additem.dart';
import 'package:equatable/equatable.dart';


class Status extends Equatable {
  final String? message;
  final List<AddOns>? aDDON;
  final String? mAINITEMCODE;
  final String? mAINITEMNAME;
  final int? result;

  const Status({this.message, this.aDDON,this.mAINITEMCODE,this.mAINITEMNAME, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        message: data['Message'] as String?,
        aDDON: (data['ADDON'] as List<dynamic>?)
            ?.map((e) => AddOns.fromMap(e as Map<String, dynamic>))
            .toList(),
        result: data['Result'] as int?,
        mAINITEMCODE: data['MAIN_ITEM_CODE'] as String?,
        mAINITEMNAME: data['MAIN_ITEM_NAME'] as String?,
        
      );

  Map<String, dynamic> toMap() => {
        'Message': message,
        'ADDON': aDDON?.map((e) => e.toMap()).toList(),
        'Result': result,
        'MAIN_ITEM_CODE':mAINITEMCODE,
        'MAIN_ITEM_NAME':mAINITEMNAME
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
  List<Object?> get props => [message, aDDON, result,mAINITEMCODE,mAINITEMNAME];
}
