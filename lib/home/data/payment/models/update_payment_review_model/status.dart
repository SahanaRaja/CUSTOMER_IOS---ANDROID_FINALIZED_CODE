import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'items.dart';

class Status extends Equatable {
  final String? deliveryType;
  final String? expressType;
  final String? coupon;
  final String? normalType;
  final String? message;
  final int? normalValue;
  final String? couponValue;
  final Items? items;
  final int? expressValue;
  final int? result;

  const Status({
    this.deliveryType,
    this.expressType,
    this.coupon,
    this.normalType,
    this.message,
    this.normalValue,
    this.couponValue,
    this.items,
    this.expressValue,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        deliveryType: data['DELIVERY_TYPE'] as String?,
        expressType: data['EXPRESS_TYPE'] as String?,
        coupon: data['COUPON'] as String?,
        normalType: data['NORMAL_TYPE'] as String?,
        message: data['Message'] as String?,
        normalValue: data['NORMAL_VALUE'] as int?,
        couponValue: data['COUPON_VALUE'] as String?,
        items: data['ITEMS'] == null
            ? null
            : Items.fromMap(data['ITEMS'] as Map<String, dynamic>),
        expressValue: data['EXPRESS_VALUE'] as int?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'DELIVERY_TYPE': deliveryType,
        'EXPRESS_TYPE': expressType,
        'COUPON': coupon,
        'NORMAL_TYPE': normalType,
        'Message': message,
        'NORMAL_VALUE': normalValue,
        'COUPON_VALUE': couponValue,
        'ITEMS': items?.toMap(),
        'EXPRESS_VALUE': expressValue,
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
  List<Object?> get props {
    return [
      deliveryType,
      expressType,
      coupon,
      normalType,
      message,
      normalValue,
      couponValue,
      items,
      expressValue,
      result,
    ];
  }
}
