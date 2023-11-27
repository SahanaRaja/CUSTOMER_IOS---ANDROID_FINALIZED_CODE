import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'express_delivery.dart';
import 'normal_delivery.dart';
import 'oldorder_slot.dart';
import 'slot_expiry_time.dart';

class DeliverySlot extends Equatable {
  final List<NormalDelivery>? normalDelivery;
  final List<ExpressDelivery>? expressDelivery;
  final SlotExpiryTime? slotExpiryTime;
  final OldorderSlot? oldorderSlot;

  const DeliverySlot({
    this.normalDelivery,
    this.expressDelivery,
    this.slotExpiryTime,
    this.oldorderSlot,
  });

  factory DeliverySlot.fromMap(Map<String, dynamic> data) => DeliverySlot(
        normalDelivery: (data['normal_delivery'] as List<dynamic>?)
            ?.map((e) => NormalDelivery.fromMap(e as Map<String, dynamic>))
            .toList(),
        expressDelivery: (data['express_delivery'] as List<dynamic>?)
            ?.map((e) => ExpressDelivery.fromMap(e as Map<String, dynamic>))
            .toList(),
        slotExpiryTime: data['slot_expiry_time'] == null
            ? null
            : SlotExpiryTime.fromMap(
                data['slot_expiry_time'] as Map<String, dynamic>),
        oldorderSlot: data['oldorder_slot'] == null
            ? null
            : OldorderSlot.fromMap(
                data['oldorder_slot'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'normal_delivery': normalDelivery?.map((e) => e.toMap()).toList(),
        'express_delivery': expressDelivery?.map((e) => e.toMap()).toList(),
        'slot_expiry_time': slotExpiryTime?.toMap(),
        'oldorder_slot': oldorderSlot?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeliverySlot].
  factory DeliverySlot.fromJson(String data) {
    return DeliverySlot.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeliverySlot] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      normalDelivery,
      expressDelivery,
      slotExpiryTime,
      oldorderSlot,
    ];
  }
}
