import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'percentage_daily_intake.dart';
import 'qty_quantity_per100g100ml.dart';
import 'qty_quantity_per_serving.dart';

class ShopNutrition extends Equatable {
  final QtyQuantityPerServing? qtyQuantityPerServing;
  final QtyQuantityPer100g100ml? qtyQuantityPer100g100ml;
  final PercentageDailyIntake? percentageDailyIntake;

  const ShopNutrition({
    this.qtyQuantityPerServing,
    this.qtyQuantityPer100g100ml,
    this.percentageDailyIntake,
  });

  factory ShopNutrition.fromMap(Map<String, dynamic> data) => ShopNutrition(
        qtyQuantityPerServing: data['QtyQuantity per serving'] == null
            ? null
            : QtyQuantityPerServing.fromMap(
                data['QtyQuantity per serving'] as Map<String, dynamic>),
        qtyQuantityPer100g100ml: data['QtyQuantity per 100g / 100ml'] == null
            ? null
            : QtyQuantityPer100g100ml.fromMap(
                data['QtyQuantity per 100g / 100ml'] as Map<String, dynamic>),
        percentageDailyIntake: data['%Percentage daily intake'] == null
            ? null
            : PercentageDailyIntake.fromMap(
                data['%Percentage daily intake'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'QtyQuantity per serving': qtyQuantityPerServing?.toMap(),
        'QtyQuantity per 100g / 100ml': qtyQuantityPer100g100ml?.toMap(),
        '%Percentage daily intake': percentageDailyIntake?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShopNutrition].
  factory ShopNutrition.fromJson(String data) {
    return ShopNutrition.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShopNutrition] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      qtyQuantityPerServing,
      qtyQuantityPer100g100ml,
      percentageDailyIntake,
    ];
  }
}
