import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'slot_datum.dart';

class DeliveryDatum extends Equatable {
  final String? deliveryDate;
  final String? deliveryDateColor;
  final List<SlotDatum>? slotData;

  const DeliveryDatum({
    this.deliveryDate,
    this.deliveryDateColor,
    this.slotData,
  });

  factory DeliveryDatum.fromMap(Map<String, dynamic> data) => DeliveryDatum(
        deliveryDate: data['delivery_date'] as String?,
        deliveryDateColor: data['delivery_date_color'] as String?,
        slotData: (data['slot_data'] as List<dynamic>?)
            ?.map((e) => SlotDatum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'delivery_date': deliveryDate,
        'delivery_date_color': deliveryDateColor,
        'slot_data': slotData?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeliveryDatum].
  factory DeliveryDatum.fromJson(String data) {
    return DeliveryDatum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeliveryDatum] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [deliveryDate, deliveryDateColor, slotData];
}
