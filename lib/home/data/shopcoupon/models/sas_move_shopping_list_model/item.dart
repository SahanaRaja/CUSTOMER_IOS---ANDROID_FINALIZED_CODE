import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'move_shop_list_model.dart';

class Item extends Equatable {
  final String? subcategoryName;
  final List<MoveShopListModel>? items;
  final String? subcategoryCode;

  const Item({this.subcategoryName, this.items, this.subcategoryCode});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        subcategoryName: data['subcategory_name'] as String?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => MoveShopListModel.fromMap(e as Map<String, dynamic>))
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
  List<Object?> get props => [subcategoryName, items, subcategoryCode];
}
