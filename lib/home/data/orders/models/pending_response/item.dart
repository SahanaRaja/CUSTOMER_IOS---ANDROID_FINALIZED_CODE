import 'dart:convert';

import 'package:equatable/equatable.dart';

class Shops extends Equatable {
  
  final int? qtyCount;
  final String? shopImage;
  final int? totalCost;
  final String? shopId;
  final String? shopName;
  final int? itemCount;
  

  const Shops({
    this.qtyCount,
    this.shopImage,
    this.totalCost,
    this.shopId,
    this.shopName,
    this.itemCount,
     
  });

  factory Shops.fromMap(Map<String, dynamic> data) => Shops(
        qtyCount: data['QTY_COUNT'] as int?,
        shopImage: data['SHOP_IMAGE'] as String?,
        totalCost: data['TOTAL_COST'] as int?,
        shopId: data['SHOP_ID'] as String?,
        shopName: data['SHOP_NAME'] as dynamic,
        itemCount: data['ITEM_COUNT'] as int?,
         
      );

  Map<String, dynamic> toMap() => {
        'QTY_COUNT': qtyCount,
        'SHOP_IMAGE': shopImage,
        'TOTAL_COST': totalCost,
        'SHOP_ID': shopId,
        'SHOP_NAME': shopName,
        'ITEM_COUNT': itemCount,
         
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Shops.fromJson(String data) {
    return Shops.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      qtyCount,
      shopImage,
      totalCost,
      shopId,
      shopName,
      itemCount,
      
    ];
  }
}
