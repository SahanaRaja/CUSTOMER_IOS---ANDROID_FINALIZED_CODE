import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'delivery_slot.dart';

class Status extends Equatable {
  final String? deliveryType;
  final String? message;
  final DeliverySlot? deliverySlot;
  final int? result;

  const Status({
    this.deliveryType,
    this.message,
    this.deliverySlot,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        deliveryType: data['DELIVERY_TYPE'] as String?,
        message: data['Message'] as String?,
        deliverySlot: data['delivery_slot'] == null
            ? null
            : DeliverySlot.fromMap(
                data['delivery_slot'] as Map<String, dynamic>),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'DELIVERY_TYPE': deliveryType,
        'Message': message,
        'delivery_slot': deliverySlot?.toMap(),
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
  List<Object?> get props {
    return [
      deliveryType,
      message,
      deliverySlot,
      result,
    ];
  }
}
