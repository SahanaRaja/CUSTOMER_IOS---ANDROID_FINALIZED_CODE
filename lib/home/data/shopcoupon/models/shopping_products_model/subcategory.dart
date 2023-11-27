import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/sub_category_items.dart';
import 'package:equatable/equatable.dart';

class Subcategory extends Equatable {
  final String? subcategoryName;
  final List<SubCategoryItems>? items;
  final String? subcategoryCode;

  const Subcategory({
    this.subcategoryName,
    this.items,
    this.subcategoryCode,
  });

  factory Subcategory.fromMap(Map<String, dynamic> data) => Subcategory(
        subcategoryName: data['subcategory_name'] as String?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => SubCategoryItems.fromMap(e as Map<String, dynamic>))
            .toList(),
        subcategoryCode: data['subcategory_code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'subcategory_name': subcategoryName,
        'items': items?.map((e) => e.toMap()).toList(),
        'subcategory_code': subcategoryCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Subcategory].
  factory Subcategory.fromJson(String data) {
    return Subcategory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Subcategory] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [subcategoryName, items, subcategoryCode];
}
