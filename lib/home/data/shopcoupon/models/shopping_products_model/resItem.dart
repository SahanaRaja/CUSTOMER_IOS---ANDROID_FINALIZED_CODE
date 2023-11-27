import 'dart:convert';


import 'res_subCategory.dart';

class RestaurantItem {
  final String? categoryName;
  final String? categoryCode;
  final List<ResSubItem>? subcategory;

  const RestaurantItem(
      {this.categoryName, this.categoryCode, this.subcategory});

  factory RestaurantItem.fromMap(Map<String, dynamic> data) => RestaurantItem(
        categoryName: data['category_name'] as String?,
        categoryCode: data['category_code'] as String?,
        subcategory: (data['subcategory'] as List<dynamic>?)
            ?.map((e) => ResSubItem.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'category_name': categoryName,
        'category_code': categoryCode,
        'subcategory': subcategory?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantItem].
  factory RestaurantItem.fromJson(String data) {
    return RestaurantItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantItem] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [categoryName, categoryCode, subcategory];
}
