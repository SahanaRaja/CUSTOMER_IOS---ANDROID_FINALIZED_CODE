import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/sas_move_shopping_list_model/item.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/sub_category_items.dart';
import 'package:equatable/equatable.dart';


class ProductItem extends Equatable {
 
 
  final List<SubCategoryItems>? items;

  const ProductItem({this.items});

  factory ProductItem.fromMap(Map<String, dynamic> data) => ProductItem(
       
       
        items: (data['status']['ITEMS'] as List<dynamic>?)
            ?.map((e) => SubCategoryItems.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
       
 
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory ProductItem.fromJson(String data) {
    return ProductItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [items];
}
