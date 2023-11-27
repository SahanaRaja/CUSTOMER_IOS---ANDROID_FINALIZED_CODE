import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/res_category.dart';


class ResSubItem {
  final String? subcategoryName;
  final String? subcategoryCode;
  final List<ResSubCategoryItems>? resSubcategory;

  const ResSubItem(
      {this.subcategoryName, this.subcategoryCode, this.resSubcategory});

  factory ResSubItem.fromMap(Map<String, dynamic> data) => ResSubItem(
        subcategoryName: data['subcategory_name'] as String?,
        subcategoryCode: data['subcategory_code'] as String?,
        resSubcategory: (data['items'] as List<dynamic>?)
            ?.map((e) => ResSubCategoryItems.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'subcategory_name': subcategoryName,
        'subcategory_code': subcategoryCode,
        'items': resSubcategory?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResSubItem].
  factory ResSubItem.fromJson(String data) {
    return ResSubItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResSubItem] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [subcategoryName, subcategoryCode, resSubcategory];
}
