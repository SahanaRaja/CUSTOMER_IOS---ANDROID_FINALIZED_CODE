import 'dart:convert';

import 'package:equatable/equatable.dart';

class SlotExpiryTime extends Equatable {
  final String? slotExpiry;

  const SlotExpiryTime({this.slotExpiry});

  factory SlotExpiryTime.fromMap(Map<String, dynamic> data) {
    return SlotExpiryTime(
      slotExpiry: data['slot_expiry'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'slot_expiry': slotExpiry,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SlotExpiryTime].
  factory SlotExpiryTime.fromJson(String data) {
    return SlotExpiryTime.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SlotExpiryTime] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [slotExpiry];
}
