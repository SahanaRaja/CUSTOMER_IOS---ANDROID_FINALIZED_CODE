import 'dart:convert';

import 'package:equatable/equatable.dart';

class SlotDatum extends Equatable {
  final String? deliveryCharge;
  final String? displayColor;
  final int? slotStatus;
  final String? deliverySlot;

  const SlotDatum({
    this.deliveryCharge,
    this.displayColor,
    this.slotStatus,
    this.deliverySlot,
  });

  factory SlotDatum.fromMap(Map<String, dynamic> data) => SlotDatum(
        deliveryCharge: data['delivery_charge'] as String?,
        displayColor: data['display_color'] as String?,
        slotStatus: data['slot_status'] as int?,
        deliverySlot: data['delivery_slot'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'delivery_charge': deliveryCharge,
        'display_color': displayColor,
        'slot_status': slotStatus,
        'delivery_slot': deliverySlot,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SlotDatum].
  factory SlotDatum.fromJson(String data) {
    return SlotDatum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SlotDatum] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      deliveryCharge,
      displayColor,
      slotStatus,
      deliverySlot,
    ];
  }
}
