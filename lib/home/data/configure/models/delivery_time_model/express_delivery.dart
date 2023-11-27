import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'delivery_datum.dart';
import 'screen_message.dart';

class ExpressDelivery extends Equatable {
  final ScreenMessage? screenMessage;
  final String? chargeType;
  final int? chargeValue;
  final List<DeliveryDatum>? deliveryData;

  const ExpressDelivery({
    this.screenMessage,
    this.chargeType,
    this.chargeValue,
    this.deliveryData,
  });

  factory ExpressDelivery.fromMap(Map<String, dynamic> data) {
    return ExpressDelivery(
      screenMessage: data['Screen_message'] == null
          ? null
          : ScreenMessage.fromMap(
              data['Screen_message'] as Map<String, dynamic>),
      chargeType: data['Charge_type'] as String?,
      chargeValue: data['Charge_value'] as int?,
      deliveryData: (data['delivery_data'] as List<dynamic>?)
          ?.map((e) => DeliveryDatum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'Screen_message': screenMessage?.toMap(),
        'Charge_type': chargeType,
        'Charge_value': chargeValue,
        'delivery_data': deliveryData?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExpressDelivery].
  factory ExpressDelivery.fromJson(String data) {
    return ExpressDelivery.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExpressDelivery] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      screenMessage,
      chargeType,
      chargeValue,
      deliveryData,
    ];
  }
}
