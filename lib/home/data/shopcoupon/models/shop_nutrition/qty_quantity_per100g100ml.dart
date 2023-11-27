import 'dart:convert';

import 'package:equatable/equatable.dart';

class QtyQuantityPer100g100ml extends Equatable {
  final String? energy;
  final String? protein;
  final String? totalFat;
  final String? saturatedFat;
  final String? carbohydrate;
  final String? sugars;
  final String? sodium;

  const QtyQuantityPer100g100ml({
    this.energy,
    this.protein,
    this.totalFat,
    this.saturatedFat,
    this.carbohydrate,
    this.sugars,
    this.sodium,
  });

  factory QtyQuantityPer100g100ml.fromMap(Map<String, dynamic> data) {
    return QtyQuantityPer100g100ml(
      energy: data['Energy'] as String?,
      protein: data['Protein'] as String?,
      totalFat: data['Total Fat'] as String?,
      saturatedFat: data['Saturated Fat'] as String?,
      carbohydrate: data['Carbohydrate'] as String?,
      sugars: data['Sugars'] as String?,
      sodium: data['Sodium'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'Energy': energy,
        'Protein': protein,
        'Total Fat': totalFat,
        'Saturated Fat': saturatedFat,
        'Carbohydrate': carbohydrate,
        'Sugars': sugars,
        'Sodium': sodium,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QtyQuantityPer100g100ml].
  factory QtyQuantityPer100g100ml.fromJson(String data) {
    return QtyQuantityPer100g100ml.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [QtyQuantityPer100g100ml] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      energy,
      protein,
      totalFat,
      saturatedFat,
      carbohydrate,
      sugars,
      sodium,
    ];
  }
}
