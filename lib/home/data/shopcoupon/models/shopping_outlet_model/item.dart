import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final dynamic tax2;
  final dynamic tax1;
  final String? soldBy;
  final int? productMrp;
  final int? availableStockQuanty;
  final int? productRate;
  final int? discountValue;
  final String? productName;
  final dynamic tax6;
  final String? manufacturerName;
  final dynamic tax5;
  final String? discountType;
  final String? productCode;
  final dynamic tax4;
  final dynamic tax3;
  final String? uom;
  final String? netWeight;
  final String? isOfferItem;
  final String? brandName;
  final int? qty;
  final String? weightBy;
  final String? imageUrl;
  final int? isFavoriteItem;
  final String? commonItem;

  const Item({
    this.tax2,
    this.tax1,
    this.soldBy,
    this.productMrp,
    this.availableStockQuanty,
    this.productRate,
    this.discountValue,
    this.productName,
    this.tax6,
    this.manufacturerName,
    this.tax5,
    this.discountType,
    this.productCode,
    this.tax4,
    this.tax3,
    this.uom,
    this.netWeight,
    this.isOfferItem,
    this.brandName,
    this.qty,
    this.weightBy,
    this.imageUrl,
    this.isFavoriteItem,
    this.commonItem,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        tax2: data['TAX2'] as dynamic,
        tax1: data['TAX1'] as dynamic,
        soldBy: data['SOLD_BY'] as String?,
        productMrp: data['PRODUCT_MRP'] as int?,
        availableStockQuanty: data['AVAILABLE_STOCK_QUANTY'] as int?,
        productRate: data['PRODUCT_RATE'] as int?,
        discountValue: data['DISCOUNT_VALUE'] as int?,
        productName: data['PRODUCT_NAME'] as String?,
        tax6: data['TAX6'] as dynamic,
        manufacturerName: data['MANUFACTURER_NAME'] as String?,
        tax5: data['TAX5'] as dynamic,
        discountType: data['DISCOUNT_TYPE'] as String?,
        productCode: data['PRODUCT_CODE'] as String?,
        tax4: data['TAX4'] as dynamic,
        tax3: data['TAX3'] as dynamic,
        uom: data['UOM'] as String?,
        netWeight: data['NET_WEIGHT'] as String?,
        isOfferItem: data['IS_OFFER_ITEM'] as String?,
        brandName: data['BRAND_NAME'] as String?,
        qty: data['QTY'] as int?,
        weightBy: data['WEIGHT_BY'] as String?,
        imageUrl: data['IMAGE_URL'] as String?,
        isFavoriteItem: data['IS_FAVORITE_ITEM'] as int?,
        commonItem: data['COMMON_ITEM'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'TAX2': tax2,
        'TAX1': tax1,
        'SOLD_BY': soldBy,
        'PRODUCT_MRP': productMrp,
        'AVAILABLE_STOCK_QUANTY': availableStockQuanty,
        'PRODUCT_RATE': productRate,
        'DISCOUNT_VALUE': discountValue,
        'PRODUCT_NAME': productName,
        'TAX6': tax6,
        'MANUFACTURER_NAME': manufacturerName,
        'TAX5': tax5,
        'DISCOUNT_TYPE': discountType,
        'PRODUCT_CODE': productCode,
        'TAX4': tax4,
        'TAX3': tax3,
        'UOM': uom,
        'NET_WEIGHT': netWeight,
        'IS_OFFER_ITEM': isOfferItem,
        'BRAND_NAME': brandName,
        'QTY': qty,
        'WEIGHT_BY': weightBy,
        'IMAGE_URL': imageUrl,
        'IS_FAVORITE_ITEM': isFavoriteItem,
        'COMMON_ITEM': commonItem,
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
  List<Object?> get props {
    return [
      tax2,
      tax1,
      soldBy,
      productMrp,
      availableStockQuanty,
      productRate,
      discountValue,
      productName,
      tax6,
      manufacturerName,
      tax5,
      discountType,
      productCode,
      tax4,
      tax3,
      uom,
      netWeight,
      isOfferItem,
      brandName,
      qty,
      weightBy,
      imageUrl,
      isFavoriteItem,
      commonItem,
    ];
  }
}
