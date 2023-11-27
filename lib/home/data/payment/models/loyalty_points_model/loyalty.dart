import 'dart:convert';

import 'package:equatable/equatable.dart';

class Loyalty extends Equatable {
  final int? conversionAmount;
  final int? displayOrder;
  var value;
  final String? description;
  final int? conversionPoints;
  final String? currency;

  Loyalty({
    this.conversionAmount,
    this.displayOrder,
    this.value,
    this.description,
    this.conversionPoints,
    this.currency,
  });

  factory Loyalty.fromMap(Map<String, dynamic> data) => Loyalty(
        conversionAmount: data['conversion_amount'] as int?,
        displayOrder: data['display_order'] as int?,
        value: data['Value'],
        description: data['description'] as String?,
        conversionPoints: data['conversion_points'] as int?,
        currency: data['currency'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'conversion_amount': conversionAmount,
        'display_order': displayOrder,
        'Value': value,
        'description': description,
        'conversion_points': conversionPoints,
        'currency': currency,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Loyalty].
  factory Loyalty.fromJson(String data) {
    return Loyalty.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Loyalty] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      conversionAmount,
      displayOrder,
      value,
      description,
      conversionPoints,
      currency,
    ];
  }
}
