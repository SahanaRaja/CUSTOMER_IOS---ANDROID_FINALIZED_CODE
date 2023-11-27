import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/resItem.dart';
import 'package:equatable/equatable.dart';
import 'item.dart';

class ResItem extends Equatable {
  final String? supercategoryName;

  final String? supercategoryCode;

  final List<RestaurantItem>? category;

  const ResItem(
      {this.supercategoryName, this.category, this.supercategoryCode});

  factory ResItem.fromMap(Map<String, dynamic> data) => ResItem(
        supercategoryName: data['SUPER_CATEGORY_NAME'] as String?,
        supercategoryCode: data['SUPER_CATEGORY_CODE'] as String?,
        category: (data['category'] as List<dynamic>?)
            ?.map((e) => RestaurantItem.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'SUPER_CATEGORY_NAME': supercategoryName,
        'SUPER_CATEGORY_CODE': supercategoryCode,
        'category': category?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory ResItem.fromJson(String data) {
    return ResItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [supercategoryName, supercategoryCode, category];
}
