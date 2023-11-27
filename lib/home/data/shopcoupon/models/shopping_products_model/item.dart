import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'subcategory.dart';

class Item extends Equatable {
  final String? categoryName;
  final String? categoryCode;
  final List<Subcategory>? subcategory;

  const Item({this.categoryName, this.categoryCode, this.subcategory});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        categoryName: data['category_name'] as String?,
        categoryCode: data['category_code'] as String?,
        subcategory: (data['subcategory'] as List<dynamic>?)
            ?.map((e) => Subcategory.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'category_name': categoryName,
        'category_code': categoryCode,
        'subcategory': subcategory?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [categoryName, categoryCode, subcategory];
}
