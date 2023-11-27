import 'dart:convert';

import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final String? productQty;
  final String? productCode;
  final String? uom;
  final String? productName;
  final String? imageUrl;

  const ItemModel({
    this.productQty,
    this.productCode,
    this.uom,
    this.productName,
    this.imageUrl,
  });

  factory ItemModel.fromMap(Map<String, dynamic> data) => ItemModel(
        productQty: data['Product_qty'] as String?,
        productCode: data['Product_code'] as String?,
        uom: data['UOM'] as String?,
        productName: data['Product_name'] as String?,
        imageUrl: data['IMAGE_URL'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Product_qty': productQty,
        'Product_code': productCode,
        'UOM': uom,
        'Product_name': productName,
        'IMAGE_URL': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory ItemModel.fromJson(String data) {
    return ItemModel.fromMap(json.decode(data) as Map<String, dynamic>);
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
      productQty,
      productCode,
      uom,
      productName,
      imageUrl,
    ];
  }
}
