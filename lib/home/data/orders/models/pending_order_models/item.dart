import 'dart:convert';

import 'package:equatable/equatable.dart';

class Items extends Equatable {
  final String? uom;
  final String? itemCode;
  final dynamic itemQty;
  final String? itemName;
  final dynamic itemPrice;
  final String? imageUr1;
  final int? discountValue;
  final dynamic tax2;
  final dynamic tax1;
  final dynamic tax6;
  final dynamic tax5;
  final String? discountType;
  final dynamic tax4;
  final dynamic tax3;

  const Items({
    this.uom,
    this.itemCode,
    this.itemQty,
    this.itemName,
    this.itemPrice,
    this.imageUr1,
     this.discountType,
      this.discountValue,
      this.tax1,
      this.tax2,
      this.tax3,
      this.tax4,
      this.tax5,
      this.tax6
  });

  factory Items.fromMap(Map<String, dynamic> data) => Items(
        uom: data['UOM'] as String?,
        itemCode: data['Item_code'] as String?,
        itemQty: data['Item_Qty'] as String?,
        itemName: data['Item_Name'] as String?,
        itemPrice: data['Item_Price'] as dynamic,
        imageUr1: data['Image_Ur1'] as String?,
         discountType: data['DISCOUNT_TYPE'] as String?,
        discountValue: data['DISCOUNT_VALUE'] as int?,
        tax1: data['TAX1'] as dynamic,
        tax2: data['TAX2'] as dynamic,
        tax3: data['TAX3'] as dynamic,
        tax4: data['TAX4'] as dynamic,
        tax5: data['TAX5'] as dynamic,
        tax6: data['TAX6'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'UOM': uom,
        'Item_code': itemCode,
        'Item_Qty': itemQty,
        'Item_Name': itemName,
        'Item_Price': itemPrice,
        'Image_Ur1': imageUr1,
         'DISCOUNT_TYPE': discountType,
        'DISCOUNT_VALUE': discountValue,
        'TAX1': tax1,
        'TAX2': tax2,
        'TAX3': tax3,
        'TAX4': tax4,
        'TAX5': tax5,
        'TAX6': tax6
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Items.fromJson(String data) {
    return Items.fromMap(json.decode(data) as Map<String, dynamic>);
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
      uom,
      itemCode,
      itemQty,
      itemName,
      itemPrice,
      imageUr1,
       discountType,
      discountValue,
      tax1,
      tax2,
      tax3,
      tax4,
      tax5,
      tax6
    ];
  }
}
