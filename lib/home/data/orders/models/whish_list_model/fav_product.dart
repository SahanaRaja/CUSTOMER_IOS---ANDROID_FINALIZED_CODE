import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'item.dart';

class FavProduct extends Equatable {
  final String? shopUrl;
  final String? shopId;
  final String? shopName;
  final List<WhishItems>? items;

  const FavProduct({this.shopUrl, this.shopId, this.shopName, this.items});

  factory FavProduct.fromMap(Map<String, dynamic> data) => FavProduct(
        shopUrl: data['SHOP_URL'] as String?,
        shopId: data['SHOP_ID'] as String?,
        shopName: data['SHOP_NAME'] as String?,
        items: (data['ITEMS'] as List<dynamic>?)
            ?.map((e) => WhishItems.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'SHOP_URL': shopUrl,
        'SHOP_ID': shopId,
        'SHOP_NAME': shopName,
        'ITEMS': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FavProduct].
  factory FavProduct.fromJson(String data) {
    return FavProduct.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FavProduct] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [shopUrl, shopId, shopName, items];
}
