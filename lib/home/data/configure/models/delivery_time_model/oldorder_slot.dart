import 'dart:convert';

import 'package:equatable/equatable.dart';

class OldorderSlot extends Equatable {
  final String? orderDate;
  final String? orderSlot;

  const OldorderSlot({this.orderDate, this.orderSlot});

  factory OldorderSlot.fromMap(Map<String, dynamic> data) => OldorderSlot(
        orderDate: data['order_date'] as String?,
        orderSlot: data['order_slot'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'order_date': orderDate,
        'order_slot': orderSlot,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OldorderSlot].
  factory OldorderSlot.fromJson(String data) {
    return OldorderSlot.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OldorderSlot] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [orderDate, orderSlot];
}
